import 'dart:convert';

import 'package:asws_mobile/utils/buttonutils.dart';
import 'package:asws_mobile/utils/textfeildutils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/apiendpoint.dart';
import '../../utils/loader.dart';
import '../../utils/textutils.dart';
import '../../utils/toast.dart';
class AddEventsScreen extends StatefulWidget {
   AddEventsScreen({Key? key}) : super(key: key);

  @override
  State<AddEventsScreen> createState() => _AddEventsScreenState();
}

class _AddEventsScreenState extends State<AddEventsScreen> {
  TextEditingController _eventtitle =TextEditingController();

  TextEditingController _timecontroller=TextEditingController();

  TextEditingController _datecontroller=TextEditingController();

  TextEditingController _descriptin=TextEditingController();

   final _formKey = GlobalKey<FormState>();
   TimeOfDay time= const  TimeOfDay(hour: 10, minute: 50);
  void _pickDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),

        firstDate: DateTime(1950),

        lastDate: DateTime(2050),
            )
        .then((pickedDate) {

      if (pickedDate == null) {

        return;
      }
      setState(() {
        //for rebuilding the ui
        _datecontroller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    });
  }
  void _showTimepicker()async{
   TimeOfDay? newtime= await showTimePicker(context: context,
        initialTime: time);
   if(newtime==null)return;
   setState(() {
     time=newtime;
     _timecontroller.text="${newtime.hour.toString().padLeft(2,"0")}:${newtime.minute.toString().padLeft(2,"0")}";
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Add Events"),
      ),
      body:
      CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding:const  EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Feilds(controller:_eventtitle , hinttext: "Title", ispassword: false, title: "Event Title"),
                    const  SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(child: GestureDetector(
                          onTap: () {
                            _showTimepicker();
                          },
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              normalgreytext("Select Time"),
                              const SizedBox(height: 5,),

                              TextFormField(

                                controller: _timecontroller,
                                decoration:  InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:const  BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                  enabled: false,
                                  hintText: "00:00",
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
                        ),),
                        const  SizedBox(width: 20,),
                        Expanded(child: GestureDetector(
                          onTap: () {
                            _pickDateDialog();
                          },
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              normalgreytext("Select Date"),
                              const SizedBox(height: 5,),

                              TextFormField(

                                controller: _datecontroller,
                                decoration:  InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:const  BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                  enabled: false,
                                  hintText: "----",
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
                        ),),


                      ],
                    ),
                    const  SizedBox(height: 20,),
                    normalgreytext("Description"),
                    const SizedBox(height: 10,),

                    TextFormField(
                      maxLines: 5,
                      controller:_descriptin,
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
                   Expanded(child: Container(
                     height: 100,
                   )),


                    Custombutton(title: "Submit", ontap: (){
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        var data= {
                          "description": _descriptin.text.toString(),
                          "selectDate": _datecontroller.text.toString(),
                          "selectTime": "${_timecontroller.text}:0",
                          "title": _eventtitle.text.toString(),
                        };
                        addeventcall(context,data);
                        _timecontroller.text="";
                        _datecontroller.text="";
                        _eventtitle.text="";
                        _descriptin.text="";


                      }

                    }),


                  ],
                ),
              ),
            ),
          ),
        ],
      )
      //   SingleChildScrollView(
      //   child:
      // ),

    );
  }

   void addeventcall(ctx,var data) async{
     GlobalMethods().showLoader(ctx, true);
     final prefs = await SharedPreferences.getInstance();
     final String? token = prefs.getString('token');
     var result;

        var body= jsonEncode(data);
     final url = Uri.parse(ApiEndPoints.baseurl+ApiEndPoints.addnewevent);


     try{

       var response= await post(url,

            headers: {"Content-Type": "application/json",
         "Authorization":"Bearer $token",},
           body: body);
       GlobalMethods().showLoader(ctx, false);
       print(response.statusCode);
       if(response.body.isNotEmpty) {
         result=   json.decode(response.body);
       }
       // var result=jsonDecode(response.body);
       debugPrint(result.toString());
       if(response.statusCode==200){

         debugPrint("Sucessfully Hit the Api");


         showToast("Event Uploaded Successfully");

       }else{
         showToast("Something went wrong");
         debugPrint("Something went wrong");

       }

     }catch(error){
       debugPrint(error.toString());
     }


   }
}
