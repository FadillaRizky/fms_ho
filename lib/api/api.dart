import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fms_ho/api/GetAllSpkListResponse.dart';

import '../utils/shared_pref.dart';
import 'GetDetailDriverResponse.dart';
import 'GetDetailSpkResponse.dart';
import 'GetListBankResponse.dart';
import 'GetServiceTypeResponse.dart';
import 'GetSpklistResponse.dart';
import 'LoginResponse.dart';
import 'package:http/http.dart' as http;

import 'SubmitCancelSpkResponse.dart';
import 'SubmitCreateSpkResponse.dart';
import 'SubmitEditProfileResponse.dart';
import 'SubmitEditSpkResponse.dart';
import 'SubmitProfileImage.dart';
import 'SubmitUpdateDriverVehicle.dart';

const BASE_URL = "http://fms-api.ganekodev.com/api";

class Api {

  static Future submitLogin(Map<String, String> dataUser) async {
   try{
     var url = "$BASE_URL/driver/login";
     var response = await http.post(Uri.parse(url), body: dataUser).timeout(Duration(seconds: 1));
     var result = LoginResponse.fromJson(jsonDecode(response.body));

     if (response.statusCode == 200) {
       return result;
     } else if (response.statusCode == 400) {
       return result;
     } else {
       throw "Unable to submit Login";
     }
   }on TimeoutException catch(_){
     return false;
   }catch(e){
     print(e);
   }
  }
  static Future<GetAllSpkListResponse> getAllSpkList(int currentPage,spkNumber,nopol,status,String start,end) async {
    var datatoken = await LoginPref.getPref();
    var token = datatoken.token!;

    var url =
        "$BASE_URL/maintenance/spks/all?page=$currentPage&spk_number=$spkNumber&nopol=$nopol&status=$status&start=$start&end=$end";
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      // currentPage++;
      return GetAllSpkListResponse.fromJson(jsonDecode(response.body));
    }
    if (response.statusCode == 401) {
      return GetAllSpkListResponse.fromJson(jsonDecode(response.body));
    }
    //jika tidak,muncul pesan error
    throw "Gagal request order:\n${response.body}";
  }

  static Future<GetDetailSpkResponse> getDetailSpk(num spkId) async {
    var url = "http://fms-api.ganekodev.com/api/maintenance/spks/all/detail/$spkId";
    var datatoken = await LoginPref.getPref();
    var token = datatoken.token!;
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return GetDetailSpkResponse.fromJson(jsonDecode(response.body));
    }
    //jika tidak,muncul pesan error
    throw "Gagal request detail spk:\n${response.body}";

  }



}