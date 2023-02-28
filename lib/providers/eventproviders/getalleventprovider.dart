import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/apiendpoint.dart';
import '../../model/eventmodel.dart';
import '../../utils/loader.dart';
import '../../utils/toast.dart';
class GetEventsProvider extends ChangeNotifier{
  List<Eventsmodel>_evetlist=[];
  bool _isload =false;
  get eventlist=>_evetlist;
  get isload=>_isload;
  List toResponseList(List data) {
    List<Eventsmodel> value = [];
    for (var element in data) {
      value.add(Eventsmodel.fromJson(element));
    }
    return value;
  }
  void geteventlistlist(ctx)async{
    debugPrint("This is event list");
    _isload=true;
    // GlobalMethods().showLoader(ctx, true);
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    debugPrint("This Is token==$token");
    var result;
    final url = Uri.parse(ApiEndPoints.baseurl+ApiEndPoints.getallevents);


    try{

      var response= await get(url,
        headers: {
          "Authorization":"Bearer $token"
        },
      );
      _isload=false;
      // GlobalMethods().showLoader(ctx, false);
      if(response.body.isNotEmpty) {
        result=   json.decode(response.body);
      }
      debugPrint(result.toString());
      if(response.statusCode==200){
        List<dynamic>? body = jsonDecode(response.body);
        _evetlist =
            body?.map((dynamic item) => Eventsmodel.fromJson(item)).toList() ?? [];

        notifyListeners();

        debugPrint("Sucessfully Hit the Api");
        debugPrint(result.toString());
      }else{
        showToast("Something went wrong");
        debugPrint("Something went wrong");

      }

    }catch(error){
      debugPrint(error.toString());
    }


  }

}


