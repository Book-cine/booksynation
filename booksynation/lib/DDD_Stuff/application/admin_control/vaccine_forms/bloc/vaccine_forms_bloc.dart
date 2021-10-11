import 'dart:async';
// import 'dart:ui';

// import 'package:kt_dart/kt.dart';
import 'package:bloc/bloc.dart';
import 'package:booksynation_form/domain/admin_control/value_objects_web.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booksynation_form/domain/admin_control/i_vaccine_repository.dart';
import 'package:booksynation_form/domain/admin_control/vaccine.dart';
import 'package:booksynation_form/domain/admin_control/vaccine_failure.dart';

part 'vaccine_forms_event.dart';
part 'vaccine_forms_state.dart';
part 'vaccine_forms_bloc.freezed.dart';

@injectable
class VaccineFormsBloc extends Bloc<VaccineFormsEvent, VaccineFormsState> {
  final IVaccineRepository _vaccineRepository;

  VaccineFormsBloc(this._vaccineRepository)
      : super(VaccineFormsState.initialWeb());

  @override
  Stream<VaccineFormsState> mapEventToState(
    VaccineFormsEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield e.initialVaccineOption.fold(
          () => state,
          (initialVaccine) => state.copyWith(
            vaccine: initialVaccine,
            isEditing: true,
          ),
        );
      },
      nameChanged: (e) async* {
        yield state.copyWith(
          vaccine: state.vaccine.copyWith(name: VaccineEntry(e.name)),
          saveFailureOrSuccessOption: none(),
        );
      },
      dateStartChanged: (e) async* {
        yield state.copyWith(
          vaccine: state.vaccine.copyWith(dateStart: VaccineEntry(e.dateStart)),
          saveFailureOrSuccessOption: none(),
        );
      },
      dateEndChanged: (e) async* {
        yield state.copyWith(
          vaccine: state.vaccine.copyWith(dateEnd: VaccineEntry(e.dateEnd)),
          saveFailureOrSuccessOption: none(),
        );
      },
      currentStockChanged: (e) async* {
        yield state.copyWith(
          vaccine: state.vaccine
              .copyWith(currentStock: VaccineAmount(e.currentStock)),
          saveFailureOrSuccessOption: none(),
        );
      },
      maxStockChanged: (e) async* {
        yield state.copyWith(
          vaccine: state.vaccine.copyWith(maxStock: VaccineAmount(e.maxStock)),
          saveFailureOrSuccessOption: none(),
        );
      },
      savedWeb: (e) async* {
        Either<VaccineFailure, Unit> failureOrSuccess;

        yield state.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        );

        if (state.vaccine.failureOption.isNone()) {
          failureOrSuccess = state.isEditing
              ? await _vaccineRepository.updateWeb(state.vaccine)
              : await _vaccineRepository.createWeb(state.vaccine);
        } else {
          //TODO: Check here if saving is broken
          failureOrSuccess = const VaccineFailure.unableToUpdate()
              as Either<VaccineFailure, Unit>;
        }

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
