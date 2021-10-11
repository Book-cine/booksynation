// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vaccine_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VaccineActorEventTearOff {
  const _$VaccineActorEventTearOff();

  _DeletedWeb deleted(Vaccine vaccine) {
    return _DeletedWeb(
      vaccine,
    );
  }
}

/// @nodoc
const $VaccineActorEvent = _$VaccineActorEventTearOff();

/// @nodoc
mixin _$VaccineActorEvent {
  Vaccine get vaccine => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Vaccine vaccine) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Vaccine vaccine)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Vaccine vaccine)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeletedWeb value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeletedWeb value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeletedWeb value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VaccineActorEventCopyWith<VaccineActorEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineActorEventCopyWith<$Res> {
  factory $VaccineActorEventCopyWith(
          VaccineActorEvent value, $Res Function(VaccineActorEvent) then) =
      _$VaccineActorEventCopyWithImpl<$Res>;
  $Res call({Vaccine vaccine});

  $VaccineCopyWith<$Res> get vaccine;
}

/// @nodoc
class _$VaccineActorEventCopyWithImpl<$Res>
    implements $VaccineActorEventCopyWith<$Res> {
  _$VaccineActorEventCopyWithImpl(this._value, this._then);

  final VaccineActorEvent _value;
  // ignore: unused_field
  final $Res Function(VaccineActorEvent) _then;

  @override
  $Res call({
    Object? vaccine = freezed,
  }) {
    return _then(_value.copyWith(
      vaccine: vaccine == freezed
          ? _value.vaccine
          : vaccine // ignore: cast_nullable_to_non_nullable
              as Vaccine,
    ));
  }

  @override
  $VaccineCopyWith<$Res> get vaccine {
    return $VaccineCopyWith<$Res>(_value.vaccine, (value) {
      return _then(_value.copyWith(vaccine: value));
    });
  }
}

/// @nodoc
abstract class _$DeletedWebCopyWith<$Res>
    implements $VaccineActorEventCopyWith<$Res> {
  factory _$DeletedWebCopyWith(
          _DeletedWeb value, $Res Function(_DeletedWeb) then) =
      __$DeletedWebCopyWithImpl<$Res>;
  @override
  $Res call({Vaccine vaccine});

  @override
  $VaccineCopyWith<$Res> get vaccine;
}

/// @nodoc
class __$DeletedWebCopyWithImpl<$Res>
    extends _$VaccineActorEventCopyWithImpl<$Res>
    implements _$DeletedWebCopyWith<$Res> {
  __$DeletedWebCopyWithImpl(
      _DeletedWeb _value, $Res Function(_DeletedWeb) _then)
      : super(_value, (v) => _then(v as _DeletedWeb));

  @override
  _DeletedWeb get _value => super._value as _DeletedWeb;

  @override
  $Res call({
    Object? vaccine = freezed,
  }) {
    return _then(_DeletedWeb(
      vaccine == freezed
          ? _value.vaccine
          : vaccine // ignore: cast_nullable_to_non_nullable
              as Vaccine,
    ));
  }
}

/// @nodoc

class _$_DeletedWeb implements _DeletedWeb {
  const _$_DeletedWeb(this.vaccine);

  @override
  final Vaccine vaccine;

