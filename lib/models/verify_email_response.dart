import 'dart:convert';
/// status : true
/// message : "success"
/// data : {"email":"robbie.adalai@moongit.com"}

VerifyEmailResponse verifyEmailResponseFromJson(String str) => VerifyEmailResponse.fromJson(json.decode(str));
String verifyEmailResponseToJson(VerifyEmailResponse data) => json.encode(data.toJson());
class VerifyEmailResponse {
  VerifyEmailResponse({
      bool status,
      String message,
      Data data,}){
    _status = status;
    _message = message;
    _data = data;
}

  VerifyEmailResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool _status;
  String _message;
  Data _data;
VerifyEmailResponse copyWith({  bool status,
  String message,
  Data data,
}) => VerifyEmailResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool get status => _status;
  String get message => _message;
  Data get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// email : "robbie.adalai@moongit.com"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String email,}){
    _email = email;
}

  Data.fromJson(dynamic json) {
    _email = json['email'];
  }
  String _email;
Data copyWith({  String email,
}) => Data(  email: email ?? _email,
);
  String get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }

}