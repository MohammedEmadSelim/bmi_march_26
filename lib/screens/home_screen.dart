import 'package:bmi_march_26/screens/inf_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 395,
              height: 376,
              decoration: BoxDecoration(
                color: Color(0xff7876CD),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 40,horizontal: 25),
                child: Column(
                  children: [
                    Text(
                      'Know Your Body Better ,Get Your BMI Score in Less Than a Minute!',
                      style: TextStyle(
                        fontWeight: FontWeight(700),
                        fontSize: 24,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'It takes just 30 seconds – and your health is worth it!',
                      style: TextStyle(
                        fontWeight: FontWeight(400),
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfScreen()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        width: 350,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xff484783),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Get Started',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
          Positioned(
              bottom: 350,
              left: 30,
              child: Image.asset('assets/images/first_img.png')),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
