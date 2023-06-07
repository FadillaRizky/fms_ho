/// data : [{"spk_id":545,"spk_number":"SPK/2023/05/22/019","km":555369,"vehicle_id":494,"police_number":"B 9007 BYV","driver_name":"AGUS","service_type":"REPAIR","problem_detail":"service","location":"Rejosari, Kabupaten Wonogiri","driver_image":"https://fms-api.ganekodev.com/public/spk/jpp/_GBTb.jpg","image1":"https://fms-api.ganekodev.com/public/spk/jpp/_cym3.jpg","image2":"https://fms-api.ganekodev.com/public/spk/jpp/_qQcy.jpg","image3":"https://fms-api.ganekodev.com/public/spk/jpp/_0V2W.jpg","video":null,"status":"OPEN","created_at":"2023-05-22T16:49:02.000000Z","updated_at":"2023-05-22T16:49:02.000000Z","created_by":"Master","updated_by":null},{"spk_id":544,"spk_number":"SPK/2023/05/22/018","km":556396,"vehicle_id":494,"police_number":"B 9007 BYV","driver_name":"AGUS","service_type":"TIRE (BAN)","problem_detail":"ban meledak","location":"Rejosari, Kabupaten Wonogiri","driver_image":"https://fms-api.ganekodev.com/public/spk/jpp/_Pte9.jpg","image1":"https://fms-api.ganekodev.com/public/spk/jpp/_hBLy.jpg","image2":"https://fms-api.ganekodev.com/public/spk/jpp/_7gjv.jpg","image3":"https://fms-api.ganekodev.com/public/spk/jpp/_OsVP.jpg","video":null,"status":"OPEN","created_at":"2023-05-22T16:47:04.000000Z","updated_at":"2023-05-22T16:47:04.000000Z","created_by":"Master","updated_by":null},{"spk_id":543,"spk_number":"SPK/2023/05/22/017","km":55365,"vehicle_id":494,"police_number":"B 9007 BYV","driver_name":"AGUS","service_type":"SERVICE BERKALA","problem_detail":"rusak parah","location":"Rejosari, Kabupaten Wonogiri","driver_image":"https://fms-api.ganekodev.com/public/spk/jpp/_YhYk.jpg","image1":"https://fms-api.ganekodev.com/public/spk/jpp/_U7ue.jpg","image2":"https://fms-api.ganekodev.com/public/spk/jpp/_czhw.jpg","image3":"https://fms-api.ganekodev.com/public/spk/jpp/_DJxt.jpg","video":null,"status":"OPEN","created_at":"2023-05-22T16:45:17.000000Z","updated_at":"2023-05-22T16:45:17.000000Z","created_by":"Master","updated_by":null},{"spk_id":542,"spk_number":"SPK/2023/05/22/016","km":199024,"vehicle_id":2,"police_number":"BE 9148 CN","driver_name":null,"service_type":null,"problem_detail":"CEK REM,LAS WINGBOX,GANTI BAN DALEM","location":"POOL SETU","driver_image":null,"image1":null,"image2":null,"image3":null,"video":null,"status":"INSPECT","created_at":"2023-05-22T16:01:35.000000Z","updated_at":"2023-05-22T10:01:21.000000Z","created_by":"Sigit Agustian","updated_by":"Sigit Agustian"},{"spk_id":541,"spk_number":"SPK/2023/05/22/015","km":268291,"vehicle_id":458,"police_number":"B 9373 SCD","driver_name":null,"service_type":null,"problem_detail":"GANTI OLI MESIN,OLI GARDAN FILTER OLI FILTER UDARA,GANTI BAN","location":"POOL SETU","driver_image":null,"image1":null,"image2":null,"image3":null,"video":null,"status":"INSPECT","created_at":"2023-05-22T15:31:56.000000Z","updated_at":"2023-05-22T09:11:41.000000Z","created_by":"Sigit Agustian","updated_by":"Sigit Agustian"}]
/// total_spk : 545
/// message : "success get list data spk"

class GetAllSpkListResponse {
  GetAllSpkListResponse({
      List<Data>? data, 
      num? totalSpk, 
      String? message,}){
    _data = data;
    _totalSpk = totalSpk;
    _message = message;
}

  GetAllSpkListResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _totalSpk = json['total_spk'];
    _message = json['message'];
  }
  List<Data>? _data;
  num? _totalSpk;
  String? _message;
GetAllSpkListResponse copyWith({  List<Data>? data,
  num? totalSpk,
  String? message,
}) => GetAllSpkListResponse(  data: data ?? _data,
  totalSpk: totalSpk ?? _totalSpk,
  message: message ?? _message,
);
  List<Data>? get data => _data;
  num? get totalSpk => _totalSpk;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['total_spk'] = _totalSpk;
    map['message'] = _message;
    return map;
  }

}

