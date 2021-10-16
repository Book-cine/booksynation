class StatusData {
  int booked = 0;
  int completed = 0;
  int rescheduled = 0;
  int cancelled = 0;

  StatusData(booked, completed, rescheduled, cancelled) {
    this.booked = booked;
    this.completed = completed;
    this.rescheduled = rescheduled;
    this.cancelled = cancelled;
  }
}
