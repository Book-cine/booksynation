import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:booksynation_form/domain/patient_form/form.dart';
import 'package:booksynation_form/domain/patient_form/form_failure.dart';
import 'package:booksynation_form/domain/patient_form/i_form_repository.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/i_note_repository.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/note.dart';
// import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';

part 'form_watcher_event.dart';
part 'form_watcher_state.dart';
part 'form_watcher_bloc.freezed.dart';

@injectable
class FormWatcherBloc extends Bloc<FormWatcherEvent, FormWatcherState> {
  final IFormRepository _formRepository;
  StreamSubscription<Either<FormFailure, KtList<Form>>> _formStreamSubscription;

  FormWatcherBloc(this._formRepository, this._formStreamSubscription)
      : super(const FormWatcherState.initial());

  @override
  Stream<FormWatcherState> mapEventToState(
    FormWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const FormWatcherState.loadInProgress();
        await _formStreamSubscription.cancel();
        _formStreamSubscription = _formRepository.watchAll().listen(
              (failureOrForms) =>
                  add(FormWatcherEvent.formsReceived(failureOrForms)),
            );
      },
      watchUncompletedStarted: (e) async* {
        yield const FormWatcherState.loadInProgress();
        await _formStreamSubscription.cancel();
        _formStreamSubscription = _formRepository.watchUncompleted().listen(
              (failureOrForms) =>
                  add(FormWatcherEvent.formsReceived(failureOrForms)),
            );
      },
      formsReceived: (e) async* {
        yield e.failureOrForms.fold(
          (f) => FormWatcherState.loadFailure(f),
          (forms) => FormWatcherState.loadSuccess(forms),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _formStreamSubscription.cancel();
    return super.close();
  }
}
