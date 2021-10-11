part of 'vaccine_forms_bloc.dart';

@freezed
abstract class VaccineFormsEvent with _$VaccineFormsEvent {
  const factory VaccineFormsEvent.initialized(
      Option<Vaccine> initialVaccineOption) = _InitializedWeb;
  const factory VaccineFormsEvent.nameChanged(String name) = _NameChangedWeb;
  const factory VaccineFormsEvent.dateStartChanged(String dateStart) =
      _DateStartChangedWeb;
  const factory VaccineFormsEvent.dateEndChanged(String dateEnd) =
      _DateEndChangedWeb;
  const factory VaccineFormsEvent.currentStockChanged(int currentStock) =
      _CurrentStockChangedWeb;
  const factory VaccineFormsEvent.maxStockChanged(int maxStock) =
      _MaxStockChangedWeb;
  const factory VaccineFormsEvent.savedWeb() = _SavedWeb;
}
  // const factory FormFormsEvent.colorChanged(Color color) = _ColorChanged;
  // const factory FormFormsEvent.todosChanged(KtList<TodoItemPrimitive> todos) =
  //     _TodosChanged;