class MenuData {
  final String status;
  final Map<dynamic, dynamic> result;

  MenuData({this.status, this.result});

  factory MenuData.fromJson(Map<String, dynamic> json) {
    return MenuData(
      status: json['status'],
      result: json['result'],
    );
  }
}
