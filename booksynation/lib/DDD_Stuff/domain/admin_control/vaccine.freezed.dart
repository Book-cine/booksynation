// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vaccine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VaccineTearOff {
  const _$VaccineTearOff();

  _Vaccine call(
      {required UniqueId id,
      required VaccineEntry name,
      required VaccineEntry dateStart,
      required VaccineEntry dateEnd,
      required VaccineAmount currentStock,
      required VaccineAmount maxStock}) {
    return _Vaccine(
      id: id,
      name: name,
      dateStart: dateStart,
      dateEnd: dateEnd,
      currentStock: currentStock,
      maxStock: maxStock,
    );
  }
}

/// @nodoc
const $Vaccine = _$VaccineTearOff();

/// @nodoc
mixin _$Vaccine {
  UniqueId get id => throw _privateConstructorUsedError;
  VaccineEntry get name => throw _privateConstructorUsedError;
  VaccineEntry get dateStart => throw _privateConstructorUsedError;
  VaccineEntry get dateEnd => throw _privateConstructorUsedError;
  VaccineAmount get currentStock => throw _privateConstructorUsedError;
  VaccineAmount get maxStock => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VaccineCopyWith<Vaccine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineCopyWith<$Res> {
  factory $VaccineCopyWith(Vaccine value, $Res Function(Vaccine) then) =
      _$VaccineCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      VaccineEntry name,
      VaccineEntry dateStart,
      VaccineEntry dateEnd,
      VaccineAmount currentStock,
      VaccineAmount maxStock});
}

/// @nodoc
class _$VaccineCopyWithImpl<$Res> implements $VaccineCopyWith<$Res> {
  _$VaccineCopyWithImpl(this._value, this._then);

  final Vaccine _value;
  // ignore: unused_field
  final $Res Function(Vaccine) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? currentStock = freezed,
    Object? maxStock = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as VaccineEntry,
      dateStart: dateStart == freezed
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as VaccineEntry,
      dateEnd: dateEnd == freezed
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as VaccineEntry,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as VaccineAmount,
      maxStock: maxStock == freezed
          ? _value.maxStock
          : maxStock // ignore: cast_nullable_to_non_nullable
              as VaccineAmount,
    ));
  }
}

/// @nodoc
abstract class _$VaccineCopyWith<$Res> implements $VaccineCopyWith<$Res> {
  factory _$VaccineCopyWith(_Vaccine value, $Res Function(_Vaccine) then) =
      __$VaccineCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      VaccineEntry name,
      VaccineEntry dateStart,
      VaccineEntry dateEnd,
      VaccineAmount currentStock,
      VaccineAmount maxStock});
}

/// @nodoc
class __$VaccineCopyWithImpl<$Res> extends _$VaccineCopyWithImpl<$Res>
    implements _$VaccineCopyWith<$Res> {
  __$VaccineCopyWithImpl(_Vaccine _value, $Res Function(_Vaccine) _then)
      : super(_value, (v) => _then(v as _Vaccine));

  @override
  _Vaccine get _value => super._value as _Vaccine;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? currentStock = freezed,
    Object? maxStock = freezed,
  }) {
    return _then(_Vaccine(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as VaccineEntry,
      dateStart: dateStart == freezed
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as VaccineEntry,
      dateEnd: dateEnd == freezed
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as VaccineEntry,
      currentStock: currentStock == freezed
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as VaccineAmount,
      maxStock: maxStock == freezed
          ? _value.maxStock
          : maxStock // ignore: cast_nullable_to_non_nullable
              as VaccineAmount,
    ));
  }
}

/// @nodoc

class _$_Vaccine extends _Vaccine {
  _$_Vaccine(
      {required this.id,
      required this.name,
      required this.dateStart,
      required this.dateEnd,
      required this.currentStock,
      required this.maxStock})
      : super._();

  @override
  final UniqueId id;
  @override
  final VaccineEntry name;
  @override
  final VaccineEntry dateStart;
  @override
  final VaccineEntry dateEnd;
  @override
  final VaccineAmount currentStock;
  @override
  final VaccineAmount maxStock;

  @override
  String toString() {
    return 'Vaccine(id: $id, name: $name, dateStart: $dateStart, dateEnd: $dateEnd, currentStock: $currentStock, maxStock: $maxStock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Vaccine &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.dateStart, dateStart) ||
                const DeepCollectionEquality()
                    .equals(other.dateStart, dateStart)) &&
            (identical(other.dateEnd, dateEnd) ||
                const DeepCollectionEquality()
                    .equals(other.dateEnd, dateEnd)) &&
            (identical(other.currentStock, currentStock) ||
                const DeepCollectionEquality()
                    .equals(other.currentStock, currentStock)) &&
            (identical(other.maxStock, maxStock) ||
                const DeepCollectionEquality()
                    .equals(other.maxStock, maxStock)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(dateStart) ^
      const DeepCollectionEquality().hash(dateEnd) ^
      const DeepCollectionEquality().hash(currentStock) ^
      const DeepCollectionEquality().hash(maxStock);

  @JsonKey(ignore: true)
  @override
  _$VaccineCopyWith<_Vaccine> get copyWith =>
      __$VaccineCopyWithImpl<_Vaccine>(this, _$identity);
}

abstract class _Vaccine extends Vaccine {
  factory _Vaccine(
      {required UniqueId id,
      required VaccineEntry name,
      required VaccineEntry dateStart,
      required VaccineEntry dateEnd,
      required VaccineAmount currentStock,
      required VaccineAmount maxStock}) = _$_Vaccine;
  _Vaccine._() : super._();

  @override
  UniqueId get id => throw _privateConstructorUsedError;
  @override
  VaccineEntry get name => throw _privateConstructorUsedError;
  @override
  VaccineEntry get dateStart => throw _privateConstructorUsedError;
  @override
  VaccineEntry get dateEnd => throw _privateConstructorUsedError;
  @override
  VaccineAmount get currentStock => throw _privateConstructorUsedError;
  @override
  VaccineAmount get maxStock => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VaccineCopyWith<_Vaccine> get copyWith =>
      throw _privateConstructorUsedError;
}
