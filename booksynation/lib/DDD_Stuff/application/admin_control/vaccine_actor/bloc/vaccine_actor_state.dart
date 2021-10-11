part of 'vaccine_actor_bloc.dart';

@freezed
abstract class VaccineActorState with _$VaccineActorState {
  const factory VaccineActorState.initialWeb() = _InitialWeb;
  const factory VaccineActorState.actionInProgressWeb() = _ActionInProgressWeb;
  const factory VaccineActorState.deleteFailureWeb(
      VaccineFailure vaccineFailure) = _DeleteFailureWeb;
  const factory VaccineActorState.deleteSuccessWeb() = _DeleteSuccessWeb;
}
