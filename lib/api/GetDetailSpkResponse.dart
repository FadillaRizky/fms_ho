/// data : {"spk_detail":{"spk_id":87,"spk_number":"SPK/2023/03/28/009","service_type":"REPAIR","km":162957,"problem_detail":"TULANG TENGAH BOX PATAH, LAS ENGSEL WING BOX, LAS ENGSEL PINTU BELAKANG, LAS CAHSIS BOX BELAKANG, SERVICE BERKALA, GANTI O.M, F.0, F.S A/B","location":"POOL SETU","latitude":null,"longitude":null,"status":"CLOSED","driver_image":null,"image1":null,"image2":null,"image3":null,"vehicle_id":23,"police_number":"B 9937 FEU","driver_id":4,"driver_name":"JPP","total_additional_cost":825000,"total_subcon_cost":0,"total_sparepart_amount":1571500,"total_amount":2396500},"sparepart_list":[{"factory_number":"RD260-32","sparepart_name":"KAWAT LAS RD260 3,2MM NIKKO","sparepart_uom":"KG","quantity":1,"total_price":30000},{"factory_number":"EAW-001","sparepart_name":"ENGSEL ATAS WINGBOX","sparepart_uom":"PCS","quantity":3,"total_price":435000},{"factory_number":"GC4-WD","sparepart_name":"MATA GERINDA POTONG 4 INCHI","sparepart_uom":"PCS","quantity":3,"total_price":9000},{"factory_number":"15607-2190L","sparepart_name":"FILTER OLI HINO LOHAN TI / HINO 500","sparepart_uom":"PCS","quantity":1,"total_price":145000},{"factory_number":"23401-1332L","sparepart_name":"FILTER SOLAR ATAS HINO 500 HOP","sparepart_uom":"PCS","quantity":1,"total_price":32500},{"factory_number":"23304-JAC70","sparepart_name":"FILTER SOLAR BAWAH FL 235","sparepart_uom":"PCS","quantity":1,"total_price":95000},{"factory_number":"R4X-15W40","sparepart_name":"OLI MESIN 15W-40 RIMULA","sparepart_uom":"LTR","quantity":15,"total_price":825000}],"additional_cost":[{"additional_type":"Other Welding BOX","additional_cost":450000},{"additional_type":"General PM (Preventive Maintenance)","additional_cost":375000}],"subcon":[{"subcon_description":"beli filter solar atas","subcon_cost":50000,"receipt_path":"public/images/spk/receipt/9592.jpeg"},{"subcon_description":"beli filter solar bawah 1 pcs","subcon_cost":110000,"receipt_path":"public/images/spk/receipt/9390.jpeg"},{"subcon_description":"jasa bongkar pasang","subcon_cost":10000,"receipt_path":"public/images/spk/receipt/5516.jpeg"}]}
/// message : "success get spk detail"

class GetDetailSpkResponse {
  GetDetailSpkResponse({
      Data? data, 
      String? message,}){
    _data = data;
    _message = message;
}

  GetDetailSpkResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  Data? _data;
  String? _message;
GetDetailSpkResponse copyWith({  Data? data,
  String? message,
}) => GetDetailSpkResponse(  data: data ?? _data,
  message: message ?? _message,
);
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// spk_detail : {"spk_id":87,"spk_number":"SPK/2023/03/28/009","service_type":"REPAIR","km":162957,"problem_detail":"TULANG TENGAH BOX PATAH, LAS ENGSEL WING BOX, LAS ENGSEL PINTU BELAKANG, LAS CAHSIS BOX BELAKANG, SERVICE BERKALA, GANTI O.M, F.0, F.S A/B","location":"POOL SETU","latitude":null,"longitude":null,"status":"CLOSED","driver_image":null,"image1":null,"image2":null,"image3":null,"vehicle_id":23,"police_number":"B 9937 FEU","driver_id":4,"driver_name":"JPP","total_additional_cost":825000,"total_subcon_cost":0,"total_sparepart_amount":1571500,"total_amount":2396500}
/// sparepart_list : [{"factory_number":"RD260-32","sparepart_name":"KAWAT LAS RD260 3,2MM NIKKO","sparepart_uom":"KG","quantity":1,"total_price":30000},{"factory_number":"EAW-001","sparepart_name":"ENGSEL ATAS WINGBOX","sparepart_uom":"PCS","quantity":3,"total_price":435000},{"factory_number":"GC4-WD","sparepart_name":"MATA GERINDA POTONG 4 INCHI","sparepart_uom":"PCS","quantity":3,"total_price":9000},{"factory_number":"15607-2190L","sparepart_name":"FILTER OLI HINO LOHAN TI / HINO 500","sparepart_uom":"PCS","quantity":1,"total_price":145000},{"factory_number":"23401-1332L","sparepart_name":"FILTER SOLAR ATAS HINO 500 HOP","sparepart_uom":"PCS","quantity":1,"total_price":32500},{"factory_number":"23304-JAC70","sparepart_name":"FILTER SOLAR BAWAH FL 235","sparepart_uom":"PCS","quantity":1,"total_price":95000},{"factory_number":"R4X-15W40","sparepart_name":"OLI MESIN 15W-40 RIMULA","sparepart_uom":"LTR","quantity":15,"total_price":825000}]
/// additional_cost : [{"additional_type":"Other Welding BOX","additional_cost":450000},{"additional_type":"General PM (Preventive Maintenance)","additional_cost":375000}]
/// subcon : [{"subcon_description":"beli filter solar atas","subcon_cost":50000,"receipt_path":"public/images/spk/receipt/9592.jpeg"},{"subcon_description":"beli filter solar bawah 1 pcs","subcon_cost":110000,"receipt_path":"public/images/spk/receipt/9390.jpeg"},{"subcon_description":"jasa bongkar pasang","subcon_cost":10000,"receipt_path":"public/images/spk/receipt/5516.jpeg"}]

class Data {
  Data({
      SpkDetail? spkDetail, 
      List<SparepartList>? sparepartList, 
      List<AdditionalCost>? additionalCost, 
      List<Subcon>? subcon,}){
    _spkDetail = spkDetail;
    _sparepartList = sparepartList;
    _additionalCost = additionalCost;
    _subcon = subcon;
}

