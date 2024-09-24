class AreaModel {
  int? status;
  List<AreaData>? data;

  AreaModel({this.status, this.data});

  AreaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AreaData>[];
      json['data'].forEach((v) {
        data!.add(AreaData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaData {
  int? id;
  int? sufalamAreaId;
  String? areaName;
  String? encAreaId;
  String? createAt;

  AreaData(
      {this.id,
        this.sufalamAreaId,
        this.areaName,
        this.encAreaId,
        this.createAt});

  AreaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sufalamAreaId = json['sufalam_area_id'];
    areaName = json['area_name'];
    encAreaId = json['enc_area_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sufalam_area_id'] = sufalamAreaId;
    data['area_name'] = areaName;
    data['enc_area_id'] = encAreaId;
    data['create_at'] = createAt;
    return data;
  }
}