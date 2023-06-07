// To parse this JSON data, do
//
//     final nopol = nopolFromJson(jsonString);

import 'dart:convert';

Nopol nopolFromJson(String str) => Nopol.fromJson(json.decode(str));

String nopolToJson(Nopol data) => json.encode(data.toJson());

class Nopol {
  Nopol({
    required this.vehicleId,
    required this.policeNumber,
  });

  int vehicleId;
  String policeNumber;

  factory Nopol.fromJson(Map<String, dynamic> json) => Nopol(
    vehicleId: json["vehicle_id"],
    policeNumber: json["police_number"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle_id": vehicleId,
    "police_number": policeNumber,
  };
  @override
  String toString() => policeNumber;
}
