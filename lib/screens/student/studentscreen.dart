import 'package:asws_mobile/screens/student/studentlist.dart';
import 'package:asws_mobile/screens/student/studentperformance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import '../../providers/studentprovider/getstudentprovider.dart';
import '../notifications/notificationscreen.dart';
import '../profile/profilescreen.dart';
class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  int _selectedscreen=0;
  List<Widget>bodyitems=[StudentList(),StudentPerformanceScreen(),];
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
        title:const  Text("Asws",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: IconButton(icon: const Padding(
            padding:  EdgeInsets.all(5),
            child:Icon(Icons.segment)
        ),onPressed: (){
          ZoomDrawer.of(context)!.toggle();


        },),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                    child: Text("Student List",style: TextStyle(color: _selectedscreen==0?  Theme.of(context).primaryColor:Colors.white,fontWeight: FontWeight.bold),),

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
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },
            child: const  CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage("assets/images/person.jpeg"),
            ),
          ),
          const  SizedBox(width: 10,),
        ],
      ),
      body: bodyitems[_selectedscreen],
    );
  }
}
