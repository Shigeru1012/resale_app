class Data {
  int? id;
  String? agencyName;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? jobTitle;
  String? lastLoginDate;
  String? created;
  String? updated;
  String? picUser;

  Data(
      {this.id,
        this.agencyName,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.jobTitle,
        this.lastLoginDate,
        this.created,
        this.updated,
        this.picUser});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyName = json['agencyName'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    jobTitle = json['jobTitle'];
    lastLoginDate = json['lastLoginDate'];
    created = json['created'];
    updated = json['updated'];
    picUser = json['picUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agencyName'] = this.agencyName;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['jobTitle'] = this.jobTitle;
    data['lastLoginDate'] = this.lastLoginDate;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['picUser'] = this.picUser;
    return data;
  }
}