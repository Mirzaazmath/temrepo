import 'package:asws_mobile/screens/student/subjectscreen.dart';
import 'package:flutter/material.dart';
class StudentDetailsScreen extends StatelessWidget {
  const StudentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ahmed Subjects"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const  EdgeInsets.all(20),
          child: GridView.builder(

              physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
              ),
              itemCount: 10,

              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubjectScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:index.isEven? Colors.pink.shade100:Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text("Al Hadith",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                       const  Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: 0.3,
                            backgroundColor: Colors.white,
                            color:index.isEven? Colors.orange:Colors.blue,
                            minHeight: 8,

                          ),
                        ),
                       const  SizedBox(height: 5,),
                       const  Text("In- Progress"),
                        const  SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          const   Text("14/32",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: index.isEven? Colors.pinkAccent:Colors.blueAccent,

                              child:const  Icon(Icons.play_arrow,size: 40,color: Colors.white,),)


                          ],
                        ),
                        const  SizedBox(height: 15,),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
