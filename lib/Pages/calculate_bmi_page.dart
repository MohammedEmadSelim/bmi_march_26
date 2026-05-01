
import 'package:bmi/Method/caluc_bmi.dart';
import 'package:bmi/Models/bmi_model.dart';
import 'package:bmi/widgets/Buttom_send.dart';
import 'package:flutter/material.dart';

class CalculateBmiPage extends StatelessWidget {

   CalculateBmiPage({super.key, required this.bmi, required this.name, required this.birthDate, required this.gender});
final BmiResponse bmi;
final String name;
final String birthDate;
final String gender;
 
  @override
  Widget build(BuildContext context) {
   final Human? human = bmi.data;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                color:
                    gender.toLowerCase() == 'male'
                        ? Color(0xff7876CD)
                        : gender.toLowerCase() == 'female' ? Color(0xffFF8767) : Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'A ${calculateAge(birthDate)} years old ${gender}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            //fontWeight: FontWeight.w900
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            // result_Bmi(human.height, human.weight).toString(),
                           bmi.data?.bmi.toString() ?? 'N/A'
                            ,style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text(
                            'BMI Result',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'DM Sans',
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    bmi.data!.height!.toString() ,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    'height',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'DM Sans',
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 2,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                              ),
                              Column(
                                children: [
                                  Text(
                                    bmi.data!.weight!.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    'weight',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'DM Sans',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 45),
                    Image.asset(
                      gender.toLowerCase() == 'male'
                          ? 'assets/images/bmi_nti/Vector.png'
                          : gender.toLowerCase() == 'female' ? 'assets/images/bmi_nti/Vector-1.png' : 'assets/images/bmi_nti/Vector-2.png',
                      height: 270,
                      width: 70,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                color: get_color(bmi.data!.bmi!),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getResult(
                        bmi.data!.bmi!,
                      ).toString(),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 0, 0),
                        fontSize: 22,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w900,
                        height: 1
                      ),
                    ),
                    Text(
                      'Your BMI is less than' +
                          ' ' +
                          bmi.data!.bmi!.toString() ?? 'N/A',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontFamily: 'DM Sans',
                      ),
                    ),
                    Text(
                      get_dec(
                        getResult(bmi.data!.bmi!),
                      ).toString(),
                      maxLines: 10, // يوقف النص عند السطر الخامس
                      overflow:
                          TextOverflow
                              .ellipsis, // يضيف الثلاث نقاط (...) في النهاية
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'DM Sans',
                      ),
                    ),
                    // Text(
                    //     get_dec(getResult(result_Bmi(human.height, human.weight))).toString(),
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 11,
                    //       fontFamily: 'DM Sans',
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Buttom_send(
              on_pers: () {
                Navigator.pop(context);
              },
              text: 'Calculate BMI Again',
            ),
          ],
        ),
      ),
    );
  }
}
int calculateAge(String birthDateString) {
  // 1. معالجة النص عشان نضمن إن التنسيق صح (yyyy-mm-dd)
  // بنقطع النص عند الشرطة "-"
  List<String> parts = birthDateString.split('-'); 
  
  // بنخلي السنة والشهر واليوم دايماً بالتنسيق الصح (رقمين للشهر واليوم)
  String year = parts[0];
  String month = parts[1].padLeft(2, '0'); // لو 4 هتبقى 04
  String day = parts[2].padLeft(2, '0');   // لو 5 هتبقى 05
  
  String formattedDate = "$year-$month-$day";

  // 2. التحويل لـ DateTime (دلوقتي مش هيطلع Error)
  DateTime birthDate = DateTime.parse(formattedDate);
  DateTime today = DateTime.now();
  
  int age = today.year - birthDate.year;
  
  if (today.month < birthDate.month || 
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }
  
  return age;
}