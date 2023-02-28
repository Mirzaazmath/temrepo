import 'package:asws_mobile/screens/signup/verifyscreen.dart';
import 'package:asws_mobile/utils/buttonutils.dart';
import 'package:asws_mobile/utils/textfeildutils.dart';
import 'package:asws_mobile/utils/textutils.dart';
import 'package:flutter/material.dart';
class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController _emailcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: heading2("Reset password"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height: MediaQuery.of(context).size.height*0.5,
              color: Colors.grey.shade200,
              child:const  Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/forget.jpg"),
                ),
              ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              
              child: Column(
                children: [
                  Feilds(controller:_emailcontroller , hinttext: "Email", ispassword: false, title: "Your Email"),
                 const  SizedBox(height: 30,),
                  Custombutton(title: "Send OTP", ontap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>VerifyScreen()));
                  })

                ],
              ))
          ],
        ),
      ),
    );
  }
}
