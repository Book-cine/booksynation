import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booksynation_form/domain/admin_control/i_vaccine_repository.dart';
import 'package:booksynation_form/domain/admin_control/vaccine.dart';
import 'package:booksynation_form/domain/admin_control/vaccine_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'vaccine_actor_event.dart';
part 'vaccine_actor_state.dart';
part 'vaccine_actor_bloc.freezed.dart';

@injectable
class VaccineActorBloc extends Bloc<VaccineActorEvent, VaccineActorState> {
  final IVaccineRepository _formRepository;

  VaccineActorBloc(this._formRepository)
      : super(const VaccineActorState.initialWeb());

  @override
  Stream<VaccineActorState> mapEventToState(
    VaccineActorEvent event,
  ) async* {
    yield const VaccineActorState.actionInProgressWeb();
    final possibleFailure = await _formRepository.deleteWeb(event.vaccine);
    yield possibleFailure.fold(
      (f) => VaccineActorState.deleteFailureWeb(f),
      (_) => const VaccineActorState.deleteSuccessWeb(),
    );
  }
}
