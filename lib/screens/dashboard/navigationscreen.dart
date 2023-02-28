import 'package:asws_mobile/screens/student/studentscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../attendance/attendancescreen.dart';
import '../events/eventsScreen.dart';
import 'homeScreen.dart';
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
 int  _selectedIndex=0;
 List<Widget>itemsScreens=[
   HomeScreen(),
   StudentScreen(),
   AttendanceScreen(),
   EventsScreen(),

 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body:itemsScreens[_selectedIndex] ,

        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          decoration:  BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
              color:Colors.white ,
              borderRadius:const  BorderRadius.only(
              topLeft: Radius.circular(20),
                topRight:  Radius.circular(20),
          )
          ),

          child: GNav(
            gap: 8,
            tabBackgroundColor: Theme.of(context).primaryColor,
            color: Colors.grey,
            activeColor: Colors.white,

            backgroundColor: Colors.white,
            padding:const  EdgeInsets.all(10),
            tabs: const [
              GButton(icon: Icons.home_outlined,text: "Home",),
              GButton(icon: Icons.person,text: "Students",),
              GButton(icon: Icons.assignment_ind,text: "Attendance",),
              GButton(icon: Icons.event_note,text: "Events",),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          ),
        );


  }
}
