import 'package:kt_dart/kt.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:booksynation_form/domain/admin_control/vaccine.dart';
import 'package:booksynation_form/domain/admin_control/vaccine_failure.dart';
import 'package:booksynation_form/infrastructure/admin_control/vaccine_dtos.dart';
import 'package:booksynation_form/domain/admin_control/i_vaccine_repository.dart';

@LazySingleton(as: IVaccineRepository)
class VaccineRepository implements IVaccineRepository {
  final FirebaseFirestore _firestore;

  VaccineRepository(this._firestore);

  @override
  Stream<Either<VaccineFailure, KtList<Vaccine>>> watchAllWeb() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.formCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map( 
          (snapshot) => right<VaccineFailure, KtList<Vaccine>>(
            snapshot.docs
                .map((doc) => VaccineDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('permission-denied')) {
        return left(const VaccineFailure.insufficientPermission());
      } else {
        // log.error(e.toString());
        return left(const VaccineFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<VaccineFailure, KtList<Vaccine>>> watchUncompletedWeb() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.formCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => VaccineDto.fromFirestore(doc).toDomain()),
        )
        .map(
          (forms) => right<VaccineFailure, KtList<Vaccine>>(
            forms
                .where((form) =>
                    form.allergies.getOrCrash().toImmutableList()),
        )
        .map(
          (forms) => right<VaccineFailure, KtList<Vaccine>>(
            forms
                .where((vaccine) =>
                    vaccine.comorbidities.getOrCrash()
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('permission-denied')) {
        return left(const VaccineFailure.insufficientPermission());
      } else {
        // log.error(e.toString());
        return left(const VaccineFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<VaccineFailure, Unit>> createWeb(Vaccine vaccine) async {
    try {
      final userDoc = await _firestore.userDocument();
      final vaccineDto = VaccineDto.fromDomain(vaccine);

      await userDoc.vaccineCollection.doc(vaccineDto.id).set(vaccineDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('permission-denied')) {
        return left(const VaccineFailure.insufficientPermission());
      } else {
        return left(const VaccineFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<VaccineFailure, Unit>> updateWeb(Vaccine vaccine) async {
    try {
      final userDoc = await _firestore.userDocument();
      final vaccineDto = VaccineDto.fromDomain(vaccine);

      await userDoc.vaccineCollection.doc(vaccineDto.id).update(vaccineDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('permission-denied')) {
        return left(const VaccineFailure.insufficientPermission());
      } else if (e.message.contains('not-found')) {
        return left(const VaccineFailure.unableToUpdate());
      } else {
        return left(const VaccineFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<VaccineFailure, Unit>> deleteWeb(Vaccine vaccine) async {
    try {
      final userDoc = await _firestore.userDocument();
      final vaccineId = vaccine.id.getOrCrash();

      await userDoc.vaccineCollection.doc(vaccineId).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('permission-denied')) {
        return left(const VaccineFailure.insufficientPermission());
      } else if (e.message.contains('not-found')) {
        return left(const VaccineFailure.unableToUpdate());
      } else {
        return left(const VaccineFailure.unexpected());
      }
    }
  }
}
