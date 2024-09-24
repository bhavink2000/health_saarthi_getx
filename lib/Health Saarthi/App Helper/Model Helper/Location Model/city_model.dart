class CityModel {
  int? status;
  List<CityData>? data;

  CityModel({this.status, this.data});

  CityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add(CityData.fromJson(v));
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

class CityData {
  int? id;
  int? sufalamCityId;
  String? cityName;
  String? encCityId;
  String? createAt;

  CityData(
      {this.id,
        this.sufalamCityId,
        this.cityName,
        this.encCityId,
        this.createAt});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sufalamCityId = json['sufalam_city_id'];
    cityName = json['city_name'];
    encCityId = json['enc_city_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sufalam_city_id'] = sufalamCityId;
    data['city_name'] = cityName;
    data['enc_city_id'] = encCityId;
    data['create_at'] = createAt;
    return data;
  }
}