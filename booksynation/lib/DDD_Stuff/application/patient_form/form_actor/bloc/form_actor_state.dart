part of 'form_actor_bloc.dart';

@freezed
abstract class FormActorState with _$FormActorState {
  const factory FormActorState.initial() = _Initial;
  const factory FormActorState.actionInProgress() = _ActionInProgress;
  const factory FormActorState.deleteFailure(FormFailure formFailure) =
      _DeleteFailure;
  const factory FormActorState.deleteSuccess() = _DeleteSuccess;
}
