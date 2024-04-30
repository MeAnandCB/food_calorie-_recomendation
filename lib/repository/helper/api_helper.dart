
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:food_calorie_recognition/app_config/app_config.dart';

class ApiHelper{
  static postRegisterData({
    required String endpoint,
    Map<String,String>? header,
    required Map<String,dynamic> body
  })async{
    log("$body");
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try {
      var response=await http.post(url,body: body);
      log("${response.statusCode}");
      if (response.statusCode==200) {
        var decodeData=jsonDecode(response.body);
        var data={
          "status":1,
          "message":"Registration successful",
          "data":decodeData
        };
        return data;
      }else if(response.statusCode==400) {
        var decodeData=jsonDecode(response.body);
        var data={
          "status":0,
          "message":"A user with that username already exists",
          "data":decodeData
        };
        return data;
      }
       else {
        var decodedData=jsonDecode(response.body);
        var data={
          "status":1,
          "message":"failed",
          "data":decodedData
        };
        return data;
      }
    } catch (e) {
      rethrow; 
    }
  }

  static postLoginData({
    required String endpoint,
    Map<String,String>? header,
    required Map<String,dynamic> body
  })async{
    log("$body");
    final url=Uri.parse(AppConfig.baseurl+endpoint);
    log("$url");
    try {
      var response=await http.post(url,body: body);
      log("${response.statusCode}");
      if (response.statusCode==200) {
        var decodeData=jsonDecode(response.body);
        var data={
          "status":1,
          "message":"Login successful",
          "data":decodeData
        };
        return data;
      } else {
        var decodedData=jsonDecode(response.body);
        var data={
          "message":"failed",
          "data":decodedData
        };
        return data;
      }
    } catch (e) {
      rethrow;
    }
  }
}