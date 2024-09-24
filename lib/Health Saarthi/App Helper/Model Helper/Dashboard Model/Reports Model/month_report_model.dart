class MonthReportModel {
  int? status;
  List<MonthData>? monthData;

  MonthReportModel({this.status, this.monthData});

  MonthReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      monthData = <MonthData>[];
      json['data'].forEach((v) {
        monthData!.add(MonthData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (monthData != null) {
      data['data'] = monthData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthData {
  String? month;
  dynamic amount;
  dynamic count;

  MonthData({this.month, this.amount, this.count});

  MonthData.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    amount = json['amount'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['amount'] = amount;
    data['count'] = count;
    return data;
  }
}