import 'package:bmi_march_26/components/Components.dart';
import 'package:bmi_march_26/models/bmi_model.dart';
import 'package:bmi_march_26/screens/second-screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.bmi,
    required this.name,
    required this.birthdate,
    required this.gender
  });

  final BmiResponse bmi;
  final String name;
  final String birthdate;
  final int gender;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(120, 118, 205, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0 ,horizontal: 12),
                  child: Row(

                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),),
                                Text("A ${DateTime.now().year - int.parse(birthdate.split('/').last)} years old ${gender == 0 ? "male" : "female"}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(bmi.data.bmi.toString() ,
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),),
                                    Text("BMI Calc",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(bmi.data.height ,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),),
                                    Text("Height",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),),
                                  ],
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  width: 2,
                                  color: Colors.white,
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    Text(bmi.data.weight ,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),),
                                    Text("Weight",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("assets/Vector.png"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(1, 80, 46, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(),
                      Text(bmi.data.category,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),),
                      SizedBox(height: 10),
                      Text(bmi.data.bmi < 18.5 ? "Your BMI is less than 18.5" : bmi.data.bmi > 24.9 ? "Your BMI is bigger than 24.9 " : "Your BMI is between 18.5 and 24.9 ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),),
                      SizedBox(height: 10),
                      Text(
                        bmi.data.bmi < 18.5 ? "Your BMI indicates that you are currently underweight. This may suggest that your body is not getting enough nutrients or energy to function optimally. It is important to focus on a balanced diet rich in proteins, healthy fats, and essential vitamins. Consider consulting a healthcare professional or nutritionist to build a sustainable plan that supports healthy weight gain and overall well-being."
                        : bmi.data.bmi <= 24.9 ? "Your BMI falls within the normal range, which indicates a healthy body weight relative to your height. This is generally associated with lower health risks and good overall balance. Maintaining your current lifestyle with proper nutrition, regular physical activity, and adequate rest will help you stay in this range and support long-term health and wellness."
                        : bmi.data.bmi <= 29.9 ? "Your BMI suggests that you are in the overweight range. This may increase the risk of certain health conditions over time if not managed properly. It is recommended to adopt healthier habits such as regular exercise, mindful eating, and reducing excess calorie intake. Small, consistent changes can lead to sustainable improvements in your weight and overall health."
                        : "Your BMI falls within the obese range, which may significantly increase the risk of serious health conditions such as heart disease, diabetes, and hypertension. It is important to take proactive steps toward improving your health through a structured plan that includes balanced nutrition, physical activity, and medical guidance. Seeking professional support can help you achieve safe and effective results.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Button(context: context, page: InfoScreen(), text: "Calculate BMI Again")
          ],
        ),
      ),
    );
  }
}
