import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GlobalMethods {
 

  void showLoader(BuildContext ctx, bool showLoader) {
    if (showLoader) {
      showDialog(
          barrierDismissible: false,
          context: ctx,
          builder: (ctx) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
    } else {
      Navigator.of(ctx).pop();
    }
  }
}

class StudentShimmer extends StatelessWidget {
  const StudentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context,index){
          return
            Container(
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                height: 100,
                width: double.infinity,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: CircleAvatar(
                      radius: 30,
                    ),

                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,

                          child: Container(height: 15,color: Colors.grey,)),
                      SizedBox(height: 5,),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,

                          child: Container(height: 15,color: Colors.grey,)),
                    ],

                  ),
                  trailing:  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: CircleAvatar(
                      radius: 25,
                    ),

                  ),


                )
            );
        });
  }
}
class AttendanceShimmer extends StatelessWidget {
  const AttendanceShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context,index){
          return
            Container(
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                height: 100,
                width: double.infinity,
                alignment: Alignment.center,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        radius: 30,
                      ),

                    ),

                    Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,

                        child: Container(height: 15,
                          width: 100,
                          color: Colors.grey,)),
                    Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,

                        child: Container(height: 20,
                          width: 20,
                          color: Colors.grey,)),
                    Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,

                        child: Container(height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)
                          ),)),
                  ],
                )
            );
        });
  }
}
class EventShimmer extends StatelessWidget {
  const EventShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,

              child: Container(height: 55,
                width: 100,
               decoration: BoxDecoration(
                 color: Colors.grey,
                 borderRadius: BorderRadius.circular(30)
               ),)),
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,

              child: Container(height: 55,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)
                ),)),
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,

              child: Container(height: 55,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)
                ),)),

        ],),

        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context,index){
              return
                Container(
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.white,
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,

                            child: Container(height: 15,
                              width: 100,
                              color: Colors.grey,)),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,

                            child: Container(height: 15,
                              width: 150,color: Colors.grey,)),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,

                            child: Container(height: 15,
                              width: 200,color: Colors.grey,)),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,

                            child: Container(height: 15,
                              width: 100,
                              color: Colors.grey,)),
                      ],
                    )
                );
            }),
      ],
    );
  }
}
