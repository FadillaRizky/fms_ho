/// data : {"basic_info":{"driver_name":"Fadilla Rizky Gusnadi","ktp_address":"jegoh","birth_place":"jegoh","domicile_address":"jegoh","bod":"2004-04-26","religion":"islam","graduate":"SMK","join_date":"2004-04-26","bank_account_number":null,"bank_account_name":null,"bank_name":null,"photo_image_path":"https://fms-api.ganekodev.com/public/images/driver/documents/1/photo_h1tN.jpg"},"document":{"no_sim":null,"sim_type":null,"sim_expired":null,"no_ktp":null,"no_kk":null,"sim_image_path":null,"ktp_image_path":"public/images/driver/documents/1/ktp_gQcn.jpg","kk_image_path":null}}
/// message : "success get driver detail"
/// status : 200

class GetDetailDriverResponse {
  GetDetailDriverResponse({
      Data? data, 
      String? message, 
      num? status,}){
    _data = data;
    _message = message;
    _status = status;
}

  GetDetailDriverResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _status = json['status'];
  }
  Data? _data;
  String? _message;
  num? _status;
GetDetailDriverResponse copyWith({  Data? data,
  String? message,
  num? status,
}) => GetDetailDriverResponse(  data: data ?? _data,
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

/// basic_info : {"driver_name":"Fadilla Rizky Gusnadi","ktp_address":"jegoh","birth_place":"jegoh","domicile_address":"jegoh","bod":"2004-04-26","religion":"islam","graduate":"SMK","join_date":"2004-04-26","bank_account_number":null,"bank_account_name":null,"bank_name":null,"photo_image_path":"https://fms-api.ganekodev.com/public/images/driver/documents/1/photo_h1tN.jpg"}
/// document : {"no_sim":null,"sim_type":null,"sim_expired":null,"no_ktp":null,"no_kk":null,"sim_image_path":null,"ktp_image_path":"public/images/driver/documents/1/ktp_gQcn.jpg","kk_image_path":null}

class Data {
  Data({
      BasicInfo? basicInfo, 
      Document? document,}){
    _basicInfo = basicInfo;
    _document = document;
}

  Data.fromJson(dynamic json) {
    _basicInfo = json['basic_info'] != null ? BasicInfo.fromJson(json['basic_info']) : null;
    _document = json['document'] != null ? Document.fromJson(json['document']) : null;
  }
  BasicInfo? _basicInfo;
  Document? _document;
Data copyWith({  BasicInfo? basicInfo,
  Document? document,
}) => Data(  basicInfo: basicInfo ?? _basicInfo,
  document: document ?? _document,
);
  BasicInfo? get basicInfo => _basicInfo;
  Document? get document => _document;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_basicInfo != null) {
      map['basic_info'] = _basicInfo?.toJson();
    }
    if (_document != null) {
      map['document'] = _document?.toJson();
    }
    return map;
  }

}

/// no_sim : null
/// sim_type : null
/// sim_expired : null
/// no_ktp : null
/// no_kk : null
/// sim_image_path : null
/// ktp_image_path : "public/images/driver/documents/1/ktp_gQcn.jpg"
/// kk_image_path : null

class Document {
  Document({
      dynamic noSim, 
      dynamic simType, 
      dynamic simExpired, 
      dynamic noKtp, 
      dynamic noKk, 
      dynamic simImagePath, 
      String? ktpImagePath, 
      dynamic kkImagePath,}){
    _noSim = noSim;
    _simType = simType;
    _simExpired = simExpired;
    _noKtp = noKtp;
    _noKk = noKk;
    _simImagePath = simImagePath;
    _ktpImagePath = ktpImagePath;
    _kkImagePath = kkImagePath;
}

  Document.fromJson(dynamic json) {
    _noSim = json['no_sim'];
    _simType = json['sim_type'];
    _simExpired = json['sim_expired'];
    _noKtp = json['no_ktp'];
    _noKk = json['no_kk'];
    _simImagePath = json['sim_image_path'];
    _ktpImagePath = json['ktp_image_path'];
    _kkImagePath = json['kk_image_path'];
  }
  dynamic _noSim;
  dynamic _simType;
  dynamic _simExpired;
  dynamic _noKtp;
  dynamic _noKk;
  dynamic _simImagePath;
  String? _ktpImagePath;
  dynamic _kkImagePath;
Document copyWith({  dynamic noSim,
  dynamic simType,
  dynamic simExpired,
  dynamic noKtp,
  dynamic noKk,
  dynamic simImagePath,
  String? ktpImagePath,
  dynamic kkImagePath,
}) => Document(  noSim: noSim ?? _noSim,
  simType: simType ?? _simType,
  simExpired: simExpired ?? _simExpired,
  noKtp: noKtp ?? _noKtp,
  noKk: noKk ?? _noKk,
  simImagePath: simImagePath ?? _simImagePath,
  ktpImagePath: ktpImagePath ?? _ktpImagePath,
  kkImagePath: kkImagePath ?? _kkImagePath,
);
  dynamic get noSim => _noSim;
  dynamic get simType => _simType;
  dynamic get simExpired => _simExpired;
  dynamic get noKtp => _noKtp;
  dynamic get noKk => _noKk;
  dynamic get simImagePath => _simImagePath;
  String? get ktpImagePath => _ktpImagePath;
  dynamic get kkImagePath => _kkImagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no_sim'] = _noSim;
    map['sim_type'] = _simType;
    map['sim_expired'] = _simExpired;
    map['no_ktp'] = _noKtp;
    map['no_kk'] = _noKk;
    map['sim_image_path'] = _simImagePath;
    map['ktp_image_path'] = _ktpImagePath;
    map['kk_image_path'] = _kkImagePath;
    return map;
  }

}

