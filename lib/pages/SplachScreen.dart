import 'package:bmi/pages/Home_page.dart';
import 'package:bmi/widgets/Buttom_send.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 390,
                height: 376,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xff7876CD)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Column(
                    children: [
                      Text('Know Your Body Better ,\nGet Your BMI Score in Less Than a Minute!',style: TextStyle(
                        fontFamily: 'DM Sans',
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 50,),
                       Text('It takes just 30 seconds \– and your health is worth it!',style: TextStyle(
                        fontFamily: 'DM Sans',
                        color: Colors.white,
                        fontSize: 14,
                      ),),
                      SizedBox(height: 30,),
                      Divider(
                        thickness: 1,
                        endIndent: 12,
                        indent: 12,
                        color: Colors.white,
                      ),
                      SizedBox(height: 20,),
                      Buttom_send(
                        text: 'Get Start',
                        on_pers: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                            return HomePage();
                          }));
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
           Positioned(
            top: 75,
            left: 17,
            child: Center(child: Image.asset(width: 334,height: 329,'assets/images/bmi_nti/Dukan_diet_1_.png'))),
        ],
      ),
    );
  }
}

