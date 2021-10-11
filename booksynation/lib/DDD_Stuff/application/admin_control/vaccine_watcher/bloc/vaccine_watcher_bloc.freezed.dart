// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vaccine_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VaccineWatcherEventTearOff {
  const _$VaccineWatcherEventTearOff();

  _WatchAllStarted watchAllStartedWeb() {
    return const _WatchAllStarted();
  }

  _WatchUncompletedStarted watchUncompletedStartedWeb() {
    return const _WatchUncompletedStarted();
  }

  _VaccinesReceived vaccinesReceived(
      Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines) {
    return _VaccinesReceived(
      failureOrVaccines,
    );
  }
}

/// @nodoc
const $VaccineWatcherEvent = _$VaccineWatcherEventTearOff();

/// @nodoc
mixin _$VaccineWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStartedWeb,
    required TResult Function() watchUncompletedStartedWeb,
    required TResult Function(
            Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)
        vaccinesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchAllStartedWeb,
    TResult Function()? watchUncompletedStartedWeb,
    TResult Function(Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)?
        vaccinesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStartedWeb,
    TResult Function()? watchUncompletedStartedWeb,
    TResult Function(Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)?
        vaccinesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStartedWeb,
    required TResult Function(_WatchUncompletedStarted value)
        watchUncompletedStartedWeb,
    required TResult Function(_VaccinesReceived value) vaccinesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStartedWeb,
    TResult Function(_WatchUncompletedStarted value)?
        watchUncompletedStartedWeb,
    TResult Function(_VaccinesReceived value)? vaccinesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStartedWeb,
    TResult Function(_WatchUncompletedStarted value)?
        watchUncompletedStartedWeb,
    TResult Function(_VaccinesReceived value)? vaccinesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineWatcherEventCopyWith<$Res> {
  factory $VaccineWatcherEventCopyWith(
          VaccineWatcherEvent value, $Res Function(VaccineWatcherEvent) then) =
      _$VaccineWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$VaccineWatcherEventCopyWithImpl<$Res>
    implements $VaccineWatcherEventCopyWith<$Res> {
  _$VaccineWatcherEventCopyWithImpl(this._value, this._then);

  final VaccineWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(VaccineWatcherEvent) _then;
}

/// @nodoc
abstract class _$WatchAllStartedCopyWith<$Res> {
  factory _$WatchAllStartedCopyWith(
          _WatchAllStarted value, $Res Function(_WatchAllStarted) then) =
      __$WatchAllStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$WatchAllStartedCopyWithImpl<$Res>
    extends _$VaccineWatcherEventCopyWithImpl<$Res>
    implements _$WatchAllStartedCopyWith<$Res> {
  __$WatchAllStartedCopyWithImpl(
      _WatchAllStarted _value, $Res Function(_WatchAllStarted) _then)
      : super(_value, (v) => _then(v as _WatchAllStarted));

  @override
  _WatchAllStarted get _value => super._value as _WatchAllStarted;
}

/// @nodoc

class _$_WatchAllStarted implements _WatchAllStarted {
  const _$_WatchAllStarted();

  @override
  String toString() {
    return 'VaccineWatcherEvent.watchAllStartedWeb()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WatchAllStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStartedWeb,
    required TResult Function() watchUncompletedStartedWeb,
    required TResult Function(
            Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)
        vaccinesReceived,
  }) {
    return watchAllStartedWeb();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchAllStartedWeb,
    TResult Function()? watchUncompletedStartedWeb,
    TResult Function(Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)?
        vaccinesReceived,
  }) {
    return watchAllStartedWeb?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStartedWeb,
    TResult Function()? watchUncompletedStartedWeb,
    TResult Function(Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)?
        vaccinesReceived,
    required TResult orElse(),
  }) {
    if (watchAllStartedWeb != null) {
      return watchAllStartedWeb();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStartedWeb,
    required TResult Function(_WatchUncompletedStarted value)
        watchUncompletedStartedWeb,
    required TResult Function(_VaccinesReceived value) vaccinesReceived,
  }) {
    return watchAllStartedWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStartedWeb,
    TResult Function(_WatchUncompletedStarted value)?
        watchUncompletedStartedWeb,
    TResult Function(_VaccinesReceived value)? vaccinesReceived,
  }) {
    return watchAllStartedWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStartedWeb,
    TResult Function(_WatchUncompletedStarted value)?
        watchUncompletedStartedWeb,
    TResult Function(_VaccinesReceived value)? vaccinesReceived,
    required TResult orElse(),
  }) {
    if (watchAllStartedWeb != null) {
      return watchAllStartedWeb(this);
    }
    return orElse();
  }
}