/// spk_id : 545
/// spk_number : "SPK/2023/05/22/019"
/// km : 555369
/// vehicle_id : 494
/// police_number : "B 9007 BYV"
/// driver_name : "AGUS"
/// service_type : "REPAIR"
/// problem_detail : "service"
/// location : "Rejosari, Kabupaten Wonogiri"
/// driver_image : "https://fms-api.ganekodev.com/public/spk/jpp/_GBTb.jpg"
/// image1 : "https://fms-api.ganekodev.com/public/spk/jpp/_cym3.jpg"
/// image2 : "https://fms-api.ganekodev.com/public/spk/jpp/_qQcy.jpg"
/// image3 : "https://fms-api.ganekodev.com/public/spk/jpp/_0V2W.jpg"
/// video : null
/// status : "OPEN"
/// created_at : "2023-05-22T16:49:02.000000Z"
/// updated_at : "2023-05-22T16:49:02.000000Z"
/// created_by : "Master"
/// updated_by : null

class Data {
  Data({
      num? spkId, 
      String? spkNumber, 
      num? km, 
      num? vehicleId, 
      String? policeNumber, 
      String? driverName, 
      String? serviceType, 
      String? problemDetail, 
      String? location, 
      String? driverImage, 
      String? image1, 
      String? image2, 
      String? image3, 
      dynamic video, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      String? createdBy, 
      dynamic updatedBy,}){
    _spkId = spkId;
    _spkNumber = spkNumber;
    _km = km;
    _vehicleId = vehicleId;
    _policeNumber = policeNumber;
    _driverName = driverName;
    _serviceType = serviceType;
    _problemDetail = problemDetail;
    _location = location;
    _driverImage = driverImage;
    _image1 = image1;
    _image2 = image2;
    _image3 = image3;
    _video = video;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _spkId = json['spk_id'];
    _spkNumber = json['spk_number'];
    _km = json['km'];
    _vehicleId = json['vehicle_id'];
    _policeNumber = json['police_number'];
    _driverName = json['driver_name'];
    _serviceType = json['service_type'];
    _problemDetail = json['problem_detail'];
    _location = json['location'];
    _driverImage = json['driver_image'];
    _image1 = json['image1'];
    _image2 = json['image2'];
    _image3 = json['image3'];
    _video = json['video'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
  }
  num? _spkId;
  String? _spkNumber;
  num? _km;
  num? _vehicleId;
  String? _policeNumber;
  String? _driverName;
  String? _serviceType;
  String? _problemDetail;
  String? _location;
  String? _driverImage;
  String? _image1;
  String? _image2;
  String? _image3;
  dynamic _video;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _createdBy;
  dynamic _updatedBy;
Data copyWith({  num? spkId,
  String? spkNumber,
  num? km,
  num? vehicleId,
  String? policeNumber,
  String? driverName,
  String? serviceType,
  String? problemDetail,
  String? location,
  String? driverImage,
  String? image1,
  String? image2,
  String? image3,
  dynamic video,
  String? status,
  String? createdAt,
  String? updatedAt,
  String? createdBy,
  dynamic updatedBy,
}) => Data(  spkId: spkId ?? _spkId,
  spkNumber: spkNumber ?? _spkNumber,
  km: km ?? _km,
  vehicleId: vehicleId ?? _vehicleId,
  policeNumber: policeNumber ?? _policeNumber,
  driverName: driverName ?? _driverName,
  serviceType: serviceType ?? _serviceType,
  problemDetail: problemDetail ?? _problemDetail,
  location: location ?? _location,
  driverImage: driverImage ?? _driverImage,
  image1: image1 ?? _image1,
  image2: image2 ?? _image2,
  image3: image3 ?? _image3,
  video: video ?? _video,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  createdBy: createdBy ?? _createdBy,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get spkId => _spkId;
  String? get spkNumber => _spkNumber;
  num? get km => _km;
  num? get vehicleId => _vehicleId;
  String? get policeNumber => _policeNumber;
  String? get driverName => _driverName;
  String? get serviceType => _serviceType;
  String? get problemDetail => _problemDetail;
  String? get location => _location;
  String? get driverImage => _driverImage;
  String? get image1 => _image1;
  String? get image2 => _image2;
  String? get image3 => _image3;
  dynamic get video => _video;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['spk_id'] = _spkId;
    map['spk_number'] = _spkNumber;
    map['km'] = _km;
    map['vehicle_id'] = _vehicleId;
    map['police_number'] = _policeNumber;
    map['driver_name'] = _driverName;
    map['service_type'] = _serviceType;
    map['problem_detail'] = _problemDetail;
    map['location'] = _location;
    map['driver_image'] = _driverImage;
    map['image1'] = _image1;
    map['image2'] = _image2;
    map['image3'] = _image3;
    map['video'] = _video;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['created_by'] = _createdBy;
    map['updated_by'] = _updatedBy;
    return map;
  }

}