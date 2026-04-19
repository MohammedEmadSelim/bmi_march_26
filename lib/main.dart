import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset('assets/first_img.png'),
            Container(
                
              decoration: const BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(17)),
                color: Color(0xff7876CD),
              ),
              
              child: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: Column(
                
                  children: [
                    const Text(
                      '''Know Your Body Better,
Get Your BMI Score in Less Than a Minute!''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      '''Know Your Body Better,
Get Your BMI Score in Less Than a Minute!''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffF8F9FFE5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 400,
                      child: ElevatedButton(

                        style: ButtonStyle(

                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xff484783),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Get Start",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}