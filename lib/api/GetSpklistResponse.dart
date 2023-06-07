/// data : [{"spk_id":19,"spk_number":"SPK/2023/01/05/001","vehicle_id":1,"police_number":"B 7777 CIA","driver_name":"Fadilla Rizky","service_type":"LUBURICATING SYSTEM","problem_detail":"iiii","location":"wonogiri","driver_image":"https://fms-api.ganekodev.com/public/spk/jpp/B7777CIA_wnWE.jpg","image1":"https://fms-api.ganekodev.com/public/spk/jpp/_86yy.jpg","image2":"https://fms-api.ganekodev.com/public/spk/jpp/_r86B.jpg","image3":"https://fms-api.ganekodev.com/public/spk/jpp/B7777CIA_xBQ7.jpg","video":"https://fms-api.ganekodev.com/public/spk/jpp/_PFth.mp4","repair_pic":null,"status":"OPEN","created_at":"2023-01-05T15:32:27.000000Z","updated_at":"2023-01-09T10:13:40.000000Z","created_by":"Master","updated_by":null},{"spk_id":20,"spk_number":"SPK/2023/01/06/001","vehicle_id":1,"police_number":"B 7777 CIA","driver_name":"Fadilla Rizky","service_type":"OTHER","problem_detail":"ddd","location":"Jawa timur","driver_image":"https://fms-api.ganekodev.com/public/spk/jpp/B7777CIA_VzNu.jpg","image1":"https://fms-api.ganekodev.com/public/spk/jpp/B7777CIA_uiex.jpg","image2":"https://fms-api.ganekodev.com/public/spk/jpp/B7777CIA_de0L.jpg","image3":"https://fms-api.ganekodev.com/public/spk/jpp/_eC3M.jpg","video":"https://fms-api.ganekodev.com/public/spk/jpp/_N7Nu.mp4","repair_pic":null,"status":"OPEN","created_at":"2023-01-06T08:38:44.000000Z","updated_at":"2023-01-08T16:51:57.000000Z","created_by":"Master","updated_by":null},{"spk_id":21,"spk_number":"SPK/2023/01/08/001","vehicle_id":1,"police_number":"B 7777 CIA","driver_name":"Fadilla Rizky","service_type":"FUEL SYSTEM","problem_detail":"rusak","location":"Jawa barat","driver_image":"https://fms-api.ganekodev.com/public/spk/jpp/B7777CIA_82cV.jpg","image1":"https://fms-api.ganekodev.com/public/spk/jpp/_wEhT.jpg","image2":"https://fms-api.ganekodev.com/public/spk/jpp/_QwLf.jpg","image3":"https://fms-api.ganekodev.com/public/spk/jpp/_cjhn.jpg","video":"https://fms-api.ganekodev.com/public/spk/jpp/_d2fX.mp4","repair_pic":null,"status":"OPEN","created_at":"2023-01-08T23:36:25.000000Z","updated_at":"2023-01-09T16:00:45.000000Z","created_by":"Master","updated_by":null},{"spk_id":22,"spk_number":"SPK/2023/01/10/001","vehicle_id":1,"police_number":"B 7777 CIA","driver_name":"Fadilla Rizky","service_type":"AXLE AND SUSPENSION","problem_detail":"rusak","location":"jatisrono","driver_image":"https://fms-api.ganekodev.com/public/spk/jpp/_xYHf.jpg","image1":"https://fms-api.ganekodev.com/public/spk/jpp/_khX7.jpg","image2":"https://fms-api.ganekodev.com/public/spk/jpp/_nsyn.jpg","image3":"https://fms-api.ganekodev.com/public/spk/jpp/_y7Ra.jpg","video":"https://fms-api.ganekodev.com/public/spk/jpp/_SmOE.mp4","repair_pic":null,"status":"OPEN","created_at":"2023-01-10T11:48:00.000000Z","updated_at":"2023-01-10T11:48:00.000000Z","created_by":"Master","updated_by":null},{"spk_id":23,"spk_number":"SPK/2023/01/11/001","vehicle_id":1,"police_number":"B 7777 CIA","driver_name":"Fadilla Rizky","service_type":"FUEL SYSTEM","problem_detail":"rusak","location":"ggggg","driver_image":"https://fms-api.ganekodev.com/public/spk/jpp/_RuUR.jpg","image1":"https://fms-api.ganekodev.com/public/spk/jpp/_nfyG.jpg","image2":"https://fms-api.ganekodev.com/public/spk/jpp/_lInN.jpg","image3":"https://fms-api.ganekodev.com/public/spk/jpp/_C9s1.jpg","video":"https://fms-api.ganekodev.com/public/spk/jpp/_cK5c.mp4","repair_pic":null,"status":"OPEN","created_at":"2023-01-11T09:26:14.000000Z","updated_at":"2023-01-11T09:26:14.000000Z","created_by":"Master","updated_by":null}]
/// total_spk : 5
/// message : "success get list data spk"

