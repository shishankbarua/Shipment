class ClientRegisterModel {
  ClientRegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final List<Data> data;

  ClientRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.name,
    this.lname,
    required this.email,
    required this.password,
    required this.phone,
    this.country,
    this.address,
    required this.roles,
    this.profileimage,
    required this.type,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.token,
  });
  late final String name;
  late final Null lname;
  late final String email;
  late final String password;
  late final String phone;
  late final Null country;
  late final Null address;
  late final String roles;
  late final Null profileimage;
  late final String type;
  late final String updatedAt;
  late final String createdAt;
  late final int id;
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lname = null;
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    country = null;
    address = null;
    roles = json['roles'];
    profileimage = null;
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['lname'] = lname;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['country'] = country;
    _data['address'] = address;
    _data['roles'] = roles;
    _data['profileimage'] = profileimage;
    _data['type'] = type;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    _data['token'] = token;
    return _data;
  }
}
