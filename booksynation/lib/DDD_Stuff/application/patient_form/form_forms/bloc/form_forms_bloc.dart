import 'dart:async';
// import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booksynation_form/domain/patient_form/form_failure.dart';
import 'package:booksynation_form/domain/patient_form/i_form_repository.dart';
import 'package:booksynation_form/domain/patient_form/value_objects.dart';
import 'package:booksynation_form/domain/patient_form/form.dart';

// import 'package:notes_firebase_ddd_course/domain/notes/i_note_repository.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/note.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/value_objects.dart';
// import 'package:notes_firebase_ddd_course/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'form_forms_event.dart';
part 'form_forms_state.dart';
part 'form_forms_bloc.freezed.dart';

@injectable
class FormFormsBloc extends Bloc<FormFormsEvent, FormFormsState> {
  final IFormRepository _formRepository;

  FormFormsBloc(this._formRepository) : super(FormFormsState.initial());

  @override
  Stream<FormFormsState> mapEventToState(
    FormFormsEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield e.initialFormOption.fold(
          () => state,
          (initialForm) => state.copyWith(
            form: initialForm,
            isEditing: true,
          ),
        );
      },
      firstNameChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(firstName: FormEntry(e.firstName)),
          saveFailureOrSuccessOption: none(),
        );
      },
      middleNameChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(middleName: FormEntry(e.middleName)),
          saveFailureOrSuccessOption: none(),
        );
      },
      lastNameChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(lastName: FormEntry(e.lastName)),
          saveFailureOrSuccessOption: none(),
        );
      },
      suffixChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(suffix: FormEntry(e.suffix)),
          saveFailureOrSuccessOption: none(),
        );
      },
      sexChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(sex: FormEntry(e.sex)),
          saveFailureOrSuccessOption: none(),
        );
      },
      bdayChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(bday: FormEntry(e.bday)),
          saveFailureOrSuccessOption: none(),
        );
      },
      ageChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(age: FormEntry(e.age)),
          saveFailureOrSuccessOption: none(),
        );
      },
      civStatusChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(civStatus: FormEntry(e.civStatus)),
          saveFailureOrSuccessOption: none(),
        );
      },
      philhealthChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(philhealth: FormEntry(e.philhealth)),
          saveFailureOrSuccessOption: none(),
        );
      },
      addressChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(address: LongFormEntry(e.address)),
          saveFailureOrSuccessOption: none(),
        );
      },
      regionChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(region: FormEntry(e.region)),
          saveFailureOrSuccessOption: none(),
        );
      },
      provinceChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(province: FormEntry(e.province)),
          saveFailureOrSuccessOption: none(),
        );
      },
      cityChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(city: FormEntry(e.city)),
          saveFailureOrSuccessOption: none(),
        );
      },
      brgyChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(brgy: FormEntry(e.brgy)),
          saveFailureOrSuccessOption: none(),
        );
      },
      zipChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(zip: FormEntry(e.zip)),
          saveFailureOrSuccessOption: none(),
        );
      },
      contactChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(contact: FormEntry(e.contact)),
          saveFailureOrSuccessOption: none(),
        );
      },
      emailChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(email: FormEntry(e.email)),
          saveFailureOrSuccessOption: none(),
        );
      },
      covclassChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(covclass: FormEntry(e.covclass)),
          saveFailureOrSuccessOption: none(),
        );
      },
      employedChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(employed: FormEntry(e.employed)),
          saveFailureOrSuccessOption: none(),
        );
      },
      pregnantChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(pregnant: FormEntry(e.pregnant)),
          saveFailureOrSuccessOption: none(),
        );
      },
      disabilityChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(disability: FormEntry(e.disability)),
          saveFailureOrSuccessOption: none(),
        );
      },
      interactedCovidChanged: (e) async* {
        yield state.copyWith(
          form: state.form
              .copyWith(interactedCovid: FormEntry(e.interactedCovid)),
          saveFailureOrSuccessOption: none(),
        );
      },
      isDiagnosedChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(isDiagnosed: FormEntry(e.isDiagnosed)),
          saveFailureOrSuccessOption: none(),
        );
      },
      diagnosedDateChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(diagnosedDate: FormEntry(e.diagnosedDate)),
          saveFailureOrSuccessOption: none(),
        );
      },
      allergiesChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(allergies: List20(e.allergies)),
          saveFailureOrSuccessOption: none(),
        );
      },
      comorbiditiesChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(comorbidities: List20(e.comorbidities)),
          saveFailureOrSuccessOption: none(),
        );
      },
      otherAllergiesChanged: (e) async* {
        yield state.copyWith(
          form: state.form
              .copyWith(otherAllergies: LongFormEntry(e.otherAllergies)),
          saveFailureOrSuccessOption: none(),
        );
      },
      othersChanged: (e) async* {
        yield state.copyWith(
          form: state.form.copyWith(others: LongFormEntry(e.others)),
          saveFailureOrSuccessOption: none(),
        );
      },
      saved: (e) async* {
        Either<FormFailure, Unit> failureOrSuccess;

        yield state.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        );

        if (state.form.failureOption.isNone()) {
          failureOrSuccess = state.isEditing
              ? await _formRepository.update(state.form)
              : await _formRepository.create(state.form);
        } else {
          //TODO: Check here if saving is broken
          failureOrSuccess =
              const FormFailure.unableToUpdate() as Either<FormFailure, Unit>;
        }

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}


// colorChanged: (e) async* {
      //   yield state.copyWith(
      //     note: state.note.copyWith(color: NoteColor(e.color)),
      //     saveFailureOrSuccessOption: none(),
      //   );
      // },
      // todosChanged: (e) async* {
      //   yield state.copyWith(
      //     note: state.note.copyWith(
      //       todos: List3(e.todos.map((primitive) => primitive.toDomain())),
      //     ),
      //     saveFailureOrSuccessOption: none(),
      //   );
      // },