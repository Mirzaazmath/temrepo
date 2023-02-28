import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigationscreen.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentindex=0;
  @override
  gettoken()async{
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    debugPrint("This Is token==$token");

  }
  Widget build(BuildContext context) {
    gettoken();

    return ZoomDrawer(
      menuScreen: Drawer( setindex: (index){
        setState(() {
          currentindex=index;
        });

      },),
      mainScreen: setscreen(),
      borderRadius: 30,
      showShadow: true,
      angle: 0,
      menuBackgroundColor:Theme.of(context).primaryColor,
      moveMenuScreen: false,



    );



  }
  Widget setscreen(){
    switch(currentindex){
      case 0:
        return NavigationScreen();

      case 1:
        return NavigationScreen();
      case 2:
        return NavigationScreen();
      case 3:
        return NavigationScreen();
      case 4:
        return NavigationScreen();
      case 5:
        return NavigationScreen();
      default:
        return NavigationScreen();
    }

  }
}

class Drawer extends StatelessWidget {
  final ValueSetter setindex;
  const Drawer({Key? key, required this.setindex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 80,
                width:80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/person.jpeg"),fit: BoxFit.fill
                    )

                ),
                // child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,),

              ),
              const  Padding(
                padding:  EdgeInsets.only(top: 20),
                child: Text("Welcome Mirza!",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              drawerlist(Icons.home_outlined, "Home Page",0,context),
              drawerlist(Icons.notifications_outlined, "Notifications",2,context),
              drawerlist(Icons.star_outline, "Rate Us",3,context),
              drawerlist(Icons.error_outline_rounded, "Help Center",4,context),
              drawerlist(Icons.logout_outlined, "Sign Out",5,context),


            ],
          ),
        ),
      ),
    );
  }
  Widget drawerlist(IconData icon,String text,int index,context){
    return GestureDetector(
      onTap: (){
        setindex(index);
        ZoomDrawer.of(context)!.close();
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 30,top: 30),
        child: Row(
          children: [
            Icon(icon,color: Colors.white70,),
          const   SizedBox(width: 20,),
            Text(text,style:const  TextStyle(color: Colors.white70,fontSize: 18,fontWeight: FontWeight.bold),),

          ],
        ),

      ),
    );
  }
}
