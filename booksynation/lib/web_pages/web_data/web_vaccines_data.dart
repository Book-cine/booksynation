class VaccineData {
  String vaccine = '';
  String dateStart = '';
  String dateEnd = '';
  int currentStock = 0;
  int maxStock = 0;

  VaccineData(vaccine, dateStart, dateEnd, currentStock, maxStock) {
    this.vaccine = vaccine;
    this.dateStart = dateStart;
    this.dateEnd = dateEnd;
    this.currentStock = currentStock;
    this.maxStock = maxStock;
  }
}
