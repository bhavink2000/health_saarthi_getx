class TodayDealModel {
  int? status;
  List<TodayData>? todayData;

  TodayDealModel({this.status, this.todayData});

  TodayDealModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      todayData = <TodayData>[];
      json['data'].forEach((v) {
        todayData!.add(TodayData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (todayData != null) {
      data['data'] = todayData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TodayData {
  int? id;
  int? stateId;
  int? cityId;
  int? areaId;
  dynamic costCenterId;
  int? userId;
  dynamic b2bSubadminId;
  dynamic pharmacyIds;
  String? applyForTypeId;
  int? applyForTestType;
  dynamic testManagementsId;
  int? applyForPackageType;
  dynamic testPackageManagementsId;
  int? applyForProfileType;
  dynamic testProfileManagementsId;
  int? discountTypeId;
  String? discountTypeValue;
  String? fromDate;
  String? toDate;
  dynamic offerCode;
  dynamic title;
  dynamic minAmount;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? encSchemeId;
  String? createAt;

  TodayData(
      {this.id,
        this.stateId,
        this.cityId,
        this.areaId,
        this.costCenterId,
        this.userId,
        this.b2bSubadminId,
        this.pharmacyIds,
        this.applyForTypeId,
        this.applyForTestType,
        this.testManagementsId,
        this.applyForPackageType,
        this.testPackageManagementsId,
        this.applyForProfileType,
        this.testProfileManagementsId,
        this.discountTypeId,
        this.discountTypeValue,
        this.fromDate,
        this.toDate,
        this.offerCode,
        this.title,
        this.minAmount,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.encSchemeId,
        this.createAt});

  TodayData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    costCenterId = json['cost_center_id'];
    userId = json['user_id'];
    b2bSubadminId = json['b2b_subadmin_id'];
    pharmacyIds = json['pharmacy_ids'];
    applyForTypeId = json['apply_for_type_id'];
    applyForTestType = json['apply_for_test_type'];
    testManagementsId = json['test_managements_id'];
    applyForPackageType = json['apply_for_package_type'];
    testPackageManagementsId = json['test_package_managements_id'];
    applyForProfileType = json['apply_for_profile_type'];
    testProfileManagementsId = json['test_profile_managements_id'];
    discountTypeId = json['discount_type_id'];
    discountTypeValue = json['discount_type_value'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    offerCode = json['offer_code'];
    title = json['title'];
    minAmount = json['min_amount'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    encSchemeId = json['enc_scheme_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['cost_center_id'] = costCenterId;
    data['user_id'] = userId;
    data['b2b_subadmin_id'] = b2bSubadminId;
    data['pharmacy_ids'] = pharmacyIds;
    data['apply_for_type_id'] = applyForTypeId;
    data['apply_for_test_type'] = applyForTestType;
    data['test_managements_id'] = testManagementsId;
    data['apply_for_package_type'] = applyForPackageType;
    data['test_package_managements_id'] = testPackageManagementsId;
    data['apply_for_profile_type'] = applyForProfileType;
    data['test_profile_managements_id'] = testProfileManagementsId;
    data['discount_type_id'] = discountTypeId;
    data['discount_type_value'] = discountTypeValue;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['offer_code'] = offerCode;
    data['title'] = title;
    data['min_amount'] = minAmount;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['enc_scheme_id'] = encSchemeId;
    data['create_at'] = createAt;
    return data;
  }
}