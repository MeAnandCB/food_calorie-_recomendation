import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodResponse {
  final String image;
  final String predictedFood;
  final CaloriesData caloriesData;
  final String predictedVolume;

  FoodResponse({
    required this.image,
    required this.predictedFood,
    required this.caloriesData,
    required this.predictedVolume,
  });

  factory FoodResponse.fromJson(Map<String, dynamic> json) {
    return FoodResponse(
      image: json['image'],
      predictedFood: json['predicted_food'],
      caloriesData: CaloriesData.fromJson(json['calories_data']),
      predictedVolume: json['predicted_volume'],
    );
  }
}

class CaloriesData {
  final int carbohydrate;
  final int fat;
  final int calories;
  final double protein;
  final String ingredients;
  final String healthyOrUnhealthy;

  CaloriesData({
    required this.carbohydrate,
    required this.fat,
    required this.calories,
    required this.protein,
    required this.ingredients,
    required this.healthyOrUnhealthy,
  });

  factory CaloriesData.fromJson(Map<String, dynamic> json) {
    return CaloriesData(
      carbohydrate: json['Carbohydrate'],
      fat: json['fat'],
      calories: json['calories'],
      protein: json['protein'],
      ingredients: json['Ingredients'],
      healthyOrUnhealthy: json['Healthy or Unhealthy'],
    );
  }
}
