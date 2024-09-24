class DayReportModel {
  int? status;
  List<DayData>? dayData;

  DayReportModel({this.status, this.dayData});

  DayReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dayData = <DayData>[];
      json['data'].forEach((v) {
        dayData!.add(DayData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (dayData != null) {
      data['data'] = dayData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayData {
  String? date;
  dynamic amount;
  dynamic count;

  DayData({this.date, this.amount, this.count});

  DayData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['amount'] = amount;
    data['count'] = count;
    return data;
  }
}