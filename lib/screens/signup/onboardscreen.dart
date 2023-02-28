
import 'package:asws_mobile/screens/signup/signinscreen.dart';
import 'package:asws_mobile/utils/buttonutils.dart';
import 'package:flutter/material.dart';

import '../../utils/textutils.dart';
import 'loginscreen.dart';
class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/study.png"),
                  heading2("Learning at Home Anything"),
                 const  SizedBox(height: 20,),
                  normalgreytext("We' are Providing the best \n      online courses to you."),

                ],
              ),

            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(

              child: Padding(
                padding:const  EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child:Custombutton(title: 'sign up',ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInScreen()));
                      },),
                    ),
                  const  SizedBox(width: 20,),
                    Expanded(
                      child: Borderbuton(title: 'Log in',ontap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
                      },),
                    )
                  ],
                ),
              ),

            ),
          )
        ],
      ),

    );
  }
}
