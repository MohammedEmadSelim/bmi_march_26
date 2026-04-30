import 'package:bmi/Method/caluc_bmi.dart';
import 'package:bmi/class/human.dart';
import 'package:bmi/widgets/Buttom_send.dart';
import 'package:flutter/material.dart';

class CalculateBmiPage extends StatelessWidget {
  final Human human;
  const CalculateBmiPage({super.key, required this.human});

  @override
  Widget build(BuildContext context) {
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
                    human.gender.toLowerCase() == 'male'
                        ? Color(0xff7876CD)
                        : Color(0xffFF8767),
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
                          human.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'A ${calculateAge(human.birth_date)} years old ${human.gender}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'DM Sans',
                            //fontWeight: FontWeight.w900
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text(
                            result_Bmi(human.height, human.weight).toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 76),
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
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  human.height.toString() + ' ' + 'cm',
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
                                  human.weight.toString() + ' ' + 'kg',
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
                      ],
                    ),
                    SizedBox(width: 8),
                    Image.asset(
                      human.gender.toLowerCase() == 'male'
                          ? 'assets/images/bmi_nti/Vector.png'
                          : 'assets/images/bmi_nti/fam.png',
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
                color: get_color(result_Bmi(human.height, human.weight)),
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
                        result_Bmi(human.height, human.weight),
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
                          result_Bmi(human.height, human.weight).toString(),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontFamily: 'DM Sans',
                      ),
                    ),
                    Text(
                      get_dec(
                        getResult(result_Bmi(human.height, human.weight)),
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