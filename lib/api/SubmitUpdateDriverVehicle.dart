/// message : "success update vehicle driver"

class SubmitUpdateDriverVehicle {
  SubmitUpdateDriverVehicle({
      String? message,}){
    _message = message;
}

  SubmitUpdateDriverVehicle.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
SubmitUpdateDriverVehicle copyWith({  String? message,
}) => SubmitUpdateDriverVehicle(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}