  @override
  String toString() {
    return 'VaccineActorEvent.deleted(vaccine: $vaccine)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeletedWeb &&
            (identical(other.vaccine, vaccine) ||
                const DeepCollectionEquality().equals(other.vaccine, vaccine)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(vaccine);

  @JsonKey(ignore: true)
  @override
  _$DeletedWebCopyWith<_DeletedWeb> get copyWith =>
      __$DeletedWebCopyWithImpl<_DeletedWeb>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Vaccine vaccine) deleted,
  }) {
    return deleted(vaccine);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Vaccine vaccine)? deleted,
  }) {
    return deleted?.call(vaccine);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Vaccine vaccine)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(vaccine);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeletedWeb value) deleted,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeletedWeb value)? deleted,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeletedWeb value)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _DeletedWeb implements VaccineActorEvent {
  const factory _DeletedWeb(Vaccine vaccine) = _$_DeletedWeb;

  @override
  Vaccine get vaccine => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DeletedWebCopyWith<_DeletedWeb> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$VaccineActorStateTearOff {
  const _$VaccineActorStateTearOff();

  _InitialWeb initialWeb() {
    return const _InitialWeb();
  }

  _ActionInProgressWeb actionInProgressWeb() {
    return const _ActionInProgressWeb();
  }

  _DeleteFailureWeb deleteFailureWeb(VaccineFailure vaccineFailure) {
    return _DeleteFailureWeb(
      vaccineFailure,
    );
  }

  _DeleteSuccessWeb deleteSuccessWeb() {
    return const _DeleteSuccessWeb();
  }
}

/// @nodoc
const $VaccineActorState = _$VaccineActorStateTearOff();

/// @nodoc
mixin _$VaccineActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialWeb,
    required TResult Function() actionInProgressWeb,
    required TResult Function(VaccineFailure vaccineFailure) deleteFailureWeb,
    required TResult Function() deleteSuccessWeb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialWeb value) initialWeb,
    required TResult Function(_ActionInProgressWeb value) actionInProgressWeb,
    required TResult Function(_DeleteFailureWeb value) deleteFailureWeb,
    required TResult Function(_DeleteSuccessWeb value) deleteSuccessWeb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineActorStateCopyWith<$Res> {
  factory $VaccineActorStateCopyWith(
          VaccineActorState value, $Res Function(VaccineActorState) then) =
      _$VaccineActorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$VaccineActorStateCopyWithImpl<$Res>
    implements $VaccineActorStateCopyWith<$Res> {
  _$VaccineActorStateCopyWithImpl(this._value, this._then);

  final VaccineActorState _value;
  // ignore: unused_field
  final $Res Function(VaccineActorState) _then;
}

/// @nodoc
abstract class _$InitialWebCopyWith<$Res> {
  factory _$InitialWebCopyWith(
          _InitialWeb value, $Res Function(_InitialWeb) then) =
      __$InitialWebCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialWebCopyWithImpl<$Res>
    extends _$VaccineActorStateCopyWithImpl<$Res>
    implements _$InitialWebCopyWith<$Res> {
  __$InitialWebCopyWithImpl(
      _InitialWeb _value, $Res Function(_InitialWeb) _then)
      : super(_value, (v) => _then(v as _InitialWeb));

  @override
  _InitialWeb get _value => super._value as _InitialWeb;
}

/// @nodoc

class _$_InitialWeb implements _InitialWeb {
  const _$_InitialWeb();

  @override
  String toString() {
    return 'VaccineActorState.initialWeb()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InitialWeb);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialWeb,
    required TResult Function() actionInProgressWeb,
    required TResult Function(VaccineFailure vaccineFailure) deleteFailureWeb,
    required TResult Function() deleteSuccessWeb,
  }) {
    return initialWeb();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
  }) {
    return initialWeb?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
    required TResult orElse(),
  }) {
    if (initialWeb != null) {
      return initialWeb();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialWeb value) initialWeb,
    required TResult Function(_ActionInProgressWeb value) actionInProgressWeb,
    required TResult Function(_DeleteFailureWeb value) deleteFailureWeb,
    required TResult Function(_DeleteSuccessWeb value) deleteSuccessWeb,
  }) {
    return initialWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
  }) {
    return initialWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
    required TResult orElse(),
  }) {
    if (initialWeb != null) {
      return initialWeb(this);
    }
    return orElse();
  }
}

abstract class _InitialWeb implements VaccineActorState {
  const factory _InitialWeb() = _$_InitialWeb;
}

/// @nodoc
abstract class _$ActionInProgressWebCopyWith<$Res> {
  factory _$ActionInProgressWebCopyWith(_ActionInProgressWeb value,
          $Res Function(_ActionInProgressWeb) then) =
      __$ActionInProgressWebCopyWithImpl<$Res>;
}

