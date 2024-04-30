import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/app_config/app_config.dart';
import 'package:http/http.dart' as http;
import '../../../core/constatns/app_utils.dart';

class CheckcalorieController extends ChangeNotifier {
  // Future<void> addImage(
  //   BuildContext context,
  //    File? photo) async {
  //   try {
  //     var imageUrl="${AppConfig.baseurl}checkcalorie/";
  //     onUploadImage(imageUrl, photo).then((
  //       response){
  //         if (response.statusCode==200) {
  //           var message="Image added";
  //           AppUtils.oneTimeSnackBar(message,txtColor: Colors.green, context: context);
  //         } else {
  //           log("${response.statusCode}");
  //           log(">>$imageUrl");
            
  //           // log(response.body.toString());
  //           var message="failed";
  //           AppUtils.oneTimeSnackBar(message,txtColor: Colors.red, context: context);
  //         }
  //       });
  //   } catch (e) {
  //     log("$e");
  //   }
  // }
  Future<void> addImage(
    BuildContext context,
    File? image,
  ) async{
    try{
      var imageUrl="${AppConfig.baseurl}checkcalorie/";
      onUploadImage(imageUrl,image).then((
        response){
          log("${response.statusCode}");
          if(response.statusCode==200) {
            var message="Image added";
            AppUtils.oneTimeSnackBar(message,txtColor: Colors.green, context: context);
          }else{
            log(response.body.toString());
            var message="failed";
            AppUtils.oneTimeSnackBar(message,txtColor: Colors.red, context: context);
          }
        });
    }
    catch(e){
      log("$e");
    }
  }
  //  Future<http.Response> onUploadImage(
  //     String imageUrl,
  //      File? photo)async {
  //       // var token = await AppUtils.getAccessKey();
  //       var request=http.MultipartRequest('POST',Uri.parse(imageUrl));

  //       Map<String,String> headers={
  //         "Content-type": "multipart/form-data",

  //       };
  //       if (photo != null) {
  //     log("Image file size: ${photo.lengthSync()} ");

  //     request.files.add(
  //       await http.MultipartFile.fromPath(
  //         'image',
  //         photo.path,
  //       ),
  //     );
  //   }
  //   var res=await request.send();
  //   return  http.Response.fromStream(res);
  //      }
  Future<http.Response> onUploadImage(
    String url,
    File? selectedImage,
  ) async {

    // var token = await AppUtils.getAccessKey();
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {"Accept":"*/*"};

    if (selectedImage != null) {
      print("Image file size: ${selectedImage.lengthSync()} bytes <<<<<<<<<<<");
      // var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add image file to the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          selectedImage.path,
        ),
      );
    }

    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    return await http.Response.fromStream(res);
  }

}
