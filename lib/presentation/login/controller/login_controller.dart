import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/app_config/app_config.dart';
import 'package:food_calorie_recognition/core/constatns/app_utils.dart';
import 'package:food_calorie_recognition/repository/api/login/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/view/home_page.dart';

class LoginController extends ChangeNotifier{
  late SharedPreferences sharedPreferences;
  void onLogin(BuildContext context,String uname,String password){
    var data={
      "username":uname,
      "password":password
    };
    LoginService.postLogin(data).then((recData){
      log("sdfdsd$recData");
      if (recData["status"]==1) {
        var data=recData["data"];
        var message=recData["message"];
        AppUtils.oneTimeSnackBar(message,
        txtColor: Colors.green, context: context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        storeData(data);
        storeUserToken(data["token"]);

      } else {
        var message=recData["message"];
        AppUtils.oneTimeSnackBar(message,
          txtColor: Colors.red, context: context);
      }
    });
  }
  storeUserToken(resData) async{
    log("storeUserToken");
    sharedPreferences=await SharedPreferences.getInstance();
    String dataUser= json.encode(resData);
    sharedPreferences.setString(AppConfig.token, dataUser);
  }
  storeData(data) async{
    sharedPreferences=await SharedPreferences.getInstance();
    String storeData=json.encode(data);
    sharedPreferences.setString(AppConfig.loginData,storeData);
    sharedPreferences.setBool(AppConfig.status,true);
  }
}