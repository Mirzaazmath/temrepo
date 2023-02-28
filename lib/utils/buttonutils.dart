import 'package:flutter/material.dart';
class Custombutton extends StatelessWidget {
  String title;
  VoidCallback ontap;
  Custombutton({required this.title,required this.ontap});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor
        ),
        alignment: Alignment.center,
        child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),),
      ),
    );
  }
}

class Borderbuton extends StatelessWidget {
  String title;
  VoidCallback ontap;
  Borderbuton({required this.title,required this.ontap});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        alignment: Alignment.center,
        child: Text(title,style:  TextStyle(color:Theme.of(context).primaryColor,fontWeight: FontWeight.w500,fontSize: 18),),
      ),
    );
  }
}
