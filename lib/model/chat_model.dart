class DataChat {
  int? id;
  String? senderName;
  String? conversationName;
  String? type;
  String? message;
  int? status;
  String? created;
  String? deleted;
  String? picUser;

  DataChat(
      {this.id,
        this.senderName,
        this.conversationName,
        this.type,
        this.message,
        this.status,
        this.created,
        this.deleted,
        this.picUser});

  DataChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderName = json['senderName'];
    conversationName = json['conversationName'];
    type = json['type'];
    message = json['message'];
    status = json['status'];
    created = json['created'];
    deleted = json['deleted'];
    picUser = json['pic_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['senderName'] = this.senderName;
    data['conversationName'] = this.conversationName;
    data['type'] = this.type;
    data['message'] = this.message;
    data['status'] = this.status;
    data['created'] = this.created;
    data['deleted'] = this.deleted;
    data['pic_user'] = this.picUser;
    return data;
  }
}