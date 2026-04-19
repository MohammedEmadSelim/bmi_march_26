import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget CustomInputField ({
  required controller ,
  VoidCallback? onTap,
  bool readOnly = false,
}){
  return TextFormField(
    controller: controller,
  readOnly: readOnly,
  decoration: InputDecoration(
  fillColor: Color.fromRGBO(179, 178, 234, 0.15),
  filled: true,
  enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide(
  color: Color.fromRGBO(65, 64, 115, 0.11),
  ),
  ),
  ),
    onTap: onTap,
  );
}

Widget Label ({
  required String text,
})
{
  return Text(text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),);}

Widget Button({
  required context , required Widget page , required String text,

})
{
  return SizedBox(
    height: 40,
    width: 350,
    child: ElevatedButton(
      onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> page));

      },
      child: Text(text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff484783),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          )
      ),
    ),
  );
}

Widget CalculatedInputField ({
  required controller ,
}){
  return TextFormField(
    controller: controller,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
    ],
    decoration: InputDecoration(
      fillColor: Color.fromRGBO(179, 178, 234, 0.15),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Color.fromRGBO(65, 64, 115, 0.11),
        ),
      ),
      prefixIcon: GestureDetector(
        onTap: (){
          int? res = int.tryParse(controller.text);
          if (res != null) {
            int finalRes = --res;
            controller.text = finalRes.toString();
          }
        },
          child: Icon(Icons.remove),
      ),
      suffixIcon: GestureDetector(
        onTap: (){
          int? res = int.tryParse(controller.text);
          if (res != null) {
            int finalRes = ++res;
            controller.text = finalRes.toString();
          }
        },
          child: Icon(Icons.add),
      ),
    ),

  );
}