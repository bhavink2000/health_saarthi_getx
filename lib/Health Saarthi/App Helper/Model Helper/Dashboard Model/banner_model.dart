class BannerModel {
  int? status;
  List<Data>? data;

  BannerModel({this.status, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  int? stateId;
  int? cityId;
  int? areaId;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? encBannerId;
  String? createAt;

  Data(
      {this.id,
        this.stateId,
        this.cityId,
        this.areaId,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.encBannerId,
        this.createAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    encBannerId = json['enc_banner_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['enc_banner_id'] = encBannerId;
    data['create_at'] = createAt;
    return data;
  }
}