abstract class _WatchAllStarted implements VaccineWatcherEvent {
  const factory _WatchAllStarted() = _$_WatchAllStarted;
}

/// @nodoc
abstract class _$WatchUncompletedStartedCopyWith<$Res> {
  factory _$WatchUncompletedStartedCopyWith(_WatchUncompletedStarted value,
          $Res Function(_WatchUncompletedStarted) then) =
      __$WatchUncompletedStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$WatchUncompletedStartedCopyWithImpl<$Res>
    extends _$VaccineWatcherEventCopyWithImpl<$Res>
    implements _$WatchUncompletedStartedCopyWith<$Res> {
  __$WatchUncompletedStartedCopyWithImpl(_WatchUncompletedStarted _value,
      $Res Function(_WatchUncompletedStarted) _then)
      : super(_value, (v) => _then(v as _WatchUncompletedStarted));

  @override
  _WatchUncompletedStarted get _value =>
      super._value as _WatchUncompletedStarted;
}

/// @nodoc

class _$_WatchUncompletedStarted implements _WatchUncompletedStarted {
  const _$_WatchUncompletedStarted();

  @override
  String toString() {
    return 'VaccineWatcherEvent.watchUncompletedStartedWeb()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WatchUncompletedStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStartedWeb,
    required TResult Function() watchUncompletedStartedWeb,
    required TResult Function(
            Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)
        vaccinesReceived,
  }) {
    return watchUncompletedStartedWeb();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchAllStartedWeb,
    TResult Function()? watchUncompletedStartedWeb,
    TResult Function(Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)?
        vaccinesReceived,
  }) {
    return watchUncompletedStartedWeb?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStartedWeb,
    TResult Function()? watchUncompletedStartedWeb,
    TResult Function(Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)?
        vaccinesReceived,
    required TResult orElse(),
  }) {
    if (watchUncompletedStartedWeb != null) {
      return watchUncompletedStartedWeb();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStartedWeb,
    required TResult Function(_WatchUncompletedStarted value)
        watchUncompletedStartedWeb,
    required TResult Function(_VaccinesReceived value) vaccinesReceived,
  }) {
    return watchUncompletedStartedWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStartedWeb,
    TResult Function(_WatchUncompletedStarted value)?
        watchUncompletedStartedWeb,
    TResult Function(_VaccinesReceived value)? vaccinesReceived,
  }) {
    return watchUncompletedStartedWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStartedWeb,
    TResult Function(_WatchUncompletedStarted value)?
        watchUncompletedStartedWeb,
    TResult Function(_VaccinesReceived value)? vaccinesReceived,
    required TResult orElse(),
  }) {
    if (watchUncompletedStartedWeb != null) {
      return watchUncompletedStartedWeb(this);
    }
    return orElse();
  }
}

abstract class _WatchUncompletedStarted implements VaccineWatcherEvent {
  const factory _WatchUncompletedStarted() = _$_WatchUncompletedStarted;
}

/// @nodoc
abstract class _$VaccinesReceivedCopyWith<$Res> {
  factory _$VaccinesReceivedCopyWith(
          _VaccinesReceived value, $Res Function(_VaccinesReceived) then) =
      __$VaccinesReceivedCopyWithImpl<$Res>;
  $Res call({Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines});
}

/// @nodoc
class __$VaccinesReceivedCopyWithImpl<$Res>
    extends _$VaccineWatcherEventCopyWithImpl<$Res>
    implements _$VaccinesReceivedCopyWith<$Res> {
  __$VaccinesReceivedCopyWithImpl(
      _VaccinesReceived _value, $Res Function(_VaccinesReceived) _then)
      : super(_value, (v) => _then(v as _VaccinesReceived));

  @override
  _VaccinesReceived get _value => super._value as _VaccinesReceived;

  @override
  $Res call({
    Object? failureOrVaccines = freezed,
  }) {
    return _then(_VaccinesReceived(
      failureOrVaccines == freezed
          ? _value.failureOrVaccines
          : failureOrVaccines // ignore: cast_nullable_to_non_nullable
              as Either<VaccineFailure, KtList<Vaccine>>,
    ));
  }
}

/// @nodoc

class _$_VaccinesReceived implements _VaccinesReceived {
  const _$_VaccinesReceived(this.failureOrVaccines);

  @override
  final Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines;

  @override
  String toString() {
    return 'VaccineWatcherEvent.vaccinesReceived(failureOrVaccines: $failureOrVaccines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VaccinesReceived &&
            (identical(other.failureOrVaccines, failureOrVaccines) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrVaccines, failureOrVaccines)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrVaccines);

