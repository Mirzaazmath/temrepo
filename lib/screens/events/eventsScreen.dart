import 'package:asws_mobile/providers/eventproviders/getalleventprovider.dart';
import 'package:asws_mobile/utils/buttonutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/eventmodel.dart';
import '../../utils/loader.dart';
import '../notifications/notificationscreen.dart';
import '../profile/profilescreen.dart';
import 'addeventsscreen.dart';
class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetEventsProvider>().geteventlistlist(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Eventsmodel> _evetlist= context.watch<GetEventsProvider>().eventlist ;
    bool show= context.watch<GetEventsProvider>().isload ;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title:const  Text("Events",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
        leading: IconButton(icon: const Padding(
            padding:  EdgeInsets.all(5),
            child:Icon(Icons.segment)
        ),onPressed: (){
          ZoomDrawer.of(context)!.toggle();


        },),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin:const  EdgeInsets.symmetric(horizontal: 30),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor,
                ),
                child: TextFormField(
                  decoration:const  InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none
                  ),
                ),

              ),
            const   SizedBox(height: 20,),
              Text("Category",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
              const   SizedBox(height: 20,),
            show?EventShimmer() : Column(
              children: [
                Row(
                  children: [
                    Expanded(

                      child:  Center(
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),


                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).cardColor,
                            ),

                            child:Text("Upcoming")

                        ),
                      ),),
                    Expanded(

                      child: Center(
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),


                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).cardColor,
                            ),

                            child:Text("Post Event")

                        ),
                      ),
                    ),
                    Expanded(

                        child: Custombutton(title: "Add Event", ontap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddEventsScreen()));
                        }))
                  ],
                ),
                const   SizedBox(height: 20,),

                _evetlist.isEmpty?
                Container(
                  height: 300,
                  alignment: Alignment.center,
                  child: Text("No Events Found",style: Theme.of(context).textTheme.headline4),):  ListView.builder(
                    reverse: true,
                    physics:const  NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _evetlist.length,
                    itemBuilder: (context,index){
                      return  eventcard(context,_evetlist[index]);
                    })
              ],
            )







            ],
          ),
        ),
      ),

    );
  }

  Widget eventcard(context,Eventsmodel data){
    return  Container(
      margin:const  EdgeInsets.symmetric(vertical: 20),
      padding:const  EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data.title.toString(),style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
          const   SizedBox(height: 10,),
        //  const   Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",style: TextStyle(fontSize: 10),),
             Text(data.description.toString(),style: TextStyle(fontSize: 10),),
          const   SizedBox(height: 10,),
          data.selectDate==null?Container(): Text(DateFormat('MM/dd/yyyy, hh:mm a').format( DateTime.fromMillisecondsSinceEpoch(data.selectDate!.toInt())).toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
          const   SizedBox(height: 10,),

          // Text("Bahadurpura,Hyderabad ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),




        ],
      ),

    );
  }
}
