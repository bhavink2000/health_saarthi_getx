class LoginModel {
  int? status;
  String? accessToken;
  String? tokenType;
  Data? data;
  int? expiresIn;

  LoginModel(
      {this.status,
        this.accessToken,
        this.tokenType,
        this.data,
        this.expiresIn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['expires_in'] = expiresIn;
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
  int? otp;
  dynamic otpVerifiedAt;
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
  dynamic gstNumber;
  dynamic gstImage;
  String? bankName;
  String? ifsc;
  String? accountNumber;
  dynamic message;
  int? status;
  dynamic deletedAt;
  String? createAt;
  String? updateAt;
  String? encPharmacyId;
  String? encUserId;
  String? pancardImg;
  String? addressProofImg;
  String? aadharFrontImg;
  String? aadharBackImg;
  String? chequeImg;
  dynamic gstImg;

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
        this.otp,
        this.otpVerifiedAt,
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
        this.deletedAt,
        this.createAt,
        this.updateAt,
        this.encPharmacyId,
        this.encUserId,
        this.pancardImg,
        this.addressProofImg,
        this.aadharFrontImg,
        this.aadharBackImg,
        this.chequeImg,
        this.gstImg});

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
    otp = json['otp'];
    otpVerifiedAt = json['otp_verified_at'];
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
    deletedAt = json['deleted_at'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    encPharmacyId = json['enc_pharmacy_id'];
    encUserId = json['enc_user_id'];
    pancardImg = json['pancard_img'];
    addressProofImg = json['address_proof_img'];
    aadharFrontImg = json['aadhar_front_img'];
    aadharBackImg = json['aadhar_back_img'];
    chequeImg = json['cheque_img'];
    gstImg = json['gst_img'];
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
    data['otp'] = otp;
    data['otp_verified_at'] = otpVerifiedAt;
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
    data['deleted_at'] = deletedAt;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    data['enc_pharmacy_id'] = encPharmacyId;
    data['enc_user_id'] = encUserId;
    data['pancard_img'] = pancardImg;
    data['address_proof_img'] = addressProofImg;
    data['aadhar_front_img'] = aadharFrontImg;
    data['aadhar_back_img'] = aadharBackImg;
    data['cheque_img'] = chequeImg;
    data['gst_img'] = gstImg;
    return data;
  }
}