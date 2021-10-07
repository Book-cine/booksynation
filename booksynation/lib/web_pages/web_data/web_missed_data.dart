class MissedData {
  int index = 0;
  String uniqueId = '';
  String name = '';
  String email = '';
  String vaccine = '';
  String dosage = '';
  String category = '';
  String dateScheduled = '';

  MissedData(
      index, uniqueId, name, email, vaccine, dosage, category, dateScheduled) {
    this.index = index;
    this.uniqueId = uniqueId;
    this.name = name;
    this.email = email;
    this.vaccine = vaccine;
    this.dosage = dosage;
    this.category = category;
    this.dateScheduled = dateScheduled;
  }
}
