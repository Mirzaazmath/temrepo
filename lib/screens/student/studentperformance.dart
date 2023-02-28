import 'package:asws_mobile/utils/buttonutils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class StudentPerformanceScreen extends StatefulWidget {
   StudentPerformanceScreen({Key? key}) : super(key: key);

  @override
  State<StudentPerformanceScreen> createState() => _StudentPerformanceScreenState();
}

class _StudentPerformanceScreenState extends State<StudentPerformanceScreen> {
  String? studentper;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const   Text("Students Performance",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  GestureDetector(
                    onTap: (){
                      showsheet(context);
                    },
                      child: Icon(Icons.tune,color: Theme.of(context).primaryColor,))

                ],
              ),
             const  SizedBox(height: 25,),
              SizedBox(
                height: 300,
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Top Students'),
                    // Enable legend

                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      ColumnSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'Sales',
                          // Enable data label
                      )
                    ]),

              ),
             const  SizedBox(height: 30,),
              progressitems(),
              progressitems(),
              progressitems(),
              progressitems(),
              progressitems(),



            ],
          ),
        ),
      ),

    );
  }

  Widget progressitems(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shoib Ahmed"),
              Text("85%")
            ],
          ),
         const  SizedBox(height: 10,),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.8,
              backgroundColor: Colors.grey.shade300,
              color:Colors.blue,
              minHeight: 8,

            ),
          ),

        ],
      ),
    );
  }

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
                     const   Text("Student Performance",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                   const  SizedBox(height: 20,),
                   Row(
                     children: [
                       Row(
                         children: [
                           Radio(
                               value: "Top", groupValue: studentper, onChanged: (value){
                             setmodelState(() {
                               studentper=value;
                             });

                           }),
                           Text("Top")
                         ],
                       ),
                       Row(
                         children: [
                           Radio(
                               value: "Average", groupValue: studentper, onChanged: (value){
                             setmodelState(() {
                               studentper=value;
                             });

                           }),
                           Text("Average")
                         ],
                       ),
                       Row(
                         children: [
                           Radio(
                               value: "Least", groupValue: studentper, onChanged: (value){
                             setmodelState(() {
                               studentper=value;
                             });

                           }),
                           Text("Least")
                         ],
                       )

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

  List<_SalesData> data = [

    _SalesData('Mohd Amair', 34),
    _SalesData('Syed Ilyas', 32),
    _SalesData('Shaik yaqub', 40)
  ];
}
class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
