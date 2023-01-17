class AddChat {
  String? type;
  String? message;
  String? status;
  String? created;
  Null? deleted;

  AddChat({this.type, this.message, this.status, this.created, this.deleted});

  AddChat.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    status = json['status'];
    created = json['created'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    data['status'] = this.status;
    data['created'] = this.created;
    data['deleted'] = this.deleted;
    return data;
  }
}