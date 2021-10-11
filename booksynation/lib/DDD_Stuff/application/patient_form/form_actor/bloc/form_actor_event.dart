part of 'form_actor_bloc.dart';

@freezed
abstract class FormActorEvent with _$FormActorEvent {
  const factory FormActorEvent.deleted(Form form) = _Deleted;
}
