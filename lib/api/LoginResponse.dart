/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mbXMtYXBpLmdhbmVrb2Rldi5jb21cL2FwaVwvZHJpdmVyXC9sb2dpbiIsImlhdCI6MTY3MTIxMjQ2OCwiZXhwIjoxNjcxMjE2MDY4LCJuYmYiOjE2NzEyMTI0NjgsImp0aSI6IjFHQlJteHNMQUdieHQ2NVkiLCJzdWIiOjEsInBydiI6IjkxOWMzMjZkNDNhYjE1MTlhOGJhM2I4NTg2YjY4NzUyZThjODM4MDcifQ.v4TNPz711dodm8qumvIyQer12ArZRO_XtFx_XKPIF8c"}
/// message : "login success"
/// status : 200

class LoginResponse {
  LoginResponse({
      Data? data, 
      String? message, 
      num? status,}){
    _data = data;
    _message = message;
    _status = status;
}

  LoginResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _status = json['status'];
  }
  Data? _data;
  String? _message;
  num? _status;
LoginResponse copyWith({  Data? data,
  String? message,
  num? status,
}) => LoginResponse(  data: data ?? _data,
  message: message ?? _message,
  status: status ?? _status,
);
  Data? get data => _data;
  String? get message => _message;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mbXMtYXBpLmdhbmVrb2Rldi5jb21cL2FwaVwvZHJpdmVyXC9sb2dpbiIsImlhdCI6MTY3MTIxMjQ2OCwiZXhwIjoxNjcxMjE2MDY4LCJuYmYiOjE2NzEyMTI0NjgsImp0aSI6IjFHQlJteHNMQUdieHQ2NVkiLCJzdWIiOjEsInBydiI6IjkxOWMzMjZkNDNhYjE1MTlhOGJhM2I4NTg2YjY4NzUyZThjODM4MDcifQ.v4TNPz711dodm8qumvIyQer12ArZRO_XtFx_XKPIF8c"

class Data {
  Data({
      String? token,}){
    _token = token;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
Data copyWith({  String? token,
}) => Data(  token: token ?? _token,
);
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}