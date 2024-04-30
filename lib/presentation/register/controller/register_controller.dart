import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/core/constatns/app_utils.dart';
import 'package:food_calorie_recognition/presentation/login/view/login.dart';
import 'package:food_calorie_recognition/repository/api/register/service/register_service.dart';

class RegisterController extends ChangeNotifier {
  void onRegistration(BuildContext context,String fname,String email,String uname,String password){
    var data={
      "first_name":fname,
      "email":email,
      "username":uname,
      "password":password
    };
    RegisterService.postRegistration(data).then((recData){
      log("$recData");
      if (recData["status"]==1) {
        var message=recData["message"];
        AppUtils.oneTimeSnackBar(message,
        txtColor: Colors.green, context: context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      } else {
        if (recData["message"] !="failed") {
          log("message");
          var message=recData["message"];
          AppUtils.oneTimeSnackBar(message,
          txtColor: Colors.red, context: context);
        } else {
          log("message1");
          var message=recData["message"];
          AppUtils.oneTimeSnackBar(message,
          txtColor: Colors.red, context: context);
        }
      }
    });
  }
}