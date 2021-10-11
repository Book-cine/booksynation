// import 'dart:ui';
import 'package:kt_dart/kt.dart';
import 'package:dartz/dartz.dart';
import 'package:booksynation_form/domain/core/failures.dart';
import 'package:booksynation_form/domain/core/value_validators.dart';
import 'package:booksynation_form/domain/core/value_objects.dart';

class VaccineEntry extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 40;

  factory VaccineEntry(String input) {
    return VaccineEntry._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const VaccineEntry._(this.value);
}

class VaccineAmount extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory VaccineAmount(int input) {
    return VaccineAmount._(validateVaccineAmount(input));
  }

  const VaccineAmount._(this.value);
}

// class LongFormEntry extends ValueObject<String> {
//   @override
//   final Either<ValueFailure<String>, String> value;

//   static const maxLength = 120;

//   factory LongFormEntry(String input) {
//     return LongFormEntry._(
//       validateMaxStringLength(input, maxLength)
//           .flatMap(validateStringNotEmpty)
//           .flatMap(validateSingleLine),
//     );
//   }

//   const LongFormEntry._(this.value);
// }

// class List20<T> extends ValueObject<KtList<T>> {
//   @override
//   final Either<ValueFailure<KtList<T>>, KtList<T>> value;

//   static const maxLength = 20;

//   factory List20(KtList<T> input) {
//     return List20._(
//       validateMaxListLength(input, maxLength),
//     );
//   }

//   const List20._(this.value);

//   int get length {
//     return value.getOrElse(() => emptyList()).size;
//   }

//   bool get isFull {
//     return length == maxLength;
//   }
// }


