import 'package:asws_mobile/screens/signup/loginscreen.dart';
import 'package:flutter/material.dart';

import '../../utils/buttonutils.dart';
import '../../utils/textfeildutils.dart';
import '../../utils/textutils.dart';


class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                height:MediaQuery.of(context).size.height*0.2 ,
                padding:const  EdgeInsets.all(25),
                width: double.infinity,
                color: Colors.grey.shade300,
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    heading1("Sign Up"),
                    const SizedBox(height: 10,),
                    normalgreytext("Enter your details below & free sign up")
                  ],
                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height*0.8,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Feilds(controller:emailcontroller, hinttext: 'Name', ispassword: false,title: "Name",),
                      const SizedBox(height: 20,),
                      Feilds(controller:emailcontroller, hinttext: 'Email', ispassword: false,title: "Your Email",),
                      const SizedBox(height: 20,),
                      Feilds(controller:passwordcontroller, hinttext: 'Password', ispassword: true,title: "Password",),


                      const   SizedBox(height: 20,),
                      Custombutton(title: "Create account", ontap: (){
                        if (_formKey.currentState!.validate()) {


                        }

                      }),
                      const  SizedBox(height: 20,),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value){}),
                          const  Text("By creating an account you have to agree \n with our terms and conditions",style:  TextStyle(color: Colors.grey,),),

                        ],
                      ),
                      const  SizedBox(height: 20,),
                      Center(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));

                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account ? ",
                              style:const  TextStyle(fontWeight: FontWeight.w500,color: Colors.grey),
                              children:  <TextSpan>[
                                TextSpan(text: 'Login', style: TextStyle(fontWeight: FontWeight.w500,color: Theme.of(context).primaryColor)),

                              ],
                            ),
                          ),
                        ),
                      ),





                    ],

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
