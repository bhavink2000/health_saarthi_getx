class NotificationModel {
  int? status;
  List<Data>? data;

  NotificationModel({this.status, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  dynamic id;
  dynamic pharmacyId;
  dynamic bookingDetailId;
  dynamic requestManagementsId;
  dynamic title;
  dynamic message;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic encId;
  dynamic createAt;

  Data(
      {this.id,
        this.pharmacyId,
        this.bookingDetailId,
        this.requestManagementsId,
        this.title,
        this.message,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.encId,
        this.createAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pharmacyId = json['pharmacy_id'];
    bookingDetailId = json['booking_detail_id'];
    requestManagementsId = json['request_managements_id'];
    title = json['title'];
    message = json['message'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    encId = json['enc_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pharmacy_id'] = pharmacyId;
    data['booking_detail_id'] = bookingDetailId;
    data['request_managements_id'] = requestManagementsId;
    data['title'] = title;
    data['message'] = message;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['enc_id'] = encId;
    data['create_at'] = createAt;
    return data;
  }
}