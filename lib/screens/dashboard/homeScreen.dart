import 'dart:async';

import 'package:asws_mobile/constant/apiendpoint.dart';
import 'package:asws_mobile/utils/buttonutils.dart';
import 'package:asws_mobile/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/loader.dart';
import '../notifications/notificationscreen.dart';
import '../profile/profilescreen.dart';
import '../student/addstudent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool ispressed = false;
  String checkintime = "";
  String? checkouttime;
  DateTime? starttime;
  DateTime? endtime;
  var longitude = "longitude";
  var latitude = "latitude";
  var address = "address";
  late StreamSubscription<Position> streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Obtain shared preferences.

    _getcurrentlocation();
  }

  void _getcurrentlocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("Location Services are disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied");
    }
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude = "latitude ${position.latitude}";
      longitude = "longitude${position.longitude}";
      getaddressfromlanlong(position);
    });
  }

  getaddressfromlanlong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    setState(() {
      address = '${place.subLocality},${place.country}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Assalamualikum",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Padding(
              padding: EdgeInsets.all(5), child: Icon(Icons.segment)),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen()));
            },
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              child: Stack(children: const [
                Icon(
                  Icons.notifications,
                  size: 25,
                  color: Colors.blue,
                ),
                Positioned(
                    right: 0,
                    top: 5,
                    left: 10,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.purpleAccent,
                    ))
              ]),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: const CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage("assets/images/person.jpeg"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const ClockWidget(),
                  // Text("05:30 PM",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateFormat.yMMMMEEEEd().format(DateTime.now()),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      if (ispressed) {
                        endtime = DateTime.now();
                        checkouttime = DateFormat.jm().format(DateTime.now());
                      } else {
                        starttime = DateTime.now();
                        checkintime = DateFormat.jm().format(DateTime.now());
                      }
                      ispressed = !ispressed;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        gradient: ispressed
                            ? LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                    Colors.red,
                                    Colors.red.withOpacity(0.5)
                                  ])
                            : LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                    Colors.blue,
                                    Colors.blue.withOpacity(0.5)
                                  ]),
                      ),
                      child: Icon(
                        Icons.touch_app,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(address.toString()),
              const SizedBox(
                height: 20,
              ),
              Custombutton(
                  title: "Add Student",
                  ontap: () {
                    gotoaddStudent(context);
                  }),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.deepPurpleAccent.withOpacity(0.3),
                          size: 60,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(checkintime),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Check In")
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.deepPurpleAccent.withOpacity(0.3),
                          size: 60,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(checkouttime ?? ""),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Check Out")
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.deepPurpleAccent.withOpacity(0.3),
                          size: 60,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        checkouttime == null
                            ? Text("")
                            : totaltime(starttime!, endtime!),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Working Hours")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void gotoaddStudent(context) async {
    List<String> zonelist = [
      "center",
      "Hyderabad",
      "Secunderabad",
      "Bandlaguda",
    ];
    List<String> parentstatus = [
      "Father",
      "Mother",
      "Guardian",
    ];
    GlobalMethods().showLoader(context, true);
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final url = Uri.parse(ApiEndPoints.baseurl + ApiEndPoints.getzonenames);
    try {
      var response = await get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );
      GlobalMethods().showLoader(context, false);
      if (response.statusCode == 200) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddStudentScreen(zonelist, parentstatus)));
      } else {
        showToast("Something Went Wrong");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void checkincall() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    starttime = DateTime.now();
    checkintime = DateFormat.jm().format(DateTime.now());

    await prefs.setString('checkin', '$starttime');
  }

  void checkoutcall() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    endtime = DateTime.now();
    checkouttime = DateFormat.jm().format(DateTime.now());

    await prefs.setString('checkout', '$endtime');
  }

  Widget totaltime(DateTime checkintime, DateTime checkouttime) {
    Duration dif = checkouttime.difference(checkintime);

    return Text(dif.inHours.toString());
  }
}

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Text(
          DateFormat.jm().format(DateTime.now()),
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
        );
      },
    );
  }
}
