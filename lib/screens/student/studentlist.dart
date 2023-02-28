import 'dart:convert';

import 'package:asws_mobile/model/studentmodel.dart';
import 'package:asws_mobile/screens/student/studentdetailscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/studentprovider/getstudentprovider.dart';
import '../../utils/loader.dart';
class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     context.read<GetStudentProvider>().getstudentslist(context);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<StudentModel> _studentlist= context.watch<GetStudentProvider>().studentlist ;
    bool isLoad=context.watch<GetStudentProvider>().isload ;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor
              ),
              child: Row(
                children: [
                 const Icon(Icons.search),
                  const SizedBox(width: 20,),
                  Expanded(child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none
                    ),

                  )),
                  const SizedBox(width: 20,),
                  const Icon(Icons.tune),

                ],
              ),
            ),
           const SizedBox(height: 20,),
            Text("Students",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
            const SizedBox(height: 20,),
            isLoad?StudentShimmer(): _studentlist.isEmpty?

            Container(
              height: 300,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("No Data Found ",style: Theme.of(context).textTheme.headline4,),
            ) :   ListView.builder(
              physics:const  NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _studentlist.length,
                itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StudentDetailsScreen()));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:const  EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200)
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading:
                      CircleAvatar(radius: 30,
                      backgroundImage:MemoryImage(const Base64Decoder().convert(_studentlist[index].photo.toString())),),
                    title:  Text("${_studentlist[index].firstName} ${_studentlist[index].lastName} ",style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("ID:${_studentlist[index].id}",style: TextStyle(color: Theme.of(context).primaryColor),),
                    trailing: const CircleAvatar(
                      child: Icon(Icons.arrow_forward_ios,size: 15,),
                      radius: 15,),

                  ),
                ),
              );
            })
          ]
        ),
      ),
    );
  }
}
