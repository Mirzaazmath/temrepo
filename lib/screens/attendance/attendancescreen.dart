import 'package:asws_mobile/screens/profile/profilescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/studentprovider/getstudentprovider.dart';
import '../dashboard/homeScreen.dart';
import '../notifications/notificationscreen.dart';
import 'attendanceanalytics.dart';
import 'attendencelist.dart';
class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {

  int _selectedscreen=0;
  List<Widget>bodyitems=[AttendanceList(),AttendanceAnalytics(),];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetStudentProvider>().getstudentslist(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:const  Text("Attendance",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: IconButton(icon: const Padding(
            padding:  EdgeInsets.all(5),
            child:Icon(Icons.segment)
        ),onPressed: (){
          ZoomDrawer.of(context)!.toggle();


        },),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child:   Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _selectedscreen=0;
                        });
                      },
                      child: Container(height: 45,
                        width: 140,
                        decoration: BoxDecoration(
                          color:_selectedscreen==0? Colors.white:Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Text("Attendance",style: TextStyle(color: _selectedscreen==0?  Theme.of(context).primaryColor:Colors.white,fontWeight: FontWeight.bold),),

                      ),
                    ),
                    const   SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _selectedscreen=1;
                        });
                      },
                      child: Container(height: 45,
                        width: 140,
                        decoration: BoxDecoration(
                          color:_selectedscreen==1? Colors.white:Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Text("Analytics",style: TextStyle(color:_selectedscreen==1?  Theme.of(context).primaryColor:Colors.white,fontWeight: FontWeight.bold),),

                      ),
                    ),
                  ],
                ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const   Text("Select Date",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      Text(DateFormat.yMMMd().format(DateTime.now()),style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

                    ],
                  ),
            ),
              ],
            ),
          ),

        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationScreen()));
            },
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              child: Stack(children:const [
                Icon(Icons.notifications,size: 25,color: Colors.blue,),
                Positioned(
                    right: 0,
                    top: 5,
                    left: 10,
                    child: CircleAvatar(radius: 5,backgroundColor: Colors.purpleAccent,))
              ]),
            ),
          ),
          const  SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              getteacherinfo(context);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },

            child: const  CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage("assets/images/person.jpeg"),
            ),
          ),
          const  SizedBox(width: 10,),
        ],
      ),
      body:bodyitems[_selectedscreen],


    );
  }

}

