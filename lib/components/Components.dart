import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Widget CustomInputField ({
  required controller ,
  VoidCallback? onTap,
  bool readOnly = false,
  FormFieldValidator<String>? validator,
}){
  return TextFormField(
    controller: controller,
  readOnly: readOnly,
  validator: validator,
  decoration: InputDecoration(
  fillColor: Color.fromRGBO(179, 178, 234, 0.15),
  filled: true,
  enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide(
  color: Color.fromRGBO(65, 64, 115, 0.11),
  ),
  ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.red,
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

Widget Button ({
  required context , required Widget page , required String text,
})
{
  return SizedBox(
    height: 40,
    width: 350,
    child: ElevatedButton (
      onPressed:  () {

        Navigator.pushReplacement(context,
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
  FormFieldValidator<String>? validator,
}){
  return TextFormField(
    controller: controller,
    validator: validator,
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.red,
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

Future<dynamic> getData ({required String height , required String weight}) async {

  Dio dio =Dio();
  try{
    var res = await dio.get("https://api.apiverve.com/v1/bmicalculator?weight=$weight&height=$height&unit=metric",
      options: Options(
        headers: {'x-api-key' : 'ff870e7d-5d78-4309-82bc-0b5e0347db0f'},),
    );
    return res;
  }catch(error){
    print(error);
  }


}