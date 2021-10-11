import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_failure.freezed.dart';

@freezed
abstract class FormFailure with _$FormFailure {
  const factory FormFailure.unexpected() = _Unexpected;
  const factory FormFailure.insufficientPermission() = _InsufficientPermission;
  const factory FormFailure.unableToUpdate() = _UnableToUpdate;
}
