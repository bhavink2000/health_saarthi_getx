class StateModel {
  int? status;
  List<StateData>? data;

  StateModel({this.status, this.data});

  StateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <StateData>[];
      json['data'].forEach((v) {
        data!.add(StateData.fromJson(v));
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

class StateData {
  int? id;
  int? sufalamStateId;
  String? stateName;
  dynamic stateCode;
  String? encStateId;
  String? createAt;

  StateData(
      {this.id,
        this.sufalamStateId,
        this.stateName,
        this.stateCode,
        this.encStateId,
        this.createAt});

  StateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sufalamStateId = json['sufalam_state_id'];
    stateName = json['state_name'];
    stateCode = json['state_code'];
    encStateId = json['enc_state_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sufalam_state_id'] = sufalamStateId;
    data['state_name'] = stateName;
    data['state_code'] = stateCode;
    data['enc_state_id'] = encStateId;
    data['create_at'] = createAt;
    return data;
  }
}