// import 'package:kt_dart/collection.dart';
import 'package:booksynation_form/domain/core/failures.dart';
import 'package:booksynation_form/domain/core/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booksynation_form/domain/admin_control/value_objects_web.dart';

part 'vaccine.freezed.dart';

@freezed
abstract class Vaccine implements _$Vaccine {
  const Vaccine._();

  factory Vaccine({
    required UniqueId id,
    required VaccineEntry name,
    required VaccineEntry dateStart,
    required VaccineEntry dateEnd,
    required VaccineAmount currentStock,
    required VaccineAmount maxStock,
  }) = _Vaccine;

  factory Vaccine.empty() => Vaccine(
        id: UniqueId(),
        name: VaccineEntry(''),
        dateStart: VaccineEntry(''),
        dateEnd: VaccineEntry(''),
        currentStock: VaccineAmount(0),
        maxStock: VaccineAmount(1),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(dateStart.failureOrUnit)
        .andThen(dateEnd.failureOrUnit)
        .andThen(currentStock.failureOrUnit)
        .andThen(maxStock.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
