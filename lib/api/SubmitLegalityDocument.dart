/// message : "success update legality document"
/// status : 200

class SubmitLegalityDocument {
  SubmitLegalityDocument({
      String? message, 
      num? status,}){
    _message = message;
    _status = status;
}

  SubmitLegalityDocument.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
  }
  String? _message;
  num? _status;
SubmitLegalityDocument copyWith({  String? message,
  num? status,
}) => SubmitLegalityDocument(  message: message ?? _message,
  status: status ?? _status,
);
  String? get message => _message;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}