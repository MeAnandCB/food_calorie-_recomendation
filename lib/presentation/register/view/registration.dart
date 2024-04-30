import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/presentation/register/controller/register_controller.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegistrationFireState();
}

class _RegistrationFireState extends State<RegisterPage> {
  final firstnameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Text("Sign-Up",style: TextStyle(
              fontSize: 40,fontWeight: FontWeight.bold
            ),),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "First name",
                    labelText: "First name"),
                controller: firstnameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Email",
                    labelText: "Email"),
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Username",
                    labelText: "Username"),
                controller: usernameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Password must be 6 characters",
                  labelText: 'Password',
                  suffixIcon: _obscureText == false
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = true;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            size: 20,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = false;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_off,
                            size: 20,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  ElevatedButton(onPressed: () {
                    Provider.of<RegisterController>(context,listen: false).onRegistration(
                      context,
                      firstnameController.text.trim(),
                      emailController.text.trim(),
                      usernameController.text.trim(),
                      passwordController.text.trim());
                  },
                   child: Text('Register',style: TextStyle(color: Colors.black))),
            )
          ],
        ),
      ),
    );
  }
}
