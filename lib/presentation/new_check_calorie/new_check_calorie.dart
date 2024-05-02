import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/presentation/new_check_calorie/new_calorie_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../global_widget/image_icon_button.dart';

class NewCalorieCheck extends StatefulWidget {
  const NewCalorieCheck({Key? key}) : super(key: key);

  @override
  _NewCalorieCheckState createState() => _NewCalorieCheckState();
}

class _NewCalorieCheckState extends State<NewCalorieCheck> {

  File? image;


  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Check calories"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Select image",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageIconButton(
                width: width * .35,
                height: size.height * .06,
                onPressed: () => _getImage(ImageSource.camera),
                icon: Icons.camera_alt_outlined,
                label: 'Camera',
              ),
              ImageIconButton(
                width: width * .35,
                height: size.height * .06,
                onPressed: () => _getImage(ImageSource.gallery),
                icon: Icons.photo,
                label: 'Gallery',
              ),
            ],
          ),
          image != null
              ?
              // if (image != null)
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 200,
                  width: 200,
                  child: Image.file(
                    image!,
                    fit: BoxFit.cover,
                  ),
                )
              : SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Provider.of<NewCalorieController>(context, listen: false)
                      .calCheck(context, image);
                  setState(() {
                    image = null;
                  });
                },
                child: Text("Check")),
          )
        ],
      ),
    );
  }
}
