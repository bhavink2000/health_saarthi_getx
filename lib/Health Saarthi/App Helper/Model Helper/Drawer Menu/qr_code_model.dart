class QRCodeModel {
  int? status;
  String? massage;
  Data? data;
  String? pdf;

  QRCodeModel({this.status, this.massage, this.data, this.pdf});

  QRCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['massage'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    pdf = json['pdf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['massage'] = massage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['pdf'] = pdf;
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
  dynamic otp;
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
  dynamic beneficiaryName;
  String? ifsc;
  String? accountNumber;
  String? qrcodeImage;
  dynamic orCodePdf;
  dynamic message;
  int? isOldPharmacy;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? qrcodeImagePath;
  String? qrcodeImageBase;
  String? encPharmacyId;
  String? encUserId;
  String? pancardImg;
  String? addressProofImg;
  String? aadharFrontImg;
  String? aadharBackImg;
  String? chequeImg;
  dynamic gstImg;
  String? pancardDownload;
  String? addressProofDownload;
  String? aadharFrontDownload;
  String? aadharBackDownload;
  String? chequeDownload;
  dynamic gstDownload;
  String? createAt;

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
        this.beneficiaryName,
        this.ifsc,
        this.accountNumber,
        this.qrcodeImage,
        this.orCodePdf,
        this.message,
        this.isOldPharmacy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.qrcodeImagePath,
        this.qrcodeImageBase,
        this.encPharmacyId,
        this.encUserId,
        this.pancardImg,
        this.addressProofImg,
        this.aadharFrontImg,
        this.aadharBackImg,
        this.chequeImg,
        this.gstImg,
        this.pancardDownload,
        this.addressProofDownload,
        this.aadharFrontDownload,
        this.aadharBackDownload,
        this.chequeDownload,
        this.gstDownload,
        this.createAt});

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
    beneficiaryName = json['beneficiary_name'];
    ifsc = json['ifsc'];
    accountNumber = json['account_number'];
    qrcodeImage = json['qrcode_image'];
    orCodePdf = json['or_code_pdf'];
    message = json['message'];
    isOldPharmacy = json['is_old_pharmacy'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    qrcodeImagePath = json['qrcode_image_path'];
    qrcodeImageBase = json['qrcode_image_base'];
    encPharmacyId = json['enc_pharmacy_id'];
    encUserId = json['enc_user_id'];
    pancardImg = json['pancard_img'];
    addressProofImg = json['address_proof_img'];
    aadharFrontImg = json['aadhar_front_img'];
    aadharBackImg = json['aadhar_back_img'];
    chequeImg = json['cheque_img'];
    gstImg = json['gst_img'];
    pancardDownload = json['pancard_download'];
    addressProofDownload = json['address_proof_download'];
    aadharFrontDownload = json['aadhar_front_download'];
    aadharBackDownload = json['aadhar_back_download'];
    chequeDownload = json['cheque_download'];
    gstDownload = json['gst_download'];
    createAt = json['create_at'];
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
    data['beneficiary_name'] = beneficiaryName;
    data['ifsc'] = ifsc;
    data['account_number'] = accountNumber;
    data['qrcode_image'] = qrcodeImage;
    data['or_code_pdf'] = orCodePdf;
    data['message'] = message;
    data['is_old_pharmacy'] = isOldPharmacy;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['qrcode_image_path'] = qrcodeImagePath;
    data['qrcode_image_base'] = qrcodeImageBase;
    data['enc_pharmacy_id'] = encPharmacyId;
    data['enc_user_id'] = encUserId;
    data['pancard_img'] = pancardImg;
    data['address_proof_img'] = addressProofImg;
    data['aadhar_front_img'] = aadharFrontImg;
    data['aadhar_back_img'] = aadharBackImg;
    data['cheque_img'] = chequeImg;
    data['gst_img'] = gstImg;
    data['pancard_download'] = pancardDownload;
    data['address_proof_download'] = addressProofDownload;
    data['aadhar_front_download'] = aadharFrontDownload;
    data['aadhar_back_download'] = aadharBackDownload;
    data['cheque_download'] = chequeDownload;
    data['gst_download'] = gstDownload;
    data['create_at'] = createAt;
    return data;
  }
}