/// @nodoc
class __$ActionInProgressWebCopyWithImpl<$Res>
    extends _$VaccineActorStateCopyWithImpl<$Res>
    implements _$ActionInProgressWebCopyWith<$Res> {
  __$ActionInProgressWebCopyWithImpl(
      _ActionInProgressWeb _value, $Res Function(_ActionInProgressWeb) _then)
      : super(_value, (v) => _then(v as _ActionInProgressWeb));

  @override
  _ActionInProgressWeb get _value => super._value as _ActionInProgressWeb;
}

/// @nodoc

class _$_ActionInProgressWeb implements _ActionInProgressWeb {
  const _$_ActionInProgressWeb();

  @override
  String toString() {
    return 'VaccineActorState.actionInProgressWeb()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ActionInProgressWeb);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialWeb,
    required TResult Function() actionInProgressWeb,
    required TResult Function(VaccineFailure vaccineFailure) deleteFailureWeb,
    required TResult Function() deleteSuccessWeb,
  }) {
    return actionInProgressWeb();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
  }) {
    return actionInProgressWeb?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
    required TResult orElse(),
  }) {
    if (actionInProgressWeb != null) {
      return actionInProgressWeb();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialWeb value) initialWeb,
    required TResult Function(_ActionInProgressWeb value) actionInProgressWeb,
    required TResult Function(_DeleteFailureWeb value) deleteFailureWeb,
    required TResult Function(_DeleteSuccessWeb value) deleteSuccessWeb,
  }) {
    return actionInProgressWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
  }) {
    return actionInProgressWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
    required TResult orElse(),
  }) {
    if (actionInProgressWeb != null) {
      return actionInProgressWeb(this);
    }
    return orElse();
  }
}

abstract class _ActionInProgressWeb implements VaccineActorState {
  const factory _ActionInProgressWeb() = _$_ActionInProgressWeb;
}

/// @nodoc
abstract class _$DeleteFailureWebCopyWith<$Res> {
  factory _$DeleteFailureWebCopyWith(
          _DeleteFailureWeb value, $Res Function(_DeleteFailureWeb) then) =
      __$DeleteFailureWebCopyWithImpl<$Res>;
  $Res call({VaccineFailure vaccineFailure});

  $VaccineFailureCopyWith<$Res> get vaccineFailure;
}

/// @nodoc
class __$DeleteFailureWebCopyWithImpl<$Res>
    extends _$VaccineActorStateCopyWithImpl<$Res>
    implements _$DeleteFailureWebCopyWith<$Res> {
  __$DeleteFailureWebCopyWithImpl(
      _DeleteFailureWeb _value, $Res Function(_DeleteFailureWeb) _then)
      : super(_value, (v) => _then(v as _DeleteFailureWeb));

  @override
  _DeleteFailureWeb get _value => super._value as _DeleteFailureWeb;

  @override
  $Res call({
    Object? vaccineFailure = freezed,
  }) {
    return _then(_DeleteFailureWeb(
      vaccineFailure == freezed
          ? _value.vaccineFailure
          : vaccineFailure // ignore: cast_nullable_to_non_nullable
              as VaccineFailure,
    ));
  }

  @override
  $VaccineFailureCopyWith<$Res> get vaccineFailure {
    return $VaccineFailureCopyWith<$Res>(_value.vaccineFailure, (value) {
      return _then(_value.copyWith(vaccineFailure: value));
    });
  }
}

/// @nodoc

class _$_DeleteFailureWeb implements _DeleteFailureWeb {
  const _$_DeleteFailureWeb(this.vaccineFailure);

  @override
  final VaccineFailure vaccineFailure;

