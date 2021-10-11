part of 'form_forms_bloc.dart';

@freezed
abstract class FormFormsState with _$FormFormsState {
  const factory FormFormsState({
    required Form form,
    required bool showErrorMessages,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<FormFailure, Unit>> saveFailureOrSuccessOption,
  }) = _FormFormsState;

  factory FormFormsState.initial() => FormFormsState(
        form: Form.empty(),
        showErrorMessages: false,
        isEditing: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
