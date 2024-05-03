import 'dart:convert';
import 'package:flutter/material.dart';

class ResponsePage extends StatelessWidget {
  final String responseBody;

  const ResponsePage({Key? key, required this.responseBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parse the JSON string
    final Map<String, dynamic> jsonResponse = json.decode(responseBody);
    // Extract the value associated with the "response" key
    final String responseText = jsonResponse['response'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Response'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black)),
              child: Text(
                responseText,style:
                TextStyle(fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
