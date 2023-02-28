import 'package:asws_mobile/utils/textutils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/buttonutils.dart';
class AttendanceAnalytics extends StatefulWidget {
   AttendanceAnalytics({Key? key}) : super(key: key);

  @override
  State<AttendanceAnalytics> createState() => _AttendanceAnalyticsState();
}

class _AttendanceAnalyticsState extends State<AttendanceAnalytics> {
  String? attendance;
  String? gender;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    normalgreytext("Today's",),
                  const   SizedBox(height: 5,),
                  const   Text("Student Attendance",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showsheet(context);
                  },
                    child: Icon(Icons.tune,color: Theme.of(context).primaryColor,))
              ],
            ),
           const  SizedBox(height: 20,),
          Container(
              child: SfCircularChart(
                  palette:[
                    Colors.green,
                    Colors.yellow,
                    Colors.red
                  ],
                  series: <CircularSeries>[



                // Render pie chart
                PieSeries<ChartData, String>(


                    dataSource: chartData,

                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y
                )
              ])
          ),
           const  SizedBox(height: 40,),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.green.shade50,
                    color:Colors.green,
                    minHeight: 45,

                  ),
                ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Present",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("26",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),),
              ],
            ),
            const  SizedBox(height: 20,),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.2,
                    backgroundColor: Colors.red.shade50,
                    color:Colors.red,
                    minHeight: 45,

                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Absent",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("6",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),)
              ],
            ),
            const  SizedBox(height: 20,),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.2,
                    backgroundColor: Colors.yellow.shade50,
                    color:Colors.yellow,
                    minHeight: 45,

                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Leave",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("2",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),)
              ],
            ),
            const  SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }

  final List<ChartData> chartData = [
    ChartData('Present', 45,),
    ChartData('Leave', 25,),
    ChartData('Absent', 15,),

  ];

   void showsheet(context){
     showModalBottomSheet(
         shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
         ),
         isScrollControlled: true,
         context: context,
         builder: (context) {
           return StatefulBuilder(builder: (BuildContext context,
               StateSetter setmodelState /*You can rename this!*/) {
             return Container(

               padding: const EdgeInsets.all(20),
               child:  Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(

                     children: [
                       const     Expanded(
                           child: Center(child: Text("Search Filter",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),))),
                       GestureDetector(
                         onTap: (){
                           Navigator.pop(context);
                         },
                         child: Icon(Icons.close),
                       )
                     ],
                   ),
                   const  SizedBox(height: 30,),
                   const   Text("Attendance",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                   const  SizedBox(height: 20,),
                   Row(
                     children: [
                       Row(
                         children: [
                           Radio(
                               value: "Today", groupValue: attendance, onChanged: (value){
                             setmodelState(() {
                               attendance=value;
                             });

                           }),
                           Text("Today")
                         ],
                       ),
                       Row(
                         children: [
                           Radio(
                               value: "Overall", groupValue: attendance, onChanged: (value){
                             setmodelState(() {
                               attendance=value;
                             });

                           }),
                           Text("Overall")
                         ],
                       ),


                     ],
                   ),
                   const  SizedBox(height: 30,),
                   const   Text("Gender",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                   const  SizedBox(height: 20,),
                   Row(
                     children: [
                       Row(
                         children: [
                           Radio(
                               value: "Male", groupValue: gender, onChanged: (value){
                             setmodelState(() {
                               gender=value;
                             });

                           }),
                           Text("Male")
                         ],
                       ),
                       Row(
                         children: [
                           Radio(
                               value: "Female", groupValue: gender, onChanged: (value){
                             setmodelState(() {
                               gender=value;
                             });

                           }),
                           Text("Female")
                         ],
                       ),


                     ],
                   ),
                   const  SizedBox(height: 30,),

                   Custombutton(title: "Apply Filter", ontap: (){
                     Navigator.pop(context);
                   }),
                   // Row(
                   //   children: [
                   //     Expanded(
                   //       child:
                   //     ),
                   //     Custombutton(title: "Apply Filter", ontap: (){}),
                   //   ],
                   // )


                 ],
               ),
             );
           });
         });
   }
}

class ChartData {
  ChartData(this.x, this.y, );
  final String x;
  final double y;

}