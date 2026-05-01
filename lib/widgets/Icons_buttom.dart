
import 'package:flutter/material.dart';


class Icons_buttom extends StatelessWidget {
  final Function() on_pers;
  final IconData iconData ;
  const Icons_buttom({
    super.key, required this.on_pers, required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: on_pers, icon: Icon( iconData,size: 30,color: Color(0xff484783),weight: 40,));
  }
}
