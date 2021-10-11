import 'package:booksynation_form/domain/admin_control/vaccine.dart';
import 'package:booksynation_form/domain/admin_control/vaccine_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

abstract class IVaccineRepository {
  Stream<Either<VaccineFailure, KtList<Vaccine>>> watchAllWeb();
  Stream<Either<VaccineFailure, KtList<Vaccine>>> watchUncompletedWeb();
  Future<Either<VaccineFailure, Unit>> createWeb(Vaccine form);
  Future<Either<VaccineFailure, Unit>> updateWeb(Vaccine form);
  Future<Either<VaccineFailure, Unit>> deleteWeb(Vaccine form);
}
