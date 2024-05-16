import 'dart:convert';
/// status : false
/// message : "The given data was invalid."
/// data : []
/// meta : []
/// errors : {"email":["These credentials do not match our records."]}

ApiClientResponse apiClientResponseFromJson(String str) => ApiClientResponse.fromJson(json.decode(str));
String apiClientResponseToJson(ApiClientResponse data) => json.encode(data.toJson());
class ApiClientResponse {
  ApiClientResponse({
      bool status,
      String message,
      //List<dynamic> data,
      List<dynamic> meta,
      Errors errors,}){
    _status = status;
    _message = message;
    //_data = data;
    _meta = meta;
    _errors = errors;
}

  ApiClientResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      // json['data'].forEach((v) {
      //   _data?.add(Dynamic.fromJson(v));
      // });
    }
    if (json['meta'] != null) {
      _meta = [];
      // json['meta'].forEach((v) {
      //   _meta?.add(dynamic.fromJson(v));
      // });
    }
    _errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  bool _status;
  String _message;
  List<dynamic> _data;
  List<dynamic> _meta;
  Errors _errors;
ApiClientResponse copyWith({  bool status,
  String message,
  List<dynamic> data,
  List<dynamic> meta,
  Errors errors,
}) => ApiClientResponse(  status: status ?? _status,
  message: message ?? _message,
  //data: data ?? _data,
  meta: meta ?? _meta,
  errors: errors ?? _errors,
);
  bool get status => _status;
  String get message => _message;
  List<dynamic> get data => _data;
  List<dynamic> get meta => _meta;
  Errors get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.map((v) => v.toJson()).toList();
    }
    if (_errors != null) {
      map['errors'] = _errors?.toJson();
    }
    return map;
  }

}

/// email : ["These credentials do not match our records."]

Errors errorsFromJson(String str) => Errors.fromJson(json.decode(str));
String errorsToJson(Errors data) => json.encode(data.toJson());
class Errors {
  Errors({
      List<String> email,}){
    _email = email;
}

  Errors.fromJson(dynamic json) {
    _email = json['email'] != null ? json['email'].cast<String>() : [];
  }
  List<String> _email;
Errors copyWith({  List<String> email,
}) => Errors(  email: email ?? _email,
);
  List<String> get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }

}


/*class ApiClientResponse {
  Object data;
  String code;
  String error;
  String message;
  String token;


  ApiClientResponse({
    this.data, this.code, this.error, this.message, this.token
  });

  factory ApiClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiClientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiClientResponseToJson(this);
}


ApiClientResponse _$ApiClientResponseFromJson(Map<String, dynamic> json) {
  return ApiClientResponse(
    data: json['Data'],
    code: json['Code'] as String,
    error: json['Error'] as String,
    message: json['Message'] as String,
    token: json['Token'],
  );
}

Map<String, dynamic> _$ApiClientResponseToJson(ApiClientResponse instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Error': instance.error,
      'Message': instance.message,
      'Token': instance.token,
      'Data': instance.data,
    };*/

