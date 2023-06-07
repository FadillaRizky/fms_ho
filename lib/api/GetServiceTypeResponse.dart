/// data : [{"service_type_id":4,"service_type":"AXLE AND SUSPENSION"},{"service_type_id":1,"service_type":"ELECTRICAL"},{"service_type_id":2,"service_type":"FUEL SYSTEM"},{"service_type_id":3,"service_type":"LUBURICATING SYSTEM"},{"service_type_id":5,"service_type":"OTHER"}]
/// message : "success get list service type"

class GetServiceTypeResponse {
  GetServiceTypeResponse({
      List<Data>? data, 
      String? message,}){
    _data = data;
    _message = message;
}

  GetServiceTypeResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }
  List<Data>? _data;
  String? _message;
GetServiceTypeResponse copyWith({  List<Data>? data,
  String? message,
}) => GetServiceTypeResponse(  data: data ?? _data,
  message: message ?? _message,
);
  List<Data>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// service_type_id : 4
/// service_type : "AXLE AND SUSPENSION"

class Data {
  Data({
      num? serviceTypeId, 
      String? serviceType,}){
    _serviceTypeId = serviceTypeId;
    _serviceType = serviceType;
}

  Data.fromJson(dynamic json) {
    _serviceTypeId = json['service_type_id'];
    _serviceType = json['service_type'];
  }
  num? _serviceTypeId;
  String? _serviceType;
Data copyWith({  num? serviceTypeId,
  String? serviceType,
}) => Data(  serviceTypeId: serviceTypeId ?? _serviceTypeId,
  serviceType: serviceType ?? _serviceType,
);
  num? get serviceTypeId => _serviceTypeId;
  String? get serviceType => _serviceType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['service_type_id'] = _serviceTypeId;
    map['service_type'] = _serviceType;
    return map;
  }

}