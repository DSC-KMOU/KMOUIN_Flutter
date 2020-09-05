class CalendarData {
  final String status;
  final Map<dynamic, dynamic> result;

  CalendarData({this.status, this.result});

  factory CalendarData.fromJson(Map<String, dynamic> json) {
    return CalendarData(
      status: json['status'],
      result: json['result']['list'],
    );
  }
}
