class InterestData {
  bool? success;
  int? code;
  String? message;
  List<Body>? body;

  InterestData({this.success, this.code, this.message, this.body});

  InterestData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  int? id;
  String? name;
  int? type;
  String? createdAt;
  String? updatedAt;
  List<IntrestList>? intrestList;

  Body(
      {this.id,
        this.name,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.intrestList});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['intrest_list'] != null) {
      intrestList = <IntrestList>[];
      json['intrest_list'].forEach((v) {
        intrestList!.add(new IntrestList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.intrestList != null) {
      data['intrest_list'] = this.intrestList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IntrestList {
  int? id;
  String? catId;
  String? name;
  String? createdAt;
  String? updatedAt;

  IntrestList({this.id, this.catId, this.name, this.createdAt, this.updatedAt});

  IntrestList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