  @override
  String toString() {
    return 'VaccineActorState.deleteFailureWeb(vaccineFailure: $vaccineFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteFailureWeb &&
            (identical(other.vaccineFailure, vaccineFailure) ||
                const DeepCollectionEquality()
                    .equals(other.vaccineFailure, vaccineFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(vaccineFailure);

  @JsonKey(ignore: true)
  @override
  _$DeleteFailureWebCopyWith<_DeleteFailureWeb> get copyWith =>
      __$DeleteFailureWebCopyWithImpl<_DeleteFailureWeb>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialWeb,
    required TResult Function() actionInProgressWeb,
    required TResult Function(VaccineFailure vaccineFailure) deleteFailureWeb,
    required TResult Function() deleteSuccessWeb,
  }) {
    return deleteFailureWeb(vaccineFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
  }) {
    return deleteFailureWeb?.call(vaccineFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
    required TResult orElse(),
  }) {
    if (deleteFailureWeb != null) {
      return deleteFailureWeb(vaccineFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialWeb value) initialWeb,
    required TResult Function(_ActionInProgressWeb value) actionInProgressWeb,
    required TResult Function(_DeleteFailureWeb value) deleteFailureWeb,
    required TResult Function(_DeleteSuccessWeb value) deleteSuccessWeb,
  }) {
    return deleteFailureWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
  }) {
    return deleteFailureWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
    required TResult orElse(),
  }) {
    if (deleteFailureWeb != null) {
      return deleteFailureWeb(this);
    }
    return orElse();
  }
}

abstract class _DeleteFailureWeb implements VaccineActorState {
  const factory _DeleteFailureWeb(VaccineFailure vaccineFailure) =
      _$_DeleteFailureWeb;

  VaccineFailure get vaccineFailure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$DeleteFailureWebCopyWith<_DeleteFailureWeb> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteSuccessWebCopyWith<$Res> {
  factory _$DeleteSuccessWebCopyWith(
          _DeleteSuccessWeb value, $Res Function(_DeleteSuccessWeb) then) =
      __$DeleteSuccessWebCopyWithImpl<$Res>;
}

/// @nodoc
class __$DeleteSuccessWebCopyWithImpl<$Res>
    extends _$VaccineActorStateCopyWithImpl<$Res>
    implements _$DeleteSuccessWebCopyWith<$Res> {
  __$DeleteSuccessWebCopyWithImpl(
      _DeleteSuccessWeb _value, $Res Function(_DeleteSuccessWeb) _then)
      : super(_value, (v) => _then(v as _DeleteSuccessWeb));

  @override
  _DeleteSuccessWeb get _value => super._value as _DeleteSuccessWeb;
}

/// @nodoc

class _$_DeleteSuccessWeb implements _DeleteSuccessWeb {
  const _$_DeleteSuccessWeb();

  @override
  String toString() {
    return 'VaccineActorState.deleteSuccessWeb()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _DeleteSuccessWeb);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialWeb,
    required TResult Function() actionInProgressWeb,
    required TResult Function(VaccineFailure vaccineFailure) deleteFailureWeb,
    required TResult Function() deleteSuccessWeb,
  }) {
    return deleteSuccessWeb();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
  }) {
    return deleteSuccessWeb?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? actionInProgressWeb,
    TResult Function(VaccineFailure vaccineFailure)? deleteFailureWeb,
    TResult Function()? deleteSuccessWeb,
    required TResult orElse(),
  }) {
    if (deleteSuccessWeb != null) {
      return deleteSuccessWeb();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialWeb value) initialWeb,
    required TResult Function(_ActionInProgressWeb value) actionInProgressWeb,
    required TResult Function(_DeleteFailureWeb value) deleteFailureWeb,
    required TResult Function(_DeleteSuccessWeb value) deleteSuccessWeb,
  }) {
    return deleteSuccessWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
  }) {
    return deleteSuccessWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_ActionInProgressWeb value)? actionInProgressWeb,
    TResult Function(_DeleteFailureWeb value)? deleteFailureWeb,
    TResult Function(_DeleteSuccessWeb value)? deleteSuccessWeb,
    required TResult orElse(),
  }) {
    if (deleteSuccessWeb != null) {
      return deleteSuccessWeb(this);
    }
    return orElse();
  }
}

abstract class _DeleteSuccessWeb implements VaccineActorState {
  const factory _DeleteSuccessWeb() = _$_DeleteSuccessWeb;
}
