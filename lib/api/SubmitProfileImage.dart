/// message : "success update status"
/// status : 200

class SubmitProfileImage {
  SubmitProfileImage({
      String? message, 
      num? status,}){
    _message = message;
    _status = status;
}

  SubmitProfileImage.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
  }
  String? _message;
  num? _status;
SubmitProfileImage copyWith({  String? message,
  num? status,
}) => SubmitProfileImage(  message: message ?? _message,
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