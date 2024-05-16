// import 'dart:convert';
// /// status : true
// /// message : "success"
// /// data : {"user":{"id":"9c0cbe9e-0503-46d3-a112-a3ee1d5c7b8f","full_name":"Jarie","username":"optional","email":"jaire.jemari@moongit.com","phone":null,"phone_country":null,"country":"NG","avatar":null},"token":"3212|JI4zWrCkYPpcf8BXOAfrVngso1AkhhkmTw6FBgkH"}
// /// meta : []
// /// pagination : []
//
// LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
// String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
// class LoginResponse {
//   LoginResponse({
//       bool? status,
//       String? message,
//       Data? data,
//       List<dynamic>? meta,
//       List<dynamic>? pagination,}){
//     _status = status;
//     _message = message;
//     _data = data;
//     _meta = meta;
//     _pagination = pagination;
// }
//
//   LoginResponse.fromJson(dynamic json) {
//     _status = json['status'];
//     _message = json['message'];
//     _data = json['data'] != null ? Data.fromJson(json['data']) : null;
//     if (json['meta'] != null) {
//       _meta = [];
//       json['meta'].forEach((v) {
//         _meta?.add(Dynamic.fromJson(v));
//       });
//     }
//     if (json['pagination'] != null) {
//       _pagination = [];
//       json['pagination'].forEach((v) {
//         _pagination?.add(Dynamic.fromJson(v));
//       });
//     }
//   }
//   bool _status;
//   String _message;
//   Data? _data;
//   List<dynamic> _meta;
//   List<dynamic>? _pagination;
// LoginResponse copyWith({  bool status,
//   String? message,
//   Data? data,
//   List<dynamic>? meta,
//   List<dynamic>? pagination,
// }) => LoginResponse(  status: status ?? _status,
//   message: message ?? _message,
//   data: data ?? _data,
//   meta: meta ?? _meta,
//   pagination: pagination ?? _pagination,
// );
//   bool? get status => _status;
//   String? get message => _message;
//   Data? get data => _data;
//   List<dynamic>? get meta => _meta;
//   List<dynamic>? get pagination => _pagination;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = _status;
//     map['message'] = _message;
//     if (_data != null) {
//       map['data'] = _data?.toJson();
//     }
//     if (_meta != null) {
//       map['meta'] = _meta?.map((v) => v.toJson()).toList();
//     }
//     if (_pagination != null) {
//       map['pagination'] = _pagination?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// user : {"id":"9c0cbe9e-0503-46d3-a112-a3ee1d5c7b8f","full_name":"Jarie","username":"optional","email":"jaire.jemari@moongit.com","phone":null,"phone_country":null,"country":"NG","avatar":null}
// /// token : "3212|JI4zWrCkYPpcf8BXOAfrVngso1AkhhkmTw6FBgkH"
//
// Data dataFromJson(String str) => Data.fromJson(json.decode(str));
// String dataToJson(Data data) => json.encode(data.toJson());
// class Data {
//   Data({
//       User? user,
//       String? token,}){
//     _user = user;
//     _token = token;
// }
//
//   Data.fromJson(dynamic json) {
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//     _token = json['token'];
//   }
//   User? _user;
//   String? _token;
// Data copyWith({  User? user,
//   String? token,
// }) => Data(  user: user ?? _user,
//   token: token ?? _token,
// );
//   User? get user => _user;
//   String? get token => _token;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_user != null) {
//       map['user'] = _user?.toJson();
//     }
//     map['token'] = _token;
//     return map;
//   }
//
// }
//
// /// id : "9c0cbe9e-0503-46d3-a112-a3ee1d5c7b8f"
// /// full_name : "Jarie"
// /// username : "optional"
// /// email : "jaire.jemari@moongit.com"
// /// phone : null
// /// phone_country : null
// /// country : "NG"
// /// avatar : null
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
// String userToJson(User data) => json.encode(data.toJson());
// class User {
//   User({
//       String id,
//       String fullName,
//       String username,
//       String email,
//       dynamic phone,
//       dynamic phoneCountry,
//       String country,
//       dynamic avatar,}){
//     _id = id;
//     _fullName = fullName;
//     _username = username;
//     _email = email;
//     _phone = phone;
//     _phoneCountry = phoneCountry;
//     _country = country;
//     _avatar = avatar;
// }
//
//   User.fromJson(dynamic json) {
//     _id = json['id'];
//     _fullName = json['full_name'];
//     _username = json['username'];
//     _email = json['email'];
//     _phone = json['phone'];
//     _phoneCountry = json['phone_country'];
//     _country = json['country'];
//     _avatar = json['avatar'];
//   }
//   String? _id;
//   String? _fullName;
//   String? _username;
//   String? _email;
//   dynamic _phone;
//   dynamic _phoneCountry;
//   String? _country;
//   dynamic _avatar;
// User copyWith({  String? id,
//   String? fullName,
//   String? username,
//   String? email,
//   dynamic phone,
//   dynamic phoneCountry,
//   String? country,
//   dynamic avatar,
// }) => User(  id: id ?? _id,
//   fullName: fullName ?? _fullName,
//   username: username ?? _username,
//   email: email ?? _email,
//   phone: phone ?? _phone,
//   phoneCountry: phoneCountry ?? _phoneCountry,
//   country: country ?? _country,
//   avatar: avatar ?? _avatar,
// );
//   String? get id => _id;
//   String? get fullName => _fullName;
//   String? get username => _username;
//   String? get email => _email;
//   dynamic get phone => _phone;
//   dynamic get phoneCountry => _phoneCountry;
//   String? get country => _country;
//   dynamic get avatar => _avatar;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['full_name'] = _fullName;
//     map['username'] = _username;
//     map['email'] = _email;
//     map['phone'] = _phone;
//     map['phone_country'] = _phoneCountry;
//     map['country'] = _country;
//     map['avatar'] = _avatar;
//     return map;
//   }
//
// }