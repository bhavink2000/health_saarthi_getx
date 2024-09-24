class FaqsModel {
  int? status;
  List<Data>? data;

  FaqsModel({this.status, this.data});

  FaqsModel.fromJson(Map<String, dynamic> json) {
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
  String? question;
  String? answer;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? encId;
  String? createAt;

  Data(
      {this.id,
        this.question,
        this.answer,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.encId,
        this.createAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
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
    data['question'] = question;
    data['answer'] = answer;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['enc_id'] = encId;
    data['create_at'] = createAt;
    return data;
  }
}