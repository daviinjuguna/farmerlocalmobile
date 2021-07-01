//custom extension
extension E on String {
  String lastChars(int n) => substring(length - n);
}

//!Parse in milliseconds since Epoch
String parseDate(int date) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
  return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
}

String parseUniqueDate(int date) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
  String weekDay = fetchWeekDay(dateTime.weekday);
  String month = fetchMonth(dateTime.month);
  return "$weekDay ${dateTime.day} $month (${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')})";
}

String timeToHrsMinsSec({int? time}) {
  if (time == null) {
    DateTime dateTime = DateTime.now();
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  } else {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }
}

String fetchWeekDay(int weekDate) {
  switch (weekDate) {
    case 1:
      return "Monday,";
    case 2:
      return "Tuesday,";
    case 3:
      return "Wednesday,";
    case 4:
      return "Thursday,";
    case 5:
      return "Friday,";
    case 6:
      return "Saturday,";
    case 7:
      return "Sunday,";
    default:
      return "Monday,";
  }
}

String fetchMonth(int month) {
  switch (month) {
    case 1:
      return "January";
    case 2:
      return "February";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "October";
    case 11:
      return "November";
    case 12:
      return "December";
    default:
      return "January";
  }
}
