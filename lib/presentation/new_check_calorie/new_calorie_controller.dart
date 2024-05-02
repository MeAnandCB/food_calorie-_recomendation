import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../app_config/app_config.dart';
import '../../core/constatns/app_utils.dart';

class NewCalorieController extends ChangeNotifier {
  Future<void> calCheck(
    BuildContext context,
    File? image,
  ) async {
    try {
      var url = "${AppConfig.baseurl}checkcalorie/";
      onUploadImage(url, image).then((value) {
        log(">>>>>>>>>>>>> ${value.statusCode}");
        if (value.statusCode == 200) {
          // Navigator.pop(context);
          // var message = jsonDecode(value.body)["response"];
          AppUtils.oneTimeSnackBar("done",
              context: context, bgColor: Colors.green, time: 3);
        } else {
          // var message = jsonDecode(value.body)["error"];
          AppUtils.oneTimeSnackBar("not done", context: context,bgColor: Colors.red);
        }
      });
    } catch (e) {
      AppUtils.oneTimeSnackBar("Catch error", context: context,bgColor: Colors.red);
    }
  }
  // Future<void> _uploadImage() async {
  //   if (_image == null) {
  //     // Show an error message or handle the case where no image is selected
  //     log("pic not selected");
  //     return;
  //   }
  //
  //   final url = Uri.parse('http://10.11.0.237:8000/accounts/checkcalorie/');
  //   final request = http.MultipartRequest('POST', url);
  //   request.files.add(await http.MultipartFile.fromPath('image', _image.... ));
  //
  //   final response = await http.Response.fromStream(await request.send());
  //   log(response.statusCode.toString());
  //   if (response.statusCode == 200) {
  //     // Handle success, maybe show a success message
  //     log("success");
  //   } else {
  //     // Handle error, maybe show an error message
  //     log("failed");
  //   }
  // }
  Future<http.Response> onUploadImage(String url, File? selectedImage) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    if (selectedImage != null) {
      log("image size -> ${selectedImage.lengthSync()} bytes <<<<<<<<<<Size in bytes>>>>>>>>>>");
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          selectedImage.path,
        ),
      );
    }
    // request.fields['image'] = selectedImage!.path;
    request.headers.addAll(headers);
    log("request:----->> $request");
    var res = await request.send();
    log("Request URL>>>>>: $url");
    // print("Request Headers>>>>>>>: $headers");
    log("Request Body: ${request.fields},Files>>>> ${request.files}");
    log("reason>>>>${res.reasonPhrase.toString()}");
    return await http.Response.fromStream(res);
  }
}
