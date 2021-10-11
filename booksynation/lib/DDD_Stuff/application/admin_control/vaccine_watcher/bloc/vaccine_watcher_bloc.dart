import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:booksynation_form/domain/admin_control/i_vaccine_repository.dart';
import 'package:booksynation_form/domain/admin_control/vaccine.dart';
import 'package:booksynation_form/domain/admin_control/vaccine_failure.dart';

part 'vaccine_watcher_event.dart';
part 'vaccine_watcher_state.dart';
part 'vaccine_watcher_bloc.freezed.dart';

@injectable
class VaccineWatcherBloc
    extends Bloc<VaccineWatcherEvent, VaccineWatcherState> {
  final IVaccineRepository _vaccineRepository;
  StreamSubscription<Either<VaccineFailure, KtList<Vaccine>>>
      _vaccineStreamSubscription;

  VaccineWatcherBloc(this._vaccineRepository, this._vaccineStreamSubscription)
      : super(const VaccineWatcherState.initialWeb());

  @override
  Stream<VaccineWatcherState> mapEventToState(
    VaccineWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStartedWeb: (e) async* {
        yield const VaccineWatcherState.loadInProgressWeb();
        await _vaccineStreamSubscription.cancel();
        _vaccineStreamSubscription = _vaccineRepository.watchAllWeb().listen(
              (failureOrVaccines) =>
                  add(VaccineWatcherEvent.vaccinesReceived(failureOrVaccines)),
            );
      },
      watchUncompletedStartedWeb: (e) async* {
        yield const VaccineWatcherState.loadInProgressWeb();
        await _vaccineStreamSubscription.cancel();
        _vaccineStreamSubscription = _vaccineRepository
            .watchUncompletedWeb()
            .listen(
              (failureOrVaccines) =>
                  add(VaccineWatcherEvent.vaccinesReceived(failureOrVaccines)),
            );
      },
      vaccinesReceived: (e) async* {
        yield e.failureOrVaccines.fold(
          (f) => VaccineWatcherState.loadFailureWeb(f),
          (vaccines) => VaccineWatcherState.loadSuccessWeb(vaccines),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _vaccineStreamSubscription.cancel();
    return super.close();
  }
}
