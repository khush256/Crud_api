class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? sem;
  String? id;

  UserModel({this.firstName, this.lastName, this.email, this.sem, this.id});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    sem = json['sem'];
    id = json['id'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['sem'] = sem;
    data['id'] = id;
    return data;
  }
}
