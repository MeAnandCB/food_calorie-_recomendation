import 'package:flutter/material.dart';
import 'package:food_calorie_recognition/presentation/check_calorie/view/check_calorie_view.dart';
import 'package:food_calorie_recognition/presentation/new_check_calorie/new_check_calorie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("calorie recognition",style: TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage('assets/image/cfood.jpg'))
              ),
                ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                """Caloric foods are rich in carbohydrates, fats, and proteins, providing energy for the body. Carbs and proteins offer 4 calories per gram, while fats provide 9. Examples include grains, fruits, nuts, and meats. Balancing these foods supports a healthy diet and weight management.
                Caloric foods can range from nutrient-dense options like fruits, vegetables, lean proteins, and whole grains to less nutritious choices such as sugary snacks, fried foods, and processed foods high in unhealthy fats and added sugars. While these high-calorie options can provide quick energy, they may lack essential nutrients and contribute to weight gain if consumed excessively without balance and moderation.""",
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewCalorieCheck()));
            }, child: Text("check calories"))
          ],
        ),
      ),
    );
  }
}
