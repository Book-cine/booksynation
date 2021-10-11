part of 'vaccine_watcher_bloc.dart';

@freezed
abstract class VaccineWatcherEvent with _$VaccineWatcherEvent {
  const factory VaccineWatcherEvent.watchAllStartedWeb() = _WatchAllStarted;
  const factory VaccineWatcherEvent.watchUncompletedStartedWeb() =
      _WatchUncompletedStarted;
  const factory VaccineWatcherEvent.vaccinesReceived(
    Either<VaccineFailure, KtList<Vaccine>> failureOrVaccines,
  ) = _VaccinesReceived;
}
