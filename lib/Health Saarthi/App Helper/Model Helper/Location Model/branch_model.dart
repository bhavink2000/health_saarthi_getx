class BranchModel {
  int? status;
  List<BranchData>? data;

  BranchModel({this.status, this.data});

  BranchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <BranchData>[];
      json['data'].forEach((v) {
        data!.add(BranchData.fromJson(v));
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

class BranchData {
  int? id;
  int? userId;
  int? stateId;
  int? sufalamStateId;
  String? sufalamStateName;
  int? cityId;
  int? sufalamCityId;
  String? sufalamCityName;
  int? areaId;
  int? sufalamAreaId;
  String? sufalamAreaName;
  int? sufalamBranchId;
  String? branchCode;
  String? branchName;
  String? latitude;
  String? longitude;
  String? emailId;
  String? contactNo;
  dynamic integrationBranchCode;
  String? address;
  dynamic description;
  int? isProcessingLocation;
  int? isShowinMobileApp;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? encCostCenterId;
  String? encUserId;
  String? createAt;

  BranchData(
      {this.id,
        this.userId,
        this.stateId,
        this.sufalamStateId,
        this.sufalamStateName,
        this.cityId,
        this.sufalamCityId,
        this.sufalamCityName,
        this.areaId,
        this.sufalamAreaId,
        this.sufalamAreaName,
        this.sufalamBranchId,
        this.branchCode,
        this.branchName,
        this.latitude,
        this.longitude,
        this.emailId,
        this.contactNo,
        this.integrationBranchCode,
        this.address,
        this.description,
        this.isProcessingLocation,
        this.isShowinMobileApp,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.encCostCenterId,
        this.encUserId,
        this.createAt});

  BranchData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    stateId = json['state_id'];
    sufalamStateId = json['sufalam_state_id'];
    sufalamStateName = json['sufalam_state_name'];
    cityId = json['city_id'];
    sufalamCityId = json['sufalam_city_id'];
    sufalamCityName = json['sufalam_city_name'];
    areaId = json['area_id'];
    sufalamAreaId = json['sufalam_area_id'];
    sufalamAreaName = json['sufalam_area_name'];
    sufalamBranchId = json['sufalam_branch_id'];
    branchCode = json['branch_code'];
    branchName = json['branch_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    emailId = json['email_id'];
    contactNo = json['contact_no'];
    integrationBranchCode = json['integration_branch_code'];
    address = json['address'];
    description = json['description'];
    isProcessingLocation = json['is_processing_location'];
    isShowinMobileApp = json['is_showin_mobile_app'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    encCostCenterId = json['enc_cost_center_id'];
    encUserId = json['enc_user_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['state_id'] = stateId;
    data['sufalam_state_id'] = sufalamStateId;
    data['sufalam_state_name'] = sufalamStateName;
    data['city_id'] = cityId;
    data['sufalam_city_id'] = sufalamCityId;
    data['sufalam_city_name'] = sufalamCityName;
    data['area_id'] = areaId;
    data['sufalam_area_id'] = sufalamAreaId;
    data['sufalam_area_name'] = sufalamAreaName;
    data['sufalam_branch_id'] = sufalamBranchId;
    data['branch_code'] = branchCode;
    data['branch_name'] = branchName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['email_id'] = emailId;
    data['contact_no'] = contactNo;
    data['integration_branch_code'] = integrationBranchCode;
    data['address'] = address;
    data['description'] = description;
    data['is_processing_location'] = isProcessingLocation;
    data['is_showin_mobile_app'] = isShowinMobileApp;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['enc_cost_center_id'] = encCostCenterId;
    data['enc_user_id'] = encUserId;
    data['create_at'] = createAt;
    return data;
  }
}