  Data.fromJson(dynamic json) {
    _spkDetail = json['spk_detail'] != null ? SpkDetail.fromJson(json['spk_detail']) : null;
    if (json['sparepart_list'] != null) {
      _sparepartList = [];
      json['sparepart_list'].forEach((v) {
        _sparepartList?.add(SparepartList.fromJson(v));
      });
    }
    if (json['additional_cost'] != null) {
      _additionalCost = [];
      json['additional_cost'].forEach((v) {
        _additionalCost?.add(AdditionalCost.fromJson(v));
      });
    }
    if (json['subcon'] != null) {
      _subcon = [];
      json['subcon'].forEach((v) {
        _subcon?.add(Subcon.fromJson(v));
      });
    }
  }
  SpkDetail? _spkDetail;
  List<SparepartList>? _sparepartList;
  List<AdditionalCost>? _additionalCost;
  List<Subcon>? _subcon;
Data copyWith({  SpkDetail? spkDetail,
  List<SparepartList>? sparepartList,
  List<AdditionalCost>? additionalCost,
  List<Subcon>? subcon,
}) => Data(  spkDetail: spkDetail ?? _spkDetail,
  sparepartList: sparepartList ?? _sparepartList,
  additionalCost: additionalCost ?? _additionalCost,
  subcon: subcon ?? _subcon,
);
  SpkDetail? get spkDetail => _spkDetail;
  List<SparepartList>? get sparepartList => _sparepartList;
  List<AdditionalCost>? get additionalCost => _additionalCost;
  List<Subcon>? get subcon => _subcon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_spkDetail != null) {
      map['spk_detail'] = _spkDetail?.toJson();
    }
    if (_sparepartList != null) {
      map['sparepart_list'] = _sparepartList?.map((v) => v.toJson()).toList();
    }
    if (_additionalCost != null) {
      map['additional_cost'] = _additionalCost?.map((v) => v.toJson()).toList();
    }
    if (_subcon != null) {
      map['subcon'] = _subcon?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// subcon_description : "beli filter solar atas"
/// subcon_cost : 50000
/// receipt_path : "public/images/spk/receipt/9592.jpeg"

class Subcon {
  Subcon({
      String? subconDescription, 
      num? subconCost, 
      String? receiptPath,}){
    _subconDescription = subconDescription;
    _subconCost = subconCost;
    _receiptPath = receiptPath;
}

  Subcon.fromJson(dynamic json) {
    _subconDescription = json['subcon_description'];
    _subconCost = json['subcon_cost'];
    _receiptPath = json['receipt_path'];
  }
  String? _subconDescription;
  num? _subconCost;
  String? _receiptPath;
Subcon copyWith({  String? subconDescription,
  num? subconCost,
  String? receiptPath,
}) => Subcon(  subconDescription: subconDescription ?? _subconDescription,
  subconCost: subconCost ?? _subconCost,
  receiptPath: receiptPath ?? _receiptPath,
);
  String? get subconDescription => _subconDescription;
  num? get subconCost => _subconCost;
  String? get receiptPath => _receiptPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subcon_description'] = _subconDescription;
    map['subcon_cost'] = _subconCost;
    map['receipt_path'] = _receiptPath;
    return map;
  }

}

/// additional_type : "Other Welding BOX"
/// additional_cost : 450000

class AdditionalCost {
  AdditionalCost({
      String? additionalType, 
      num? additionalCost,}){
    _additionalType = additionalType;
    _additionalCost = additionalCost;
}

