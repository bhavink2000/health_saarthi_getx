class BookingHistoryModel {
  int? status;
  BookingData? bookingData;

  BookingHistoryModel({this.status, this.bookingData});

  BookingHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    bookingData = json['data'] != null ? BookingData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (bookingData != null) {
      data['data'] = bookingData!.toJson();
    }
    return data;
  }
}

class BookingData {
  List<BookingItems>? bookingItems;

  BookingData({this.bookingItems});

  BookingData.fromJson(Map<String, dynamic> json) {
    if (json['booking_items'] != null) {
      bookingItems = <BookingItems>[];
      json['booking_items'].forEach((v) {
        bookingItems!.add(BookingItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bookingItems != null) {
      data['booking_items'] =
          bookingItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingItems {
  int? id;
  int? bookingCode;
  int? pharmacyPatientId;
  dynamic grossAmount;
  dynamic netAmount;
  dynamic pharmacyDiscountAmount;
  int? status;
  BookingStatus? bookingStatus;
  String? createdAt;
  String? encBookingDetailId;
  String? createAt;
  PharmacyPatient? pharmacyPatient;

  BookingItems(
      {this.id,
        this.bookingCode,
        this.pharmacyPatientId,
        this.grossAmount,
        this.netAmount,
        this.pharmacyDiscountAmount,
        this.status,
        this.bookingStatus,
        this.createdAt,
        this.encBookingDetailId,
        this.createAt,
        this.pharmacyPatient});

  BookingItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingCode = json['booking_code'];
    pharmacyPatientId = json['pharmacy_patient_id'];
    grossAmount = json['gross_amount'];
    netAmount = json['net_amount'];
    pharmacyDiscountAmount = json['pharmacy_discount_amount'];
    status = json['status'];
    bookingStatus = json['booking_status'] != null
        ? BookingStatus.fromJson(json['booking_status'])
        : null;
    createdAt = json['created_at'];
    encBookingDetailId = json['enc_booking_detail_id'];
    createAt = json['create_at'];
    pharmacyPatient = json['pharmacy_patient'] != null
        ? PharmacyPatient.fromJson(json['pharmacy_patient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['booking_code'] = bookingCode;
    data['pharmacy_patient_id'] = pharmacyPatientId;
    data['gross_amount'] = grossAmount;
    data['net_amount'] = netAmount;
    data['pharmacy_discount_amount'] = pharmacyDiscountAmount;
    data['status'] = status;
    if (bookingStatus != null) {
      data['booking_status'] = bookingStatus!.toJson();
    }
    data['created_at'] = createdAt;
    data['enc_booking_detail_id'] = encBookingDetailId;
    data['create_at'] = createAt;
    if (pharmacyPatient != null) {
      data['pharmacy_patient'] = pharmacyPatient!.toJson();
    }
    return data;
  }
}

class BookingStatus {
  String? s0;
  String? s1;
  String? s2;
  String? s3;
  String? s4;

  BookingStatus({this.s0, this.s1, this.s2, this.s3, this.s4});

  BookingStatus.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['0'] = s0;
    data['1'] = s1;
    data['2'] = s2;
    data['3'] = s3;
    data['4'] = s4;
    return data;
  }
}

class PharmacyPatient {
  int? id;
  String? name;
  String? mobileNo;
  String? createdAt;
  String? encPharmacyPatientId;
  String? createAt;

  PharmacyPatient(
      {this.id,
        this.name,
        this.mobileNo,
        this.createdAt,
        this.encPharmacyPatientId,
        this.createAt});

  PharmacyPatient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    createdAt = json['created_at'];
    encPharmacyPatientId = json['enc_pharmacy_patient_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile_no'] = mobileNo;
    data['created_at'] = createdAt;
    data['enc_pharmacy_patient_id'] = encPharmacyPatientId;
    data['create_at'] = createAt;
    return data;
  }
}