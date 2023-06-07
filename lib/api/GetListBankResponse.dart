/// data : [{"bank_name":"BCA"},{"bank_name":"BCA SYARIAH"},{"bank_name":"BNI"},{"bank_name":"BNI SYARIAH"},{"bank_name":"BUKOPIN"},{"bank_name":"BUMI ARTA"},{"bank_name":"CIMB NIAGA"},{"bank_name":"DANAMON"},{"bank_name":"HSBC"},{"bank_name":"MANDIRI"},{"bank_name":"MAYAPADA"},{"bank_name":"MEGA"},{"bank_name":"MEGA SYARIAH"},{"bank_name":"NOBU"},{"bank_name":"OCBC NISP"},{"bank_name":"PANIN"},{"bank_name":"PERMATA"},{"bank_name":"SYARIAH BUKOPIN"},{"bank_name":"UOB"},{"bank_name":"BRI"}]
/// message : "success get list bank"

class GetListBankResponse {
  GetListBankResponse({
      List<Data>? data, 
      String? message,}){
    _data = data;
    _message = message;
}

  GetListBankResponse.fromJson(dynamic json) {
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
GetListBankResponse copyWith({  List<Data>? data,
  String? message,
}) => GetListBankResponse(  data: data ?? _data,
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

/// bank_name : "BCA"

class Data {
  Data({
      String? bankName,}){
    _bankName = bankName;
}

  Data.fromJson(dynamic json) {
    _bankName = json['bank_name'];
  }
  String? _bankName;
Data copyWith({  String? bankName,
}) => Data(  bankName: bankName ?? _bankName,
);
  String? get bankName => _bankName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bank_name'] = _bankName;
    return map;
  }

}