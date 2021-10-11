part of 'vaccine_forms_bloc.dart';

@freezed
abstract class VaccineFormsState with _$VaccineFormsState {
  const factory VaccineFormsState({
    required Vaccine vaccine,
    required bool showErrorMessages,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<VaccineFailure, Unit>> saveFailureOrSuccessOption,
  }) = _VaccineFormsState;

  factory VaccineFormsState.initialWeb() => VaccineFormsState(
        vaccine: Vaccine.empty(),
        showErrorMessages: false,
        isEditing: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
