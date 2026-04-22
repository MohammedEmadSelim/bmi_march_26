import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInputNum extends StatelessWidget {
  const CustomTextInputNum({super.key, required this.controller, required this.title});
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                Row(
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
            ],
          ),
          SizedBox(height: 8,),
              TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  prefixIcon: GestureDetector(
                    onTap: () {
                      var res = int.tryParse(controller.text);
                      if (res != null && res > 0) {
                        var finalRes = --res;

                        controller.text = finalRes.toString();
                      }
                    },
                    child: Icon(Icons.remove,size: 30,)),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      var res = int.tryParse(controller.text);
                     
                        var finalRes = res != null ? ++res : 1;

                        controller.text = finalRes.toString();
                     
                    },
                    child: Icon(Icons.add,size: 30,)) ,
                  fillColor: Color(0xffB3B2EA).withAlpha(50),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                ),
                )
                
              )
      ],
    );
  }
}