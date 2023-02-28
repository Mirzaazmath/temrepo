import 'package:flutter/material.dart';
Widget heading1(String title){
  return Text(title,style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold),);
}
Widget heading2(String title){
  return Text(title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),);
}
Widget normalgreytext(String title){
  return  Text(title,style: const TextStyle(color: Colors.grey,fontSize: 15),);
}