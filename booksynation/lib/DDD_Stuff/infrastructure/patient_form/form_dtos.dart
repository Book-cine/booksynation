import 'dart:ui';

import 'package:flutter/material.dart' hide Form;
import 'package:kt_dart/kt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booksynation_form/domain/patient_form/form.dart';
import 'package:booksynation_form/domain/core/value_objects.dart';
import 'package:booksynation_form/domain/patient_form/value_objects.dart';
// import 'package:notes_firebase_ddd_course/domain/core/value_objects.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/note.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/todo_item.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/value_objects.dart';

part 'form_dtos.freezed.dart';
part 'form_dtos.g.dart';

@freezed
abstract class FormDto implements _$FormDto {
  const FormDto._();

  const factory FormDto({
    // @JsonKey(ignore: true) String id,
    required String id,
    // required FormEntry patientType,
    required String firstName,
    required String middleName,
    required String lastName,
    required String suffix,
    required String sex,
    required String bday,
    required String age,
    required String civStatus,
    required String philhealth,
    required String address,
    required String region,
    required String province,
    required String city,
    required String brgy,
    required String zip,
    required String contact,
    required String email,
    required String covclass,
    required String employed,
    required String pregnant,
    required String disability,
    required String interactedCovid,
    required String isDiagnosed,
    required String diagnosedDate,
    required List<String> allergies,
    required List<String> comorbidities,
    required String otherAllergies,
    required String others,
    required FieldValue serverTimeStamp,
    // required @ServerTimestampConverter() FieldValue serverTimeStamp,

    // @required String body,
    // @required int color,
    // @required List<TodoItemDto> todos,
  }) = _FormDto;

  factory FormDto.fromDomain(Form form) {
    return FormDto(
      id: form.id.getOrCrash(),
      // patientType: FormEntry(''),
      firstName: form.firstName.getOrCrash(),
      middleName: form.middleName.getOrCrash(),
      lastName: form.lastName.getOrCrash(),
      suffix: form.suffix.getOrCrash(),
      sex: form.sex.getOrCrash(),
      bday: form.bday.getOrCrash(),
      age: form.age.getOrCrash(),
      civStatus: form.civStatus.getOrCrash(),
      philhealth: form.philhealth.getOrCrash(),
      address: form.address.getOrCrash(),
      region: form.region.getOrCrash(),
      province: form.province.getOrCrash(),
      city: form.city.getOrCrash(),
      brgy: form.brgy.getOrCrash(),
      zip: form.zip.getOrCrash(),
      contact: form.contact.getOrCrash(),
      email: form.email.getOrCrash(),
      covclass: form.covclass.getOrCrash(),
      employed: form.employed.getOrCrash(),
      pregnant: form.pregnant.getOrCrash(),
      disability: form.disability.getOrCrash(),
      interactedCovid: form.interactedCovid.getOrCrash(),
      isDiagnosed: form.isDiagnosed.getOrCrash(),
      diagnosedDate: form.diagnosedDate.getOrCrash(),
      allergies: form.allergies.getOrCrash().asList(),
      comorbidities: form.comorbidities.getOrCrash().asList(),
      otherAllergies: form.otherAllergies.getOrCrash(),
      others: form.others.getOrCrash(),
      serverTimeStamp: FieldValue.serverTimestamp(),
      // body: form.body.getOrCrash(),
      // color: form.color.getOrCrash().value,
      // todos: form.todos
      //     .getOrCrash()
      //     .map(
      //       (todoItem) => TodoItemDto.fromDomain(todoItem),
      //     )
      //     .asList(), //just ignore map since list elements are just strings
    );
  }

  Form toDomain() {
    return Form(
      id: UniqueId.fromUniqueString(id),
      firstName: FormEntry(firstName),
      middleName: FormEntry(middleName),
      lastName: FormEntry(lastName),
      suffix: FormEntry(suffix),
      sex: FormEntry(sex),
      bday: FormEntry(bday),
      age: FormEntry(age),
      civStatus: FormEntry(civStatus),
      philhealth: FormEntry(philhealth),
      address: LongFormEntry(address),
      region: FormEntry(region),
      province: FormEntry(province),
      city: FormEntry(city),
      brgy: FormEntry(brgy),
      zip: FormEntry(zip),
      contact: FormEntry(contact),
      email: FormEntry(email),
      covclass: FormEntry(covclass),
      employed: FormEntry(employed),
      pregnant: FormEntry(pregnant),
      disability: FormEntry(disability),
      interactedCovid: FormEntry(interactedCovid),
      isDiagnosed: FormEntry(isDiagnosed),
      diagnosedDate: FormEntry(diagnosedDate),
      allergies:
          List20(allergies.map((dto) => dto.toString()).toImmutableList()),
      comorbidities:
          List20(comorbidities.map((dto) => dto.toString()).toImmutableList()),
      otherAllergies: LongFormEntry(otherAllergies),
      others: LongFormEntry(others),
    );
  }

  // factory FormDto.fromJson(Map<String, dynamic> json) =>
  //     _$FormDtoFromJson(json);

  factory FormDto.fromFirestore(AsyncSnapshot doc) {
    return doc.data.data().copyWith(id: doc.data.id);
  }

  // factory FormDto.fromFirestore(QueryDocumentSnapshot doc) {
  //   return doc.data().copyWith(id: doc.data.id);
  // }
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}

// @freezed
// abstract class TodoItemDto implements _$TodoItemDto {
//   const TodoItemDto._();

//   const factory TodoItemDto({
//     @required String id,
//     @required String name,
//     @required bool done,
//   }) = _TodoItemDto;

//   factory TodoItemDto.fromDomain(TodoItem todoItem) {
//     return TodoItemDto(
//       id: todoItem.id.getOrCrash(),
//       name: todoItem.name.getOrCrash(),
//       done: todoItem.done,
//     );
//   }

//   TodoItem toDomain() {
//     return TodoItem(
//       id: UniqueId.fromUniqueString(id),
//       name: TodoName(name),
//       done: done,
//     );
//   }

//   factory TodoItemDto.fromJson(Map<String, dynamic> json) =>
//       _$TodoItemDtoFromJson(json);

