import 'package:flutter/material.dart';

double result_Bmi(double height , double W ){
  double heightM = height / 100; // نحول من سم إلى متر
  double bmi = W / (heightM * heightM);
  
  return double.parse(bmi.toStringAsFixed(1));
}
String getResult(double bmi) {
  if (bmi < 18.5) {
    return "Underweight";
  } else if (bmi < 25) {
    return "Normal Weight";
  } else if (bmi < 30) {
    return "Overweight";
  } else if (bmi < 35) {
    return "Obesity (Class 1)";
  } else if (bmi < 40) {
    return "Obesity (Class 2)";
  } else {
    return "Severe Obesity (Class 3)";
  }
}

String get_dec(String rs) {
  if (rs == "Underweight") {
    return "Your body weight is currently lower than what is considered healthy for your height. This might indicate that you are not consuming enough calories or could be a sign of an underlying health condition. It is important to focus on a nutrient-dense diet that includes healthy fats, proteins, and complex carbohydrates. We highly recommend consulting with a healthcare provider or a professional nutritionist to create a personalized meal plan. Increasing your caloric intake gradually while incorporating strength training can help you build healthy muscle mass and improve your overall energy levels.";
  } 
  else if (rs == "Normal Weight") {
    return "Congratulations! Your weight is within the ideal and healthy range for your height, which significantly reduces your risk of developing serious health complications such as heart disease, type 2 diabetes, and high blood pressure. Maintaining this weight requires a consistent balance between a nutritious diet and regular physical activity. Continue to focus on a variety of whole foods, including vegetables, fruits, and lean proteins, to ensure your body gets all the essential vitamins it needs. Staying active and keeping a positive mindset will help you sustain this healthy lifestyle for the long term.";
  } 
  else if (rs == "Overweight") {
    return "Your BMI indicates that you are slightly above the ideal weight range for your height. While this is not yet obesity, it is a critical warning sign that you should start making small, sustainable changes to your daily habits. Carrying extra weight can put additional strain on your joints and cardiovascular system over time. We recommend increasing your daily physical activity, such as walking or swimming, and being more mindful of portion sizes during meals. Reducing the intake of processed sugars and high-calorie snacks can make a significant difference. Taking action now will prevent moving into the obesity category in the future.";
  } 
  else if (rs == "Obesity (Class 1)") {
    return "Being in Obesity Class 1 means your body mass is high enough to increase the risk of several chronic health conditions. At this stage, you may start to feel more fatigue or experience shortness of breath during physical exertion. It is essential to take a proactive approach to your health by consulting with a doctor to check your cholesterol and blood sugar levels. A combination of a structured calorie-controlled diet and at least 150 minutes of moderate exercise per week is highly recommended. Small steps, like replacing sugary drinks with water and eating more fiber-rich foods, can lead to significant improvements in your BMI and overall well-being.";
  } 
  else if (rs == "Obesity (Class 2)") {
    return "Your current BMI falls into the category of Class 2 Obesity, which is associated with a much higher risk of serious health issues, including sleep apnea, heart disease, and severe joint pain. At this level, lifestyle changes are no longer just an option but a necessity for your long-term health. It is strongly advised to seek professional medical guidance to develop a safe and effective weight loss strategy. This may include a supervised exercise program and a specific medical diet. Reducing your weight even by a small percentage can drastically improve your blood pressure and heart health. Remember, consistency is more important than speed on this journey.";
  } 
  else if (rs == "Severe Obesity (Class 3)") {
    return "This category, also known as morbid obesity, indicates a very high risk of life-threatening health complications and requires immediate medical attention. Carrying this amount of excess weight puts extreme pressure on every organ in your body, especially your heart and lungs. It is vital to work closely with a team of healthcare professionals, including doctors and dietitians, to manage your condition safely. You may need a specialized medical intervention or a comprehensive weight management program to protect your life. Do not feel discouraged; with the right professional support and a dedicated commitment to change, it is possible to improve your health and quality of life significantly.";
  } 
  else {
    return "No data available. Please ensure that you have entered all your measurements correctly to get an accurate analysis of your Body Mass Index (BMI).";
  }
}
Color get_color(double bmi) {
  if (bmi < 18.5) {
    return Colors.orangeAccent; // Underweight - برتقالي فاتح
  } else if (bmi < 25) {
    return const Color.fromARGB(255, 9, 107, 13); // Normal - أخضر
  } else if (bmi < 30) {
    return Colors.orange; // Overweight - برتقالي
  } else if (bmi < 35) {
    return Colors.redAccent; // Obesity Class 1 - أحمر فاتح
  } else if (bmi < 40) {
    return Colors.red; // Obesity Class 2 - أحمر
  } else {
    return Colors.brown; // Severe Obesity - بني أو أحمر داكن جداً
  }
}