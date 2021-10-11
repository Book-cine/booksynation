part of 'vaccine_watcher_bloc.dart';

@freezed
abstract class VaccineWatcherState with _$VaccineWatcherState {
  const factory VaccineWatcherState.initialWeb() = _InitialWeb;
  const factory VaccineWatcherState.loadInProgressWeb() = _LoadInProgressWeb;
  const factory VaccineWatcherState.loadSuccessWeb(KtList<Vaccine> vaccines) =
      _LoadSuccessWeb;
  const factory VaccineWatcherState.loadFailureWeb(
      VaccineFailure vaccineFailure) = _LoadFailureWeb;
}
