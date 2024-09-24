class ProfileModel {
  int? status;
  Data? data;

  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  dynamic parentId;
  dynamic b2bSubadminId;
  int? salesExecutiveAdminId;
  int? pharmacyCode;
  dynamic msdCode;
  String? name;
  String? vendorName;
  String? mobile;
  String? emailId;
  dynamic emailVerifiedAt;
  dynamic countryId;
  int? stateId;
  int? cityId;
  int? areaId;
  int? userId;
  int? costCenterId;
  String? address;
  String? pincode;
  String? pancard;
  String? pancardNumber;
  String? addressProof;
  String? aadharFront;
  String? aadharBack;
  String? chequeImage;
  String? gstNumber;
  dynamic gstImage;
  String? bankName;
  String? ifsc;
  String? accountNumber;
  dynamic message;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? encPharmacyId;
  String? encUserId;
  String? pancardImg;
  String? addressProofImg;
  String? aadharFrontImg;
  String? aadharBackImg;
  String? chequeImg;
  dynamic gstImg;
  String? createAt;
  State? state;
  City? city;
  Area? area;
  CostCenter? costCenter;

  Data(
      {this.id,
        this.parentId,
        this.b2bSubadminId,
        this.salesExecutiveAdminId,
        this.pharmacyCode,
        this.msdCode,
        this.name,
        this.vendorName,
        this.mobile,
        this.emailId,
        this.emailVerifiedAt,
        this.countryId,
        this.stateId,
        this.cityId,
        this.areaId,
        this.userId,
        this.costCenterId,
        this.address,
        this.pincode,
        this.pancard,
        this.pancardNumber,
        this.addressProof,
        this.aadharFront,
        this.aadharBack,
        this.chequeImage,
        this.gstNumber,
        this.gstImage,
        this.bankName,
        this.ifsc,
        this.accountNumber,
        this.message,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.encPharmacyId,
        this.encUserId,
        this.pancardImg,
        this.addressProofImg,
        this.aadharFrontImg,
        this.aadharBackImg,
        this.chequeImg,
        this.gstImg,
        this.createAt,
        this.state,
        this.city,
        this.area,
        this.costCenter});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    b2bSubadminId = json['b2b_subadmin_id'];
    salesExecutiveAdminId = json['sales_executive_admin_id'];
    pharmacyCode = json['pharmacy_code'];
    msdCode = json['msd_code'];
    name = json['name'];
    vendorName = json['vendor_name'];
    mobile = json['mobile'];
    emailId = json['email_id'];
    emailVerifiedAt = json['email_verified_at'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    userId = json['user_id'];
    costCenterId = json['cost_center_id'];
    address = json['address'];
    pincode = json['pincode'];
    pancard = json['pancard'];
    pancardNumber = json['pancard_number'];
    addressProof = json['address_proof'];
    aadharFront = json['aadhar_front'];
    aadharBack = json['aadhar_back'];
    chequeImage = json['cheque_image'];
    gstNumber = json['gst_number'];
    gstImage = json['gst_image'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    accountNumber = json['account_number'];
    message = json['message'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    encPharmacyId = json['enc_pharmacy_id'];
    encUserId = json['enc_user_id'];
    pancardImg = json['pancard_img'];
    addressProofImg = json['address_proof_img'];
    aadharFrontImg = json['aadhar_front_img'];
    aadharBackImg = json['aadhar_back_img'];
    chequeImg = json['cheque_img'];
    gstImg = json['gst_img'];
    createAt = json['create_at'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
    costCenter = json['cost_center'] != null
        ? CostCenter.fromJson(json['cost_center'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['b2b_subadmin_id'] = b2bSubadminId;
    data['sales_executive_admin_id'] = salesExecutiveAdminId;
    data['pharmacy_code'] = pharmacyCode;
    data['msd_code'] = msdCode;
    data['name'] = name;
    data['vendor_name'] = vendorName;
    data['mobile'] = mobile;
    data['email_id'] = emailId;
    data['email_verified_at'] = emailVerifiedAt;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['user_id'] = userId;
    data['cost_center_id'] = costCenterId;
    data['address'] = address;
    data['pincode'] = pincode;
    data['pancard'] = pancard;
    data['pancard_number'] = pancardNumber;
    data['address_proof'] = addressProof;
    data['aadhar_front'] = aadharFront;
    data['aadhar_back'] = aadharBack;
    data['cheque_image'] = chequeImage;
    data['gst_number'] = gstNumber;
    data['gst_image'] = gstImage;
    data['bank_name'] = bankName;
    data['ifsc'] = ifsc;
    data['account_number'] = accountNumber;
    data['message'] = message;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['enc_pharmacy_id'] = encPharmacyId;
    data['enc_user_id'] = encUserId;
    data['pancard_img'] = pancardImg;
    data['address_proof_img'] = addressProofImg;
    data['aadhar_front_img'] = aadharFrontImg;
    data['aadhar_back_img'] = aadharBackImg;
    data['cheque_img'] = chequeImg;
    data['gst_img'] = gstImg;
    data['create_at'] = createAt;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (area != null) {
      data['area'] = area!.toJson();
    }
    if (costCenter != null) {
      data['cost_center'] = costCenter!.toJson();
    }
    return data;
  }
}

class State {
  int? id;
  String? stateName;
  String? encStateId;
  String? createAt;

  State({this.id, this.stateName, this.encStateId, this.createAt});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateName = json['state_name'];
    encStateId = json['enc_state_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_name'] = stateName;
    data['enc_state_id'] = encStateId;
    data['create_at'] = createAt;
    return data;
  }
}

class City {
  int? id;
  String? cityName;
  String? encCityId;
  String? createAt;

  City({this.id, this.cityName, this.encCityId, this.createAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityName = json['city_name'];
    encCityId = json['enc_city_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city_name'] = cityName;
    data['enc_city_id'] = encCityId;
    data['create_at'] = createAt;
    return data;
  }
}

class Area {
  int? id;
  String? areaName;
  String? encAreaId;
  String? createAt;

  Area({this.id, this.areaName, this.encAreaId, this.createAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaName = json['area_name'];
    encAreaId = json['enc_area_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['area_name'] = areaName;
    data['enc_area_id'] = encAreaId;
    data['create_at'] = createAt;
    return data;
  }
}

class CostCenter {
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
  dynamic emailId;
  String? contactNo;
  String? integrationBranchCode;
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

  CostCenter(
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

  CostCenter.fromJson(Map<String, dynamic> json) {
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