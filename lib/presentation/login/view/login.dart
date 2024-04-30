import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/presentation/login/controller/login_controller.dart';
import 'package:provider/provider.dart';
import '../../register/view/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final unameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 60),
              Text("Login",style: TextStyle(
                fontSize: 40,fontWeight: FontWeight.bold
              ),),
              Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration:
                    InputDecoration(border: OutlineInputBorder(), hintText: "Username"),
                controller: unameController,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
                controller: passwordController,
                obscureText: _obscureText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<LoginController>(context,listen: false).onLogin(
                    context,
                    unameController.text.trim(),
                    passwordController.text.trim());
                },
                child: const Text('Login',style: TextStyle(color: Colors.black),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text("Not a user? Register here!!",
                style: TextStyle(color: Colors.black),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
