import 'dart:convert';
/// status : true
/// message : "success"
/// data : {"secret":"Live as if you were to die tomorrow. Learn as if you were to live forever. - Mahatma Gandhi"}

DashboardResponse dashboardResponseFromJson(String str) => DashboardResponse.fromJson(json.decode(str));
String dashboardResponseToJson(DashboardResponse data) => json.encode(data.toJson());
class DashboardResponse {
  DashboardResponse({
      bool status,
      String message,
      Data data,}){
    _status = status;
    _message = message;
    _data = data;
}

  DashboardResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool _status;
  String _message;
  Data _data;
DashboardResponse copyWith({  bool status,
  String message,
  Data data,
}) => DashboardResponse(  status: status ?? _status,
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

/// secret : "Live as if you were to die tomorrow. Learn as if you were to live forever. - Mahatma Gandhi"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String secret,}){
    _secret = secret;
}

  Data.fromJson(dynamic json) {
    _secret = json['secret'];
  }
  String _secret;
Data copyWith({  String secret,
}) => Data(  secret: secret ?? _secret,
);
  String get secret => _secret;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['secret'] = _secret;
    return map;
  }

}