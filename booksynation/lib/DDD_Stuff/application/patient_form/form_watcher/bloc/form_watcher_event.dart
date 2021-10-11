part of 'form_watcher_bloc.dart';

@freezed
abstract class FormWatcherEvent with _$FormWatcherEvent {
  const factory FormWatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory FormWatcherEvent.watchUncompletedStarted() =
      _WatchUncompletedStarted;
  const factory FormWatcherEvent.formsReceived(
    Either<FormFailure, KtList<Form>> failureOrForms,
  ) = _FormsReceived;
}
