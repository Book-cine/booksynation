part of 'vaccine_actor_bloc.dart';

@freezed
abstract class VaccineActorEvent with _$VaccineActorEvent {
  const factory VaccineActorEvent.deleted(Vaccine vaccine) = _DeletedWeb;
}
