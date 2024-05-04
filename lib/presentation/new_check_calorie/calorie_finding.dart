import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/app_config/app_config.dart';
import 'package:food_calorie_recognition/res_model/res_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'response_from_api.dart';

class NewCalorieCheck extends StatefulWidget {
  const NewCalorieCheck({Key? key}) : super(key: key);

  @override
  _NewCalorieCheckState createState() => _NewCalorieCheckState();
}

class _NewCalorieCheckState extends State<NewCalorieCheck> {
  File? _image;
  bool isLoading = false; // Track loading state
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadImage(File imageFile) async {
    setState(() {
      isLoading = true; // Set loading state to true when uploading image
    });

    final uri = Uri.parse('http://10.0.2.2:8000/accounts/checkcalorie/');
    final request = http.MultipartRequest('POST', uri);

    request.files.add(await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
      contentType: MediaType('image', 'jpeg'),
    ));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final foodResponse = FoodResponse.fromJson(jsonResponse);

      isLoading = false; // Set loading state to false after receiving response
      print('Image uploaded successfully');
      print('Response:');
      print('Image: ${foodResponse.image}');
      print('Predicted Food: ${foodResponse.predictedFood}');
      print('Carbohydrate: ${foodResponse.caloriesData.carbohydrate}');
      print('Fat: ${foodResponse.caloriesData.fat}');
      print('Calories: ${foodResponse.caloriesData.calories}');
      print('Protein: ${foodResponse.caloriesData.protein}');
      print('Ingredients: ${foodResponse.caloriesData.ingredients}');
      print(
          'Healthy or Unhealthy: ${foodResponse.caloriesData.healthyOrUnhealthy}');
      print('Predicted Volume: ${foodResponse.predictedVolume}');

      if (response.body.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResponsePage(responseBody: foodResponse),
          ),
        );
      } else {
        print("Response body is empty");
      }
    } else {
      isLoading = false; // Set loading state to false if upload fails
      print('Failed to upload image. Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Recognition'),
      ),
      body: Center(
        child: _image == null
            ? Text('Please select an image')
            : Image.file(
                _image!,
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.75,
                fit: BoxFit.contain,
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              getImage(ImageSource.gallery);
            },
            tooltip: 'Pick Image from Gallery',
            child: Icon(Icons.photo_library),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              getImage(ImageSource.camera);
            },
            tooltip: 'Take a Photo',
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_image != null) {
            uploadImage(_image!);
            // setState(() {
            //
            // });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please select image'),
              ),
            );
          }
        },
        child: Container(
          height: 50,
          color: Colors.purple,
          child: Center(
            child: isLoading // Display loading indicator conditionally
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