  @JsonKey(ignore: true)
  @override
  _$VaccinesReceivedCopyWith<_VaccinesReceived> get copyWith =>
      __$VaccinesReceivedCopyWithImpl<_VaccinesReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStartedWeb,
    required TResult Function() watchUncompletedStartedWeb,
    required TResult Function(
            Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)
        vaccinesReceived,
  }) {
    return vaccinesReceived(failureOrVaccines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchAllStartedWeb,
    TResult Function()? watchUncompletedStartedWeb,
    TResult Function(Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)?
        vaccinesReceived,
  }) {
    return vaccinesReceived?.call(failureOrVaccines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStartedWeb,
    TResult Function()? watchUncompletedStartedWeb,
    TResult Function(Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines)?
        vaccinesReceived,
    required TResult orElse(),
  }) {
    if (vaccinesReceived != null) {
      return vaccinesReceived(failureOrVaccines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStartedWeb,
    required TResult Function(_WatchUncompletedStarted value)
        watchUncompletedStartedWeb,
    required TResult Function(_VaccinesReceived value) vaccinesReceived,
  }) {
    return vaccinesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStartedWeb,
    TResult Function(_WatchUncompletedStarted value)?
        watchUncompletedStartedWeb,
    TResult Function(_VaccinesReceived value)? vaccinesReceived,
  }) {
    return vaccinesReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStartedWeb,
    TResult Function(_WatchUncompletedStarted value)?
        watchUncompletedStartedWeb,
    TResult Function(_VaccinesReceived value)? vaccinesReceived,
    required TResult orElse(),
  }) {
    if (vaccinesReceived != null) {
      return vaccinesReceived(this);
    }
    return orElse();
  }
}

abstract class _VaccinesReceived implements VaccineWatcherEvent {
  const factory _VaccinesReceived(
          Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines) =
      _$_VaccinesReceived;

  Either<VaccineFailure, KtList<Vaccine>> get failureOrVaccines =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VaccinesReceivedCopyWith<_VaccinesReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$VaccineWatcherStateTearOff {
  const _$VaccineWatcherStateTearOff();

  _InitialWeb initialWeb() {
    return const _InitialWeb();
  }

  _LoadInProgressWeb loadInProgressWeb() {
    return const _LoadInProgressWeb();
  }

  _LoadSuccessWeb loadSuccessWeb(KtList<Vaccine> vaccines) {
    return _LoadSuccessWeb(
      vaccines,
    );
  }

  _LoadFailureWeb loadFailureWeb(VaccineFailure vaccineFailure) {
    return _LoadFailureWeb(
      vaccineFailure,
    );
  }
}

/// @nodoc
const $VaccineWatcherState = _$VaccineWatcherStateTearOff();

/// @nodoc
mixin _$VaccineWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialWeb,
    required TResult Function() loadInProgressWeb,
    required TResult Function(KtList<Vaccine> vaccines) loadSuccessWeb,
    required TResult Function(VaccineFailure vaccineFailure) loadFailureWeb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialWeb value) initialWeb,
    required TResult Function(_LoadInProgressWeb value) loadInProgressWeb,
    required TResult Function(_LoadSuccessWeb value) loadSuccessWeb,
    required TResult Function(_LoadFailureWeb value) loadFailureWeb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineWatcherStateCopyWith<$Res> {
  factory $VaccineWatcherStateCopyWith(
          VaccineWatcherState value, $Res Function(VaccineWatcherState) then) =
      _$VaccineWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$VaccineWatcherStateCopyWithImpl<$Res>
    implements $VaccineWatcherStateCopyWith<$Res> {
  _$VaccineWatcherStateCopyWithImpl(this._value, this._then);

  final VaccineWatcherState _value;
  // ignore: unused_field
  final $Res Function(VaccineWatcherState) _then;
}

/// @nodoc
abstract class _$InitialWebCopyWith<$Res> {
  factory _$InitialWebCopyWith(
          _InitialWeb value, $Res Function(_InitialWeb) then) =
      __$InitialWebCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialWebCopyWithImpl<$Res>
    extends _$VaccineWatcherStateCopyWithImpl<$Res>
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
    return 'VaccineWatcherState.initialWeb()';
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
    required TResult Function() loadInProgressWeb,
    required TResult Function(KtList<Vaccine> vaccines) loadSuccessWeb,
    required TResult Function(VaccineFailure vaccineFailure) loadFailureWeb,
  }) {
    return initialWeb();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
  }) {
    return initialWeb?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
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
    required TResult Function(_LoadInProgressWeb value) loadInProgressWeb,
    required TResult Function(_LoadSuccessWeb value) loadSuccessWeb,
    required TResult Function(_LoadFailureWeb value) loadFailureWeb,
  }) {
    return initialWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
  }) {
    return initialWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
    required TResult orElse(),
  }) {
    if (initialWeb != null) {
      return initialWeb(this);
    }
    return orElse();
  }
}

