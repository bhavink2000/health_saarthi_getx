class YearsReportModel {
  int? status;
  List<YearData>? yearData;

  YearsReportModel({this.status, this.yearData});

  YearsReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      yearData = <YearData>[];
      json['data'].forEach((v) {
        yearData!.add(YearData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (yearData != null) {
      data['data'] = yearData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class YearData {
  String? month;
  dynamic amount;
  dynamic count;

  YearData({this.month, this.amount, this.count});

  YearData.fromJson(Map<String, dynamic> json) {
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