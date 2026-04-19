import 'package:bmi_march_26/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class InfScreen extends StatelessWidget {
  InfScreen({super.key});
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Text(
                    'B M I',
                    style: TextStyle(
                      fontWeight: FontWeight(900),
                      fontSize: 40,
                      color: Color(0xff1A6143),
                    ),
                  ),
                  CustomTextForm(label: 'Name',),
                  CustomTextForm(label: 'Date',),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Text('Choose Gender',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Color(0xffEBEDFC),
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Image.asset('assets/images/male.png'),
                          ),
                          Text('male')
                        ],
                      ),
                      SizedBox(width: 60,),
                      Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Color(0xffEBEDFC),
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Image.asset('assets/images/female.png'),
                          ),
                          Text('female'),
                        ],
                      ),
                    ],),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Text('   Your Height(cm)'),
                    ],
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: heightController,
                    decoration: InputDecoration(
                      prefixIcon: GestureDetector(child: Icon(Icons.remove)),
                      suffixIcon: GestureDetector(child: Icon(Icons.add)),
                      hintText: 'your height',
                      filled: true,
                      fillColor: const Color(0xffE9E7EA),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Text('   Your weight(cm)'),
                    ],
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: weightController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.remove),
                      suffixIcon: Icon(Icons.add),
                      hintText: 'your weight',
                      filled: true,
                      fillColor: const Color(0xffE9E7EA),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InfScreen(),));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Calculate BMI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
            
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
