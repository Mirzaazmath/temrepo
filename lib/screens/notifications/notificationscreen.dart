import 'package:asws_mobile/utils/textutils.dart';
import 'package:flutter/material.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Notification"),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child:const  Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView.builder(
                physics:const  NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                  itemBuilder: (context,index){
                return notificationItem();
              })

            ],
          ),
        ),
      ),
    );
  }
  Widget notificationItem(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.chat_bubble,color: Colors.red,),
        ),title: Text("Admin Add New Subject",style: TextStyle(fontWeight: FontWeight.bold),
      ),
        subtitle: normalgreytext("just now"),
      ),
    );
  }
}