  AdditionalCost.fromJson(dynamic json) {
    _additionalType = json['additional_type'];
    _additionalCost = json['additional_cost'];
  }
  String? _additionalType;
  num? _additionalCost;
AdditionalCost copyWith({  String? additionalType,
  num? additionalCost,
}) => AdditionalCost(  additionalType: additionalType ?? _additionalType,
  additionalCost: additionalCost ?? _additionalCost,
);
  String? get additionalType => _additionalType;
  num? get additionalCost => _additionalCost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['additional_type'] = _additionalType;
    map['additional_cost'] = _additionalCost;
    return map;
  }

}

/// factory_number : "RD260-32"
/// sparepart_name : "KAWAT LAS RD260 3,2MM NIKKO"
/// sparepart_uom : "KG"
/// quantity : 1
/// total_price : 30000

class SparepartList {
  SparepartList({
      String? factoryNumber, 
      String? sparepartName, 
      String? sparepartUom, 
      num? quantity, 
      num? totalPrice,}){
    _factoryNumber = factoryNumber;
    _sparepartName = sparepartName;
    _sparepartUom = sparepartUom;
    _quantity = quantity;
    _totalPrice = totalPrice;
}

  SparepartList.fromJson(dynamic json) {
    _factoryNumber = json['factory_number'];
    _sparepartName = json['sparepart_name'];
    _sparepartUom = json['sparepart_uom'];
    _quantity = json['quantity'];
    _totalPrice = json['total_price'];
  }
  String? _factoryNumber;
  String? _sparepartName;
  String? _sparepartUom;
  num? _quantity;
  num? _totalPrice;
SparepartList copyWith({  String? factoryNumber,
  String? sparepartName,
  String? sparepartUom,
  num? quantity,
  num? totalPrice,
}) => SparepartList(  factoryNumber: factoryNumber ?? _factoryNumber,
  sparepartName: sparepartName ?? _sparepartName,
  sparepartUom: sparepartUom ?? _sparepartUom,
  quantity: quantity ?? _quantity,
  totalPrice: totalPrice ?? _totalPrice,
);
  String? get factoryNumber => _factoryNumber;
  String? get sparepartName => _sparepartName;
  String? get sparepartUom => _sparepartUom;
  num? get quantity => _quantity;
  num? get totalPrice => _totalPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['factory_number'] = _factoryNumber;
    map['sparepart_name'] = _sparepartName;
    map['sparepart_uom'] = _sparepartUom;
    map['quantity'] = _quantity;
    map['total_price'] = _totalPrice;
    return map;
  }

}

/// spk_id : 87
/// spk_number : "SPK/2023/03/28/009"
/// service_type : "REPAIR"
/// km : 162957
/// problem_detail : "TULANG TENGAH BOX PATAH, LAS ENGSEL WING BOX, LAS ENGSEL PINTU BELAKANG, LAS CAHSIS BOX BELAKANG, SERVICE BERKALA, GANTI O.M, F.0, F.S A/B"
/// location : "POOL SETU"
/// latitude : null
/// longitude : null
/// status : "CLOSED"
/// driver_image : null
/// image1 : null
/// image2 : null
/// image3 : null
/// vehicle_id : 23
/// police_number : "B 9937 FEU"
/// driver_id : 4
/// driver_name : "JPP"
/// total_additional_cost : 825000
/// total_subcon_cost : 0
/// total_sparepart_amount : 1571500
/// total_amount : 2396500

class SpkDetail {
  SpkDetail({
      num? spkId, 
      String? spkNumber, 
      String? serviceType, 
      num? km, 
      String? problemDetail, 
      String? location, 
      dynamic latitude, 
      dynamic longitude, 
      String? status, 
      dynamic driverImage, 
      dynamic image1, 
      dynamic image2, 
      dynamic image3, 
      num? vehicleId, 
      String? policeNumber, 
      num? driverId, 
      String? driverName, 
      num? totalAdditionalCost, 
      num? totalSubconCost, 
      num? totalSparepartAmount, 
      num? totalAmount,}){
    _spkId = spkId;
    _spkNumber = spkNumber;
    _serviceType = serviceType;
    _km = km;
    _problemDetail = problemDetail;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
    _status = status;
    _driverImage = driverImage;
    _image1 = image1;
    _image2 = image2;
    _image3 = image3;
    _vehicleId = vehicleId;
    _policeNumber = policeNumber;
    _driverId = driverId;
    _driverName = driverName;
    _totalAdditionalCost = totalAdditionalCost;
    _totalSubconCost = totalSubconCost;
    _totalSparepartAmount = totalSparepartAmount;
    _totalAmount = totalAmount;
}

