part of 'form_watcher_bloc.dart';

@freezed
abstract class FormWatcherState with _$FormWatcherState {
  const factory FormWatcherState.initial() = _Initial;
  const factory FormWatcherState.loadInProgress() = _LoadInProgress;
  const factory FormWatcherState.loadSuccess(KtList<Form> forms) = _LoadSuccess;
  const factory FormWatcherState.loadFailure(FormFailure formFailure) =
      _LoadFailure;
}
