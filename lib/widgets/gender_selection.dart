import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key, required this.selectedGender});
  final ValueChanged<int> selectedGender;
  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int genderSelection = 0 ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Choose Gender', style: TextStyle(fontSize: 20)),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                genderSelection = 0;
                // widget.selectedGender(genderSelection);
                setState(() {});
              },
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffEBEDFC),
                      borderRadius: BorderRadius.circular(16),
                      border: genderSelection == 0
                          ? Border.all(color: Colors.green, width: 4)
                          : null,
                    ),
                    child: Image.asset('assets/images/male.png',fit: BoxFit.fill,),
                  ),
                  Text('male'),
                ],
              ),
            ),
            SizedBox(width: 60),
            GestureDetector(
              onTap: (){
                genderSelection = 1;
                // widget.selectedGender(genderSelection);
                setState(() {});
              },
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffEBEDFC),
                      borderRadius: BorderRadius.circular(16),
                      border: genderSelection == 1
                          ? Border.all(color: Colors.green, width: 4)
                          : null,
                    ),
                    child: Image.asset('assets/images/female.png',fit: BoxFit.fill,),
                  ),
                  Text('female'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