  SpkDetail.fromJson(dynamic json) {
    _spkId = json['spk_id'];
    _spkNumber = json['spk_number'];
    _serviceType = json['service_type'];
    _km = json['km'];
    _problemDetail = json['problem_detail'];
    _location = json['location'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _status = json['status'];
    _driverImage = json['driver_image'];
    _image1 = json['image1'];
    _image2 = json['image2'];
    _image3 = json['image3'];
    _vehicleId = json['vehicle_id'];
    _policeNumber = json['police_number'];
    _driverId = json['driver_id'];
    _driverName = json['driver_name'];
    _totalAdditionalCost = json['total_additional_cost'];
    _totalSubconCost = json['total_subcon_cost'];
    _totalSparepartAmount = json['total_sparepart_amount'];
    _totalAmount = json['total_amount'];
  }
  num? _spkId;
  String? _spkNumber;
  String? _serviceType;
  num? _km;
  String? _problemDetail;
  String? _location;
  dynamic _latitude;
  dynamic _longitude;
  String? _status;
  dynamic _driverImage;
  dynamic _image1;
  dynamic _image2;
  dynamic _image3;
  num? _vehicleId;
  String? _policeNumber;
  num? _driverId;
  String? _driverName;
  num? _totalAdditionalCost;
  num? _totalSubconCost;
  num? _totalSparepartAmount;
  num? _totalAmount;
SpkDetail copyWith({  num? spkId,
  String? spkNumber,
  String? serviceType,
  num? km,
  String? problemDetail,
  String? location,
  dynamic latitude,
  dynamic longitude,
  String? status,
  dynamic driverImage,
  dynamic image1,
  dynamic image2,
  dynamic image3,
  num? vehicleId,
  String? policeNumber,
  num? driverId,
  String? driverName,
  num? totalAdditionalCost,
  num? totalSubconCost,
  num? totalSparepartAmount,
  num? totalAmount,
}) => SpkDetail(  spkId: spkId ?? _spkId,
  spkNumber: spkNumber ?? _spkNumber,
  serviceType: serviceType ?? _serviceType,
  km: km ?? _km,
  problemDetail: problemDetail ?? _problemDetail,
  location: location ?? _location,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  status: status ?? _status,
  driverImage: driverImage ?? _driverImage,
  image1: image1 ?? _image1,
  image2: image2 ?? _image2,
  image3: image3 ?? _image3,
  vehicleId: vehicleId ?? _vehicleId,
  policeNumber: policeNumber ?? _policeNumber,
  driverId: driverId ?? _driverId,
  driverName: driverName ?? _driverName,
  totalAdditionalCost: totalAdditionalCost ?? _totalAdditionalCost,
  totalSubconCost: totalSubconCost ?? _totalSubconCost,
  totalSparepartAmount: totalSparepartAmount ?? _totalSparepartAmount,
  totalAmount: totalAmount ?? _totalAmount,
);
  num? get spkId => _spkId;
  String? get spkNumber => _spkNumber;
  String? get serviceType => _serviceType;
  num? get km => _km;
  String? get problemDetail => _problemDetail;
  String? get location => _location;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  String? get status => _status;
  dynamic get driverImage => _driverImage;
  dynamic get image1 => _image1;
  dynamic get image2 => _image2;
  dynamic get image3 => _image3;
  num? get vehicleId => _vehicleId;
  String? get policeNumber => _policeNumber;
  num? get driverId => _driverId;
  String? get driverName => _driverName;
  num? get totalAdditionalCost => _totalAdditionalCost;
  num? get totalSubconCost => _totalSubconCost;
  num? get totalSparepartAmount => _totalSparepartAmount;
  num? get totalAmount => _totalAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['spk_id'] = _spkId;
    map['spk_number'] = _spkNumber;
    map['service_type'] = _serviceType;
    map['km'] = _km;
    map['problem_detail'] = _problemDetail;
    map['location'] = _location;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['status'] = _status;
    map['driver_image'] = _driverImage;
    map['image1'] = _image1;
    map['image2'] = _image2;
    map['image3'] = _image3;
    map['vehicle_id'] = _vehicleId;
    map['police_number'] = _policeNumber;
    map['driver_id'] = _driverId;
    map['driver_name'] = _driverName;
    map['total_additional_cost'] = _totalAdditionalCost;
    map['total_subcon_cost'] = _totalSubconCost;
    map['total_sparepart_amount'] = _totalSparepartAmount;
    map['total_amount'] = _totalAmount;
    return map;
  }

}