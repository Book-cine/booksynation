import 'package:booksynation_form/domain/patient_form/form.dart';
import 'package:booksynation_form/domain/patient_form/form_failure.dart';
import 'package:booksynation_form/domain/patient_form/i_form_repository.dart';
import 'package:booksynation_form/infrastructure/core/firestore_helpers.dart';
import 'package:booksynation_form/infrastructure/patient_form/form_dtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/i_note_repository.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/note.dart';
// import 'package:notes_firebase_ddd_course/infrastructure/core/firestore_helpers.dart';
// import 'package:notes_firebase_ddd_course/infrastructure/notes/note_dtos.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: IFormRepository)
class FormRepository implements IFormRepository {
  final FirebaseFirestore _firestore;

  FormRepository(this._firestore);

  @override
  Stream<Either<FormFailure, KtList<Form>>> watchAll() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.formCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map( 
          (snapshot) => right<FormFailure, KtList<Form>>(
            snapshot.docs
                .map((doc) => FormDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('permission-denied')) {
        return left(const FormFailure.insufficientPermission());
      } else {
        // log.error(e.toString());
        return left(const FormFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<FormFailure, KtList<Form>>> watchUncompleted() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.formCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => FormDto.fromFirestore(doc).toDomain()),
        )
        .map(
          (forms) => right<FormFailure, KtList<Form>>(
            forms
                .where((form) =>
                    form.allergies.getOrCrash().toImmutableList()),
        )
        .map(
          (forms) => right<FormFailure, KtList<Form>>(
            forms
                .where((form) =>
                    form.comorbidities.getOrCrash()
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('permission-denied')) {
        return left(const FormFailure.insufficientPermission());
      } else {
        // log.error(e.toString());
        return left(const FormFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<FormFailure, Unit>> create(Form form) async {
    try {
      final userDoc = await _firestore.userDocument();
      final formDto = FormDto.fromDomain(form);

      await userDoc.formCollection.doc(formDto.id).set(formDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('permission-denied')) {
        return left(const FormFailure.insufficientPermission());
      } else {
        return left(const FormFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<FormFailure, Unit>> update(Form form) async {
    try {
      final userDoc = await _firestore.userDocument();
      final formDto = FormDto.fromDomain(form);

      await userDoc.formCollection.doc(formDto.id).update(formDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('permission-denied')) {
        return left(const FormFailure.insufficientPermission());
      } else if (e.message.contains('not-found')) {
        return left(const FormFailure.unableToUpdate());
      } else {
        return left(const FormFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<FormFailure, Unit>> delete(Form form) async {
    try {
      final userDoc = await _firestore.userDocument();
      final formId = form.id.getOrCrash();

      await userDoc.formCollection.doc(formId).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('permission-denied')) {
        return left(const FormFailure.insufficientPermission());
      } else if (e.message.contains('not-found')) {
        return left(const FormFailure.unableToUpdate());
      } else {
        return left(const FormFailure.unexpected());
      }
    }
  }
}
