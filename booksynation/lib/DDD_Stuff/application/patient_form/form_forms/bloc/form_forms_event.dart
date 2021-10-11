part of 'form_forms_bloc.dart';

@freezed
abstract class FormFormsEvent with _$FormFormsEvent {
  const factory FormFormsEvent.initialized(Option<Form> initialFormOption) =
      _Initialized;
  const factory FormFormsEvent.firstNameChanged(String firstName) =
      _FirstNameChanged;
  const factory FormFormsEvent.middleNameChanged(String middleName) =
      _MiddleNameChanged;
  const factory FormFormsEvent.lastNameChanged(String lastName) =
      _LastNameChanged;
  const factory FormFormsEvent.suffixChanged(String suffix) = _SuffixChanged;
  const factory FormFormsEvent.sexChanged(String sex) = _SexChanged;
  const factory FormFormsEvent.ageChanged(String age) = _AgeChanged;
  const factory FormFormsEvent.civStatusChanged(String civStatus) =
      _CivStatusChanged;
  const factory FormFormsEvent.philhealthChanged(String philhealth) =
      _PhilhealthChanged;
  const factory FormFormsEvent.bdayChanged(String bday) = _BdayChanged;
  const factory FormFormsEvent.addressChanged(String address) = _AddressChanged;
  const factory FormFormsEvent.regionChanged(String region) = _RegionChanged;
  const factory FormFormsEvent.provinceChanged(String province) =
      _ProvinceChanged;
  const factory FormFormsEvent.cityChanged(String city) = _CityChanged;
  const factory FormFormsEvent.brgyChanged(String brgy) = _BrgyChanged;
  const factory FormFormsEvent.zipChanged(String zip) = _ZipChanged;
  const factory FormFormsEvent.contactChanged(String contact) = _ContactChanged;
  const factory FormFormsEvent.emailChanged(String email) = _EmailInfoChanged;
  const factory FormFormsEvent.covclassChanged(String covclass) =
      _CovclassChanged;
  const factory FormFormsEvent.employedChanged(String employed) =
      _EmployedChanged;
  const factory FormFormsEvent.pregnantChanged(String pregnant) =
      _PregnantChanged;
  const factory FormFormsEvent.disabilityChanged(String disability) =
      _DisabilityChanged;
  const factory FormFormsEvent.interactedCovidChanged(String interactedCovid) =
      _InteractedCovidChanged;
  const factory FormFormsEvent.isDiagnosedChanged(String isDiagnosed) =
      _IsDiagnosedChanged;
  const factory FormFormsEvent.diagnosedDateChanged(String diagnosedDate) =
      _DiagnosedDateChanged;
  const factory FormFormsEvent.allergiesChanged(KtList<String> allergies) =
      _AllergiesChanged;
  const factory FormFormsEvent.comorbiditiesChanged(
      KtList<String> comorbidities) = _ComorbiditiesChanged;
  const factory FormFormsEvent.otherAllergiesChanged(String otherAllergies) =
      _OtherAllergiesChanged;
  const factory FormFormsEvent.othersChanged(String others) = _OthersChanged;
  const factory FormFormsEvent.saved() = _Saved;
}
  // const factory FormFormsEvent.colorChanged(Color color) = _ColorChanged;
  // const factory FormFormsEvent.todosChanged(KtList<TodoItemPrimitive> todos) =
  //     _TodosChanged;