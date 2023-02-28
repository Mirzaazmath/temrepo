import 'package:asws_mobile/screens/student/submitScreen.dart';
import 'package:asws_mobile/utils/buttonutils.dart';
import 'package:flutter/material.dart';
class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Al-Hadith"),
      ),body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: Wrap(




              children: [
                listitems(1),
                listitems(1),
                listitems(1),
                listitems(1),
                listitems(1),
                listitems(1),
                listitems(1),
                listitems(1),
                listitems(1),
                listitems(1),
                listitems(1),
                listitems(1),



              ],
            ),
          ),

          Custombutton(title: "Submit", ontap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SubmitScreen()));
          }),
         const  SizedBox(height: 20,),
        ],
      ),
    )
    );
  }
  Widget listitems(int no){
    return  Row(
      children: [
        Checkbox(value: false, onChanged: (value){

        }),Text("Page $no")
      ],
    );
  }
}