abstract class _InitialWeb implements VaccineWatcherState {
  const factory _InitialWeb() = _$_InitialWeb;
}

/// @nodoc
abstract class _$LoadInProgressWebCopyWith<$Res> {
  factory _$LoadInProgressWebCopyWith(
          _LoadInProgressWeb value, $Res Function(_LoadInProgressWeb) then) =
      __$LoadInProgressWebCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadInProgressWebCopyWithImpl<$Res>
    extends _$VaccineWatcherStateCopyWithImpl<$Res>
    implements _$LoadInProgressWebCopyWith<$Res> {
  __$LoadInProgressWebCopyWithImpl(
      _LoadInProgressWeb _value, $Res Function(_LoadInProgressWeb) _then)
      : super(_value, (v) => _then(v as _LoadInProgressWeb));

  @override
  _LoadInProgressWeb get _value => super._value as _LoadInProgressWeb;
}

/// @nodoc

class _$_LoadInProgressWeb implements _LoadInProgressWeb {
  const _$_LoadInProgressWeb();

  @override
  String toString() {
    return 'VaccineWatcherState.loadInProgressWeb()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadInProgressWeb);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialWeb,
    required TResult Function() loadInProgressWeb,
    required TResult Function(KtList<Vaccine> vaccines) loadSuccessWeb,
    required TResult Function(VaccineFailure vaccineFailure) loadFailureWeb,
  }) {
    return loadInProgressWeb();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
  }) {
    return loadInProgressWeb?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
    required TResult orElse(),
  }) {
    if (loadInProgressWeb != null) {
      return loadInProgressWeb();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialWeb value) initialWeb,
    required TResult Function(_LoadInProgressWeb value) loadInProgressWeb,
    required TResult Function(_LoadSuccessWeb value) loadSuccessWeb,
    required TResult Function(_LoadFailureWeb value) loadFailureWeb,
  }) {
    return loadInProgressWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
  }) {
    return loadInProgressWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
    required TResult orElse(),
  }) {
    if (loadInProgressWeb != null) {
      return loadInProgressWeb(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgressWeb implements VaccineWatcherState {
  const factory _LoadInProgressWeb() = _$_LoadInProgressWeb;
}

/// @nodoc
abstract class _$LoadSuccessWebCopyWith<$Res> {
  factory _$LoadSuccessWebCopyWith(
          _LoadSuccessWeb value, $Res Function(_LoadSuccessWeb) then) =
      __$LoadSuccessWebCopyWithImpl<$Res>;
  $Res call({KtList<Vaccine> vaccines});
}

/// @nodoc
class __$LoadSuccessWebCopyWithImpl<$Res>
    extends _$VaccineWatcherStateCopyWithImpl<$Res>
    implements _$LoadSuccessWebCopyWith<$Res> {
  __$LoadSuccessWebCopyWithImpl(
      _LoadSuccessWeb _value, $Res Function(_LoadSuccessWeb) _then)
      : super(_value, (v) => _then(v as _LoadSuccessWeb));

  @override
  _LoadSuccessWeb get _value => super._value as _LoadSuccessWeb;

  @override
  $Res call({
    Object? vaccines = freezed,
  }) {
    return _then(_LoadSuccessWeb(
      vaccines == freezed
          ? _value.vaccines
          : vaccines // ignore: cast_nullable_to_non_nullable
              as KtList<Vaccine>,
    ));
  }
}

/// @nodoc

class _$_LoadSuccessWeb implements _LoadSuccessWeb {
  const _$_LoadSuccessWeb(this.vaccines);

  @override
  final KtList<Vaccine> vaccines;

  @override
  String toString() {
    return 'VaccineWatcherState.loadSuccessWeb(vaccines: $vaccines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccessWeb &&
            (identical(other.vaccines, vaccines) ||
                const DeepCollectionEquality()
                    .equals(other.vaccines, vaccines)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(vaccines);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessWebCopyWith<_LoadSuccessWeb> get copyWith =>
      __$LoadSuccessWebCopyWithImpl<_LoadSuccessWeb>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialWeb,
    required TResult Function() loadInProgressWeb,
    required TResult Function(KtList<Vaccine> vaccines) loadSuccessWeb,
    required TResult Function(VaccineFailure vaccineFailure) loadFailureWeb,
  }) {
    return loadSuccessWeb(vaccines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
  }) {
    return loadSuccessWeb?.call(vaccines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
    required TResult orElse(),
  }) {
    if (loadSuccessWeb != null) {
      return loadSuccessWeb(vaccines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialWeb value) initialWeb,
    required TResult Function(_LoadInProgressWeb value) loadInProgressWeb,
    required TResult Function(_LoadSuccessWeb value) loadSuccessWeb,
    required TResult Function(_LoadFailureWeb value) loadFailureWeb,
  }) {
    return loadSuccessWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
  }) {
    return loadSuccessWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
    required TResult orElse(),
  }) {
    if (loadSuccessWeb != null) {
      return loadSuccessWeb(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccessWeb implements VaccineWatcherState {
  const factory _LoadSuccessWeb(KtList<Vaccine> vaccines) = _$_LoadSuccessWeb;

  KtList<Vaccine> get vaccines => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadSuccessWebCopyWith<_LoadSuccessWeb> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureWebCopyWith<$Res> {
  factory _$LoadFailureWebCopyWith(
          _LoadFailureWeb value, $Res Function(_LoadFailureWeb) then) =
      __$LoadFailureWebCopyWithImpl<$Res>;
  $Res call({VaccineFailure vaccineFailure});

  $VaccineFailureCopyWith<$Res> get vaccineFailure;
}

/// @nodoc
class __$LoadFailureWebCopyWithImpl<$Res>
    extends _$VaccineWatcherStateCopyWithImpl<$Res>
    implements _$LoadFailureWebCopyWith<$Res> {
  __$LoadFailureWebCopyWithImpl(
      _LoadFailureWeb _value, $Res Function(_LoadFailureWeb) _then)
      : super(_value, (v) => _then(v as _LoadFailureWeb));

  @override
  _LoadFailureWeb get _value => super._value as _LoadFailureWeb;

  @override
  $Res call({
    Object? vaccineFailure = freezed,
  }) {
    return _then(_LoadFailureWeb(
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

class _$_LoadFailureWeb implements _LoadFailureWeb {
  const _$_LoadFailureWeb(this.vaccineFailure);

  @override
  final VaccineFailure vaccineFailure;

  @override
  String toString() {
    return 'VaccineWatcherState.loadFailureWeb(vaccineFailure: $vaccineFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadFailureWeb &&
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
  _$LoadFailureWebCopyWith<_LoadFailureWeb> get copyWith =>
      __$LoadFailureWebCopyWithImpl<_LoadFailureWeb>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialWeb,
    required TResult Function() loadInProgressWeb,
    required TResult Function(KtList<Vaccine> vaccines) loadSuccessWeb,
    required TResult Function(VaccineFailure vaccineFailure) loadFailureWeb,
  }) {
    return loadFailureWeb(vaccineFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
  }) {
    return loadFailureWeb?.call(vaccineFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialWeb,
    TResult Function()? loadInProgressWeb,
    TResult Function(KtList<Vaccine> vaccines)? loadSuccessWeb,
    TResult Function(VaccineFailure vaccineFailure)? loadFailureWeb,
    required TResult orElse(),
  }) {
    if (loadFailureWeb != null) {
      return loadFailureWeb(vaccineFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialWeb value) initialWeb,
    required TResult Function(_LoadInProgressWeb value) loadInProgressWeb,
    required TResult Function(_LoadSuccessWeb value) loadSuccessWeb,
    required TResult Function(_LoadFailureWeb value) loadFailureWeb,
  }) {
    return loadFailureWeb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
  }) {
    return loadFailureWeb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialWeb value)? initialWeb,
    TResult Function(_LoadInProgressWeb value)? loadInProgressWeb,
    TResult Function(_LoadSuccessWeb value)? loadSuccessWeb,
    TResult Function(_LoadFailureWeb value)? loadFailureWeb,
    required TResult orElse(),
  }) {
    if (loadFailureWeb != null) {
      return loadFailureWeb(this);
    }
    return orElse();
  }
}

abstract class _LoadFailureWeb implements VaccineWatcherState {
  const factory _LoadFailureWeb(VaccineFailure vaccineFailure) =
      _$_LoadFailureWeb;

  VaccineFailure get vaccineFailure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadFailureWebCopyWith<_LoadFailureWeb> get copyWith =>
      throw _privateConstructorUsedError;
}