/// driver_name : "Fadilla Rizky Gusnadi"
/// ktp_address : "jegoh"
/// birth_place : "jegoh"
/// domicile_address : "jegoh"
/// bod : "2004-04-26"
/// religion : "islam"
/// graduate : "SMK"
/// join_date : "2004-04-26"
/// bank_account_number : null
/// bank_account_name : null
/// bank_name : null
/// photo_image_path : "https://fms-api.ganekodev.com/public/images/driver/documents/1/photo_h1tN.jpg"

class BasicInfo {
  BasicInfo({
      String? driverName, 
      String? ktpAddress, 
      String? birthPlace, 
      String? domicileAddress, 
      String? bod, 
      String? religion, 
      String? graduate, 
      String? joinDate, 
      dynamic bankAccountNumber, 
      dynamic bankAccountName, 
      dynamic bankName, 
      String? photoImagePath,}){
    _driverName = driverName;
    _ktpAddress = ktpAddress;
    _birthPlace = birthPlace;
    _domicileAddress = domicileAddress;
    _bod = bod;
    _religion = religion;
    _graduate = graduate;
    _joinDate = joinDate;
    _bankAccountNumber = bankAccountNumber;
    _bankAccountName = bankAccountName;
    _bankName = bankName;
    _photoImagePath = photoImagePath;
}

  BasicInfo.fromJson(dynamic json) {
    _driverName = json['driver_name'];
    _ktpAddress = json['ktp_address'];
    _birthPlace = json['birth_place'];
    _domicileAddress = json['domicile_address'];
    _bod = json['bod'];
    _religion = json['religion'];
    _graduate = json['graduate'];
    _joinDate = json['join_date'];
    _bankAccountNumber = json['bank_account_number'];
    _bankAccountName = json['bank_account_name'];
    _bankName = json['bank_name'];
    _photoImagePath = json['photo_image_path'];
  }
  String? _driverName;
  String? _ktpAddress;
  String? _birthPlace;
  String? _domicileAddress;
  String? _bod;
  String? _religion;
  String? _graduate;
  String? _joinDate;
  dynamic _bankAccountNumber;
  dynamic _bankAccountName;
  dynamic _bankName;
  String? _photoImagePath;
BasicInfo copyWith({  String? driverName,
  String? ktpAddress,
  String? birthPlace,
  String? domicileAddress,
  String? bod,
  String? religion,
  String? graduate,
  String? joinDate,
  dynamic bankAccountNumber,
  dynamic bankAccountName,
  dynamic bankName,
  String? photoImagePath,
}) => BasicInfo(  driverName: driverName ?? _driverName,
  ktpAddress: ktpAddress ?? _ktpAddress,
  birthPlace: birthPlace ?? _birthPlace,
  domicileAddress: domicileAddress ?? _domicileAddress,
  bod: bod ?? _bod,
  religion: religion ?? _religion,
  graduate: graduate ?? _graduate,
  joinDate: joinDate ?? _joinDate,
  bankAccountNumber: bankAccountNumber ?? _bankAccountNumber,
  bankAccountName: bankAccountName ?? _bankAccountName,
  bankName: bankName ?? _bankName,
  photoImagePath: photoImagePath ?? _photoImagePath,
);
  String? get driverName => _driverName;
  String? get ktpAddress => _ktpAddress;
  String? get birthPlace => _birthPlace;
  String? get domicileAddress => _domicileAddress;
  String? get bod => _bod;
  String? get religion => _religion;
  String? get graduate => _graduate;
  String? get joinDate => _joinDate;
  dynamic get bankAccountNumber => _bankAccountNumber;
  dynamic get bankAccountName => _bankAccountName;
  dynamic get bankName => _bankName;
  String? get photoImagePath => _photoImagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['driver_name'] = _driverName;
    map['ktp_address'] = _ktpAddress;
    map['birth_place'] = _birthPlace;
    map['domicile_address'] = _domicileAddress;
    map['bod'] = _bod;
    map['religion'] = _religion;
    map['graduate'] = _graduate;
    map['join_date'] = _joinDate;
    map['bank_account_number'] = _bankAccountNumber;
    map['bank_account_name'] = _bankAccountName;
    map['bank_name'] = _bankName;
    map['photo_image_path'] = _photoImagePath;
    return map;
  }

}