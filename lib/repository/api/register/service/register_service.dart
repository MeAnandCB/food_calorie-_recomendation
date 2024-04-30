import 'package:food_calorie_recognition/repository/helper/api_helper.dart';

class RegisterService {
  static Future<dynamic>postRegistration(Map<String,String>data) async{
    try {
      var encodedData= 
      await ApiHelper.postRegisterData(
        endpoint: "signup/", body: data);
        var message=encodedData["message"];
        if (encodedData["message"]==1) {
          return encodedData;
        } else {
          return encodedData;
        }
    } catch (e) {
      print(e); 
    }
  }
}