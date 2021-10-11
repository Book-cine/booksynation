import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:booksynation_form/domain/patient_form/i_form_repository.dart';
import 'package:booksynation_form/domain/patient_form/form.dart';
import 'package:booksynation_form/domain/patient_form/form_failure.dart';

part 'form_actor_event.dart';
part 'form_actor_state.dart';
part 'form_actor_bloc.freezed.dart';

@injectable
class FormActorBloc extends Bloc<FormActorEvent, FormActorState> {
  final IFormRepository _formRepository;

  FormActorBloc(this._formRepository) : super(const FormActorState.initial());

  @override
  Stream<FormActorState> mapEventToState(
    FormActorEvent event,
  ) async* {
    yield const FormActorState.actionInProgress();
    final possibleFailure = await _formRepository.delete(event.form);
    yield possibleFailure.fold(
      (f) => FormActorState.deleteFailure(f),
      (_) => const FormActorState.deleteSuccess(),
    );
  }
}
