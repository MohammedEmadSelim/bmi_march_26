

import 'package:bmi_march_26/screens/info_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key,});



  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset('assets/first_img.png'),
          Container(
            width: 450,
            height: 470,
            decoration: BoxDecoration(
              color: Color(0xff7876CD),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Know Your Body Better ,Get Your BMI Score in Less Than a Minute!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'It takes just 30 seconds – and your health is worth it!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffF8F9FFE5),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        // navigation to info screen
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(),));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xff484783),
                      ),

                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
