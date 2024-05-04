import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/presentation/home/view/home_page.dart';
import 'package:food_calorie_recognition/presentation/new_check_calorie/calorie_finding.dart';
import 'package:food_calorie_recognition/res_model/res_model.dart';

class ResponsePage extends StatelessWidget {
  final FoodResponse responseBody;

  const ResponsePage({Key? key, required this.responseBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   // Parse the JSON string
    //  final Map<String, dynamic> jsonResponse = json.decode(responseBody ?? "");
    //   // Extract the value associated with the "response" key
    //   final String responseText = jsonResponse['response'];
    // final foodResponse = FoodResponse.fromJson(jsonResponse);

    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              padding: EdgeInsets.all(10),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: Colors.black)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "PREDICTED FOOD",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    responseBody.predictedFood,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                        fontSize: 25),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "CALORIES DATA",
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Healthy or Unhealthy",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    responseBody.caloriesData.healthyOrUnhealthy,
                    style: TextStyle(fontWeight: FontWeight.w400, height: 1.5),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    responseBody.caloriesData.ingredients,
                    style: TextStyle(fontWeight: FontWeight.w400, height: 1.5),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  "Calories",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  responseBody.caloriesData.calories.toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  'Fat',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  responseBody.caloriesData.fat.toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  'Carbohydrate',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  responseBody.caloriesData.carbohydrate
                                      .toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  'Protein',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TableCell(
                              child: Center(
                                child: Text(
                                  responseBody.caloriesData.protein.toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Predicted Volume",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 174, 174, 0))),
                    child: Text(
                      responseBody.predictedVolume,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewCalorieCheck(),
                  ),
                  (route) => false);
            },
            child: Container(
              height: 50,
              color: Colors.purple,
              child: Center(
                child: Text(
                  "Re submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )));
  }
}
