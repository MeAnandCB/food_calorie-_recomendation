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
  final double carbohydrate;
  final double fat;
  final double calories;
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
      carbohydrate: json['Carbohydrate'].toDouble(),
      fat: json['fat'].toDouble(),
      calories: json['calories'].toDouble(),
      protein: json['protein'].toDouble(),
      ingredients: json['Ingredients'],
      healthyOrUnhealthy: json['Healthy or Unhealthy'],
    );
  }
}
