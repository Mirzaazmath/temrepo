import 'package:asws_mobile/utils/buttonutils.dart';
import 'package:asws_mobile/utils/textfeildutils.dart';
import 'package:flutter/material.dart';

import '../../utils/textutils.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _namecontroller =  TextEditingController();
  TextEditingController _gendercontroller=TextEditingController();
  TextEditingController _dobcontroller=TextEditingController();
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _addresscontroller =TextEditingController();
  TextEditingController _universitycontroller=TextEditingController();
  TextEditingController _startdatecontroller=TextEditingController();
  TextEditingController _enddatecontroller=TextEditingController();
  TextEditingController _degreecontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Profile"),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child:const  Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const  EdgeInsets.all(20),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
            padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end:Alignment.centerLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.4)
              ]
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading:Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/person.jpeg"),
                ),

              ],
            ),
            title: Text("Ahmed  Shareef",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
            subtitle:  Text("99887366363",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),

            ))),
             const  SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  normalgreytext("Personal Information"),
                  Text("Edit",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),)
                ],
              ),
               const  SizedBox(height: 10,),
              Container(
                padding:const  EdgeInsets.symmetric(vertical: 20,horizontal: 10),

                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor.withOpacity(0.3)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Feilds(controller: _namecontroller, hinttext: "FullName", ispassword: false, title: "Full Name"),
                   const  SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(child:  Feilds(controller: _gendercontroller, hinttext: "Male", ispassword: false, title: "Gender")),
                       const  SizedBox(width: 10,),
                        Expanded(child:  Feilds(controller: _dobcontroller, hinttext: "30-05-1995", ispassword: false, title: "D.O.B"))
                      ],
                    ),
                    const  SizedBox(height: 20,),
                    Feilds(controller: _emailcontroller, hinttext: "email@.com", ispassword: false, title: "Email"),
                    const  SizedBox(height: 20,),
                    normalgreytext("Address"),
                    const  SizedBox(height: 10,),
                    TextFormField(
                      maxLines: 5,
                      controller:_addresscontroller,
                      decoration: InputDecoration(

                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:const  BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(13)
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
             const  SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  normalgreytext("Qualification Information"),
                  Text("Edit",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),)
                ],
              ),
              const  SizedBox(height: 10,),
              Container(
                padding:const  EdgeInsets.symmetric(vertical: 20,horizontal: 10),

                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor.withOpacity(0.3)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Feilds(controller: _universitycontroller, hinttext: "Osmania", ispassword: false, title: "University"),
                    const  SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(child:  Feilds(controller: _startdatecontroller, hinttext: "05-06-2018", ispassword: false, title: "Start Date")),
                        const  SizedBox(width: 10,),
                        Expanded(child:  Feilds(controller: _enddatecontroller, hinttext: "30-05-2021", ispassword: false, title: "End Date"))
                      ],
                    ),
                    const  SizedBox(height: 20,),
                    Feilds(controller: _degreecontroller, hinttext: "Graduation", ispassword: false, title: "Degree"),
                    const  SizedBox(height: 20,),

                  ],
                ),
              ),
              const  SizedBox(height: 40,),
              Custombutton(title: "LogOut", ontap: (){}),
              const  SizedBox(height: 40,),

            ],
          ) ,
        ),
      ),
    );
  }
}
