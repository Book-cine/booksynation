// import 'dart:ui';
import 'package:kt_dart/kt.dart';
import 'package:booksynation_form/domain/core/failures.dart';
import 'package:booksynation_form/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:booksynation_form/domain/core/value_objects.dart';
// import 'package:notes_firebase_ddd_course/domain/core/failures.dart';
// import 'package:notes_firebase_ddd_course/domain/core/value_objects.dart';
// import 'package:notes_firebase_ddd_course/domain/core/value_transformers.dart';
// import 'package:notes_firebase_ddd_course/domain/core/value_validators.dart';

class FormEntry extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 40;

  factory FormEntry(String input) {
    return FormEntry._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const FormEntry._(this.value);
}

class LongFormEntry extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 120;

  factory LongFormEntry(String input) {
    return LongFormEntry._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const LongFormEntry._(this.value);
}

class List20<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 20;

  factory List20(KtList<T> input) {
    return List20._(
      validateMaxListLength(input, maxLength),
    );
  }

  const List20._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}

// class NoteBody extends ValueObject<String> {
//   @override
//   final Either<ValueFailure<String>, String> value;

//   static const maxLength = 1000;

//   factory NoteBody(String input) {
//     assert(input != null);
//     return NoteBody._(
//       validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
//     );
//   }

//   const NoteBody._(this.value);
// }


// class NoteColor extends ValueObject<Color> {
//   static const List<Color> predefinedColors = [
//     Color(0xfffafafa), // canvas
//     Color(0xfffa8072), // salmon
//     Color(0xfffedc56), // mustard
//     Color(0xffd0f0c0), // tea
//     Color(0xfffca3b7), // flamingo
//     Color(0xff997950), // tortilla
//     Color(0xfffffdd0), // cream
//   ];

//   @override
//   final Either<ValueFailure<Color>, Color> value;

//   factory NoteColor(Color input) {
//     assert(input != null);
//     return NoteColor._(
//       right(makeColorOpaque(input)),
//     );
//   }

//   const NoteColor._(this.value);
// }

