import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/presentation/home/view/home_page.dart';
import 'package:food_calorie_recognition/presentation/login/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app_config/app_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;
  late bool checkLogged;

  Future<void> checkLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    checkLogged = sharedPreferences.getBool(AppConfig.status) ?? false;
  }

  @override
  void initState() {
    checkLogin().then((Value) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/image/calorie.webp"),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
