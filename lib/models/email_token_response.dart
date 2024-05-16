import 'dart:convert';
/// status : true
/// message : "success"
/// data : {"token":"15043"}

EmailTokenResponse emailTokenResponseFromJson(String str) => EmailTokenResponse.fromJson(json.decode(str));
String emailTokenResponseToJson(EmailTokenResponse data) => json.encode(data.toJson());
class EmailTokenResponse {
  EmailTokenResponse({
      bool status,
      String message,
      Data data,}){
    _status = status;
    _message = message;
    _data = data;
}

  EmailTokenResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool _status;
  String _message;
  Data _data;
EmailTokenResponse copyWith({  bool status,
  String message,
  Data data,
}) => EmailTokenResponse(  status: status ?? _status,
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

/// token : "15043"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String token,}){
    _token = token;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
  }
  String _token;
Data copyWith({  String token,
}) => Data(  token: token ?? _token,
);
  String get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}