class GetSpklistResponse {
  GetSpklistResponse({
      List<Data>? data, 
      num? totalSpk, 
      String? message,}){
    _data = data;
    _totalSpk = totalSpk;
    _message = message;
}

  GetSpklistResponse.fromJson(dynamic json) {
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
GetSpklistResponse copyWith({  List<Data>? data,
  num? totalSpk,
  String? message,
}) => GetSpklistResponse(  data: data ?? _data,
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

/// spk_id : 19
/// spk_number : "SPK/2023/01/05/001"
/// vehicle_id : 1
/// police_number : "B 7777 CIA"
/// driver_name : "Fadilla Rizky"
/// service_type : "LUBURICATING SYSTEM"
/// problem_detail : "iiii"
/// location : "wonogiri"
/// driver_image : "https://fms-api.ganekodev.com/public/spk/jpp/B7777CIA_wnWE.jpg"
/// image1 : "https://fms-api.ganekodev.com/public/spk/jpp/_86yy.jpg"
/// image2 : "https://fms-api.ganekodev.com/public/spk/jpp/_r86B.jpg"
/// image3 : "https://fms-api.ganekodev.com/public/spk/jpp/B7777CIA_xBQ7.jpg"
/// video : "https://fms-api.ganekodev.com/public/spk/jpp/_PFth.mp4"
/// repair_pic : null
/// status : "OPEN"
/// created_at : "2023-01-05T15:32:27.000000Z"
/// updated_at : "2023-01-09T10:13:40.000000Z"
/// created_by : "Master"
/// updated_by : null

class Data {
  Data({
      num? spkId, 
      String? spkNumber, 
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
      String? video, 
      dynamic repairPic, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      String? createdBy, 
      dynamic updatedBy,}){
    _spkId = spkId;
    _spkNumber = spkNumber;
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
    _repairPic = repairPic;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _spkId = json['spk_id'];
    _spkNumber = json['spk_number'];
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
    _repairPic = json['repair_pic'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
  }
  num? _spkId;
  String? _spkNumber;
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
  String? _video;
  dynamic _repairPic;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _createdBy;
  dynamic _updatedBy;
Data copyWith({  num? spkId,
  String? spkNumber,
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
  String? video,
  dynamic repairPic,
  String? status,
  String? createdAt,
  String? updatedAt,
  String? createdBy,
  dynamic updatedBy,
}) => Data(  spkId: spkId ?? _spkId,
  spkNumber: spkNumber ?? _spkNumber,
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
  repairPic: repairPic ?? _repairPic,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  createdBy: createdBy ?? _createdBy,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get spkId => _spkId;
  String? get spkNumber => _spkNumber;
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
  String? get video => _video;
  dynamic get repairPic => _repairPic;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['spk_id'] = _spkId;
    map['spk_number'] = _spkNumber;
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
    map['repair_pic'] = _repairPic;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['created_by'] = _createdBy;
    map['updated_by'] = _updatedBy;
    return map;
  }

}