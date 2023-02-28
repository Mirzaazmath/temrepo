import 'package:asws_mobile/screens/signup/loginscreen.dart';
import 'package:flutter/material.dart';

import '../../utils/buttonutils.dart';
import '../../utils/textutils.dart';
class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: heading2("Verify"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              color: Colors.grey.shade200,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                    Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("assets/images/forget.jpg"),
                    ),
                  ),
                   SizedBox(height: 20,),
                  Text("Enter the 4-digit that we have sent via the Email"),
                  SizedBox(height: 50,),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(height: 50,
                        width: 50,
                        padding:const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5)
                        ),
                          child: TextFormField(decoration: InputDecoration(border: InputBorder.none),),
                        ),
                        Container(height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)
                          ),),
                        Container(height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)
                          ),),
                        Container(height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)
                          ),)
                      ],
                    ),
                    const  SizedBox(height: 30,),
                    normalgreytext("Didn't recieve code?"),
                    const  SizedBox(height: 30,),
                    Custombutton(title: "Verify", ontap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                    })

                  ],
                ))
          ],
        ),
      ),
    );
  }
}
