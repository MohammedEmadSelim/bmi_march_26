import 'package:flutter/material.dart';

class Buttom_send extends StatelessWidget {
  final Function() on_pers;
  final String text;
  const Buttom_send({
    super.key, required this.on_pers, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: on_pers,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: 350,
        decoration: BoxDecoration(
          color: Color(0xff484783),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(text,style: TextStyle(
          fontFamily: 'DM Sans',
          color: Colors.white,
          fontSize: 18
        ),),
      ),
    );
  }
}