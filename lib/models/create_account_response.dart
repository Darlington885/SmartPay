import 'dart:convert';
/// status : true
/// message : "success"
/// data : {"user":{"full_name":"Abrah","username":"Musk","email":"robbie.adalai@moongit.com","country":"NG","id":"9c0cc2b8-6225-479c-bca1-2203b37ef7a4"},"token":"3213|0iv6kelGuiA0NJuBPC8U41QPHNrTfpjRsUQmb6LC"}
/// meta : []
/// pagination : []

CreateAccountResponse createAccountResponseFromJson(String str) => CreateAccountResponse.fromJson(json.decode(str));
String createAccountResponseToJson(CreateAccountResponse data) => json.encode(data.toJson());
class CreateAccountResponse {
  CreateAccountResponse({
      bool status,
      String message,
      Data data,
      List<dynamic> meta,
      List<dynamic> pagination,}){
    _status = status;
    _message = message;
    _data = data;
    _meta = meta;
    _pagination = pagination;
}

  CreateAccountResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;

  }
  bool _status;
  String _message;
  Data _data;
  List<dynamic> _meta;
  List<dynamic> _pagination;
CreateAccountResponse copyWith({  bool status,
  String message,
  Data data,
  List<dynamic> meta,
  List<dynamic> pagination,
}) => CreateAccountResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  meta: meta ?? _meta,
  pagination: pagination ?? _pagination,
);
  bool get status => _status;
  String get message => _message;
  Data get data => _data;
  List<dynamic> get meta => _meta;
  List<dynamic> get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// user : {"full_name":"Abrah","username":"Musk","email":"robbie.adalai@moongit.com","country":"NG","id":"9c0cc2b8-6225-479c-bca1-2203b37ef7a4"}
/// token : "3213|0iv6kelGuiA0NJuBPC8U41QPHNrTfpjRsUQmb6LC"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      User user,
      String token,}){
    _user = user;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  User _user;
  String _token;
Data copyWith({  User user,
  String token,
}) => Data(  user: user ?? _user,
  token: token ?? _token,
);
  User get user => _user;
  String get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

/// full_name : "Abrah"
/// username : "Musk"
/// email : "robbie.adalai@moongit.com"
/// country : "NG"
/// id : "9c0cc2b8-6225-479c-bca1-2203b37ef7a4"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String fullName,
      String username,
      String email,
      String country,
      String id,}){
    _fullName = fullName;
    _username = username;
    _email = email;
    _country = country;
    _id = id;
}

  User.fromJson(dynamic json) {
    _fullName = json['full_name'];
    _username = json['username'];
    _email = json['email'];
    _country = json['country'];
    _id = json['id'];
  }
  String _fullName;
  String _username;
  String _email;
  String _country;
  String _id;
User copyWith({  String fullName,
  String username,
  String email,
  String country,
  String id,
}) => User(  fullName: fullName ?? _fullName,
  username: username ?? _username,
  email: email ?? _email,
  country: country ?? _country,
  id: id ?? _id,
);
  String get fullName => _fullName;
  String get username => _username;
  String get email => _email;
  String get country => _country;
  String get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = _fullName;
    map['username'] = _username;
    map['email'] = _email;
    map['country'] = _country;
    map['id'] = _id;
    return map;
  }

}