class MobileNumberModel {
  int? status;
  List<MobileData>? mobileData;

  MobileNumberModel({this.status, this.mobileData});

  MobileNumberModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      mobileData = <MobileData>[];
      json['data'].forEach((v) {
        mobileData!.add(MobileData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (mobileData != null) {
      data['data'] = mobileData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MobileData {
  int? id;
  dynamic mobileNo;
  String? name;
  dynamic encPharmacyPatientId;
  dynamic createAt;

  MobileData(
      {this.id,
        this.mobileNo,
        this.name,
        this.encPharmacyPatientId,
        this.createAt});

  MobileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNo = json['mobile_no'];
    name = json['name'];
    encPharmacyPatientId = json['enc_pharmacy_patient_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mobile_no'] = mobileNo;
    data['name'] = name;
    data['enc_pharmacy_patient_id'] = encPharmacyPatientId;
    data['create_at'] = createAt;
    return data;
  }
}