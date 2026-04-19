import 'package:bmi_march_26/screens/inf_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/images/first_img.png'),
          Container(
              width: 395,
              height: 376,
              decoration: BoxDecoration(
                color: Color(0xff7876CD),
                borderRadius: BorderRadius.circular(25),
              ),
              child:Padding(padding: EdgeInsetsGeometry.all(20),
                child:  Column(
                  children: [
                    Text(
                      'Know Your Body Better ,Get Your BMI Score in Less Than a Minute!',
                      style: TextStyle(fontWeight: FontWeight(700), fontSize: 24,color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'It takes just 30 seconds – and your health is worth it!',
                      style: TextStyle(
                        fontWeight: FontWeight(400),
                        fontSize: 16,
                        color: Color(0xff1A6143),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
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
                          'Get Started',
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
              )
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
