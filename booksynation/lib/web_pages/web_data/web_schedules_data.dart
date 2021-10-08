class ScheduleData {
  String uniqueId = '';
  String name = '';
  String email = '';
  String vaccine = '';
  String dosage = '';
  String category = '';
  String dateScheduled = '';

  ScheduleData(
      uniqueId, name, email, vaccine, dosage, category, dateScheduled) {
    this.uniqueId = uniqueId;
    this.name = name;
    this.email = email;
    this.vaccine = vaccine;
    this.dosage = dosage;
    this.category = category;
    this.dateScheduled = dateScheduled;
  }
}
