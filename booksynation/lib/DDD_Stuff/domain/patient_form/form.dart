import 'package:booksynation_form/domain/core/failures.dart';
import 'package:booksynation_form/domain/core/value_objects.dart';
import 'package:booksynation_form/domain/patient_form/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
// import 'package:notes_firebase_ddd_course/domain/core/failures.dart';
// import 'package:notes_firebase_ddd_course/domain/core/value_objects.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/todo_item.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/value_objects.dart';

part 'form.freezed.dart';

@freezed
abstract class Form implements _$Form {
  const Form._();

  const factory Form({
    required UniqueId id,
    // required FormEntry patientType,
    required FormEntry firstName,
    required FormEntry middleName,
    required FormEntry lastName,
    required FormEntry suffix,
    required FormEntry sex,
    required FormEntry bday,
    required FormEntry age,
    required FormEntry civStatus,
    required FormEntry philhealth,
    required LongFormEntry address,
    required FormEntry region,
    required FormEntry province,
    required FormEntry city,
    required FormEntry brgy,
    required FormEntry zip,
    required FormEntry contact,
    required FormEntry email,
    required FormEntry covclass,
    required FormEntry employed,
    required FormEntry pregnant,
    required FormEntry disability,
    required FormEntry interactedCovid,
    required FormEntry isDiagnosed,
    required FormEntry diagnosedDate,
    required List20<String> allergies,
    required List20<String> comorbidities,
    required LongFormEntry otherAllergies,
    required LongFormEntry others,

    // @required NoteBody body,
    // @required NoteColor color,
    // @required List3<TodoItem> todos,
  }) = _Form;

  factory Form.empty() => Form(
        id: UniqueId(),
        // patientType: FormEntry(''),
        firstName: FormEntry(''),
        middleName: FormEntry(''),
        lastName: FormEntry(''),
        suffix: FormEntry(''),
        sex: FormEntry(''),
        bday: FormEntry(''),
        age: FormEntry(''),
        civStatus: FormEntry(''),
        philhealth: FormEntry(''),
        address: LongFormEntry(''),
        region: FormEntry(''),
        province: FormEntry(''),
        city: FormEntry(''),
        brgy: FormEntry(''),
        zip: FormEntry(''),
        contact: FormEntry(''),
        email: FormEntry(''),
        covclass: FormEntry(''),
        employed: FormEntry(''),
        pregnant: FormEntry(''),
        disability: FormEntry(''),
        interactedCovid: FormEntry(''),
        isDiagnosed: FormEntry(''),
        diagnosedDate: FormEntry(''),
        allergies: List20(emptyList()),
        comorbidities: List20(emptyList()),
        otherAllergies: LongFormEntry(''),
        others: LongFormEntry(''),

        // body: NoteBody(''),
        // color: NoteColor(NoteColor.predefinedColors[0]),
        // todos: List3(emptyList()),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return firstName.failureOrUnit
        .andThen(middleName.failureOrUnit)
        .andThen(lastName.failureOrUnit)
        .andThen(suffix.failureOrUnit)
        .andThen(sex.failureOrUnit)
        .andThen(bday.failureOrUnit)
        .andThen(age.failureOrUnit)
        .andThen(civStatus.failureOrUnit)
        .andThen(philhealth.failureOrUnit)
        .andThen(address.failureOrUnit)
        .andThen(region.failureOrUnit)
        .andThen(province.failureOrUnit)
        .andThen(city.failureOrUnit)
        .andThen(brgy.failureOrUnit)
        .andThen(zip.failureOrUnit)
        .andThen(contact.failureOrUnit)
        .andThen(email.failureOrUnit)
        .andThen(covclass.failureOrUnit)
        .andThen(employed.failureOrUnit)
        .andThen(pregnant.failureOrUnit)
        .andThen(disability.failureOrUnit)
        .andThen(interactedCovid.failureOrUnit)
        .andThen(isDiagnosed.failureOrUnit)
        .andThen(diagnosedDate.failureOrUnit)
        .andThen(allergies.failureOrUnit)
        .andThen(comorbidities.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
