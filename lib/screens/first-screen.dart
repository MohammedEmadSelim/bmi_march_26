import 'package:bmi_march_26/components/Components.dart';
import 'package:bmi_march_26/screens/second-screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          height: 675,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentGeometry.topCenter,
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 370,
                  decoration: BoxDecoration(
                    color: Color(0xff7876CD),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 30, top: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 28),
                          child: Text("Know Your Body Better , Get Your BMI Score in Less Than a Minute!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text("It takes just 30 seconds – and your health is worth it!",
                          style: TextStyle(
                            color: Color(0xffF8F9FFE5),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(height: 30,),
                        Button(context: context , page: InfoScreen() , text: 'Get Start'),
                      ],
                    ),
                  ),
                ),
              ),
              Image.asset("assets/first_img.png"),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}