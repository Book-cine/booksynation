import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:booksynation_form/domain/patient_form/form.dart';
import 'package:booksynation_form/domain/patient_form/form_failure.dart';

abstract class IFormRepository {
  Stream<Either<FormFailure, KtList<Form>>> watchAll();
  Stream<Either<FormFailure, KtList<Form>>> watchUncompleted();
  Future<Either<FormFailure, Unit>> create(Form form);
  Future<Either<FormFailure, Unit>> update(Form form);
  Future<Either<FormFailure, Unit>> delete(Form form);
}
