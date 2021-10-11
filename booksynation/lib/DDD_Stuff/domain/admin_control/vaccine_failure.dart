import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine_failure.freezed.dart';

@freezed
abstract class VaccineFailure with _$VaccineFailure {
  const factory VaccineFailure.unexpected() = _UnexpectedWeb;
  const factory VaccineFailure.insufficientPermission() =
      _InsufficientPermissionWeb;
  const factory VaccineFailure.unableToUpdate() = _UnableToUpdateWeb;
}
