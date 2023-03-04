import 'package:asws_mobile/utils/textutils.dart';
import 'package:flutter/material.dart';
class Feilds extends StatefulWidget {
  TextEditingController controller;
  String hinttext;
  String title;
  bool? readonly;
  bool ispassword;
  Feilds({required this.controller,required this.hinttext,required this.ispassword,required this.title,this.readonly});
  @override
  State<Feilds> createState() => _FeildsState();
}

class _FeildsState extends State<Feilds> {
  bool? isshow;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isshow=widget.ispassword;
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        normalgreytext(widget.title),
        const SizedBox(height: 10,),
        widget.ispassword!? TextFormField(


          obscureText: isshow!,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon:GestureDetector(
                onTap: (){

                  if(isshow==true){
                    setState(() {
                      isshow=false;

                    });

                  }else{
                    setState(() {
                      isshow=true;

                    });

                  }
                },
                child:isshow!? Icon(Icons.visibility):Icon(Icons.visibility_off)),

            hintText: widget.hinttext,

            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(13),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:const  BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(13)
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ):
        TextFormField(
          readOnly: widget.readonly??false,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hinttext,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(13),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:const  BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(13)
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    );
  }
}
class Feilds2 extends StatelessWidget {
  TextEditingController controller;
  String hinttext;
  String title;
  int isnum;

  Feilds2({required this.controller,required this.hinttext,required this.title,required this.isnum});

  @override
  Widget build(BuildContext context) {
    return isnum==0? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        normalgreytext(title),
        const SizedBox(height: 5,),

        TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          decoration: InputDecoration(
            hintText: hinttext,

          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    ): Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        normalgreytext(title),
        const SizedBox(height: 5,),

        TextFormField(

          controller: controller,
          decoration: InputDecoration(
            hintText: hinttext,

          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    );
  }
}
