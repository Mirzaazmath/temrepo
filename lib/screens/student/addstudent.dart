import 'dart:convert';
import 'dart:io';

import 'package:asws_mobile/utils/textfeildutils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/apiendpoint.dart';
import '../../utils/loader.dart';
import '../../utils/textutils.dart';
import '../../utils/toast.dart';

class AddStudentScreen extends StatefulWidget {
  List<String> droplist;
  List<String> parentstatus;
  AddStudentScreen(this.droplist, this.parentstatus);

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController _firstnamecontroller = TextEditingController();
  TextEditingController _lastnamecontroller = TextEditingController();
  // TextEditingController _zonecontroller = TextEditingController();
  // TextEditingController _centercontroller = TextEditingController();

  TextEditingController _statecontroller = TextEditingController();
  TextEditingController _citycontroller = TextEditingController();
  TextEditingController _pincodecontroller = TextEditingController();
  TextEditingController _siblingfullnamecontroller = TextEditingController();
  TextEditingController _siblingagecontroller = TextEditingController();
  TextEditingController _siblingstandardcontroller = TextEditingController();
  TextEditingController _siblingschoolnamecontroller = TextEditingController();
  // TextEditingController _gardianstatuscontroller = TextEditingController();
  TextEditingController _gardianfirstnameontroller = TextEditingController();
  TextEditingController _gardianlastnameontroller = TextEditingController();
  TextEditingController _gardianphonecontroller = TextEditingController();
  TextEditingController _gardianemailcontroller = TextEditingController();
  TextEditingController _gardianeducationcontroller = TextEditingController();
  TextEditingController _gardianaddresscontroller = TextEditingController();
  TextEditingController _gardianocccupationcontroller = TextEditingController();
  //TextEditingController _gendercontroller = TextEditingController();
  TextEditingController _dobcontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController _schoolcontroller = TextEditingController();
  // TextEditingController _startdatecontroller = TextEditingController();
  TextEditingController _adhaarcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  List<DropdownMenuItem<String>> droplist = [];
  int _index = 0;
  File? userimage;
  String? gender = "Male";
  String? issibling = "Yes";
  String? broorsis = "Brother";

  String _currentSelectedcenter = "";
  String _currentSelectedzone = "";
  String _parentstatus = "";
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _currentSelectedcenter = widget.droplist.first;
    _currentSelectedzone = widget.droplist.first;

    _parentstatus = widget.parentstatus.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Add Student"),
      ),
      body: Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 1) {
            setState(() {
              _index += 1;
            });
          } else {
            if (userimage != null) {
              if (_firstnamecontroller.text != "") {
                if (_schoolcontroller.text != "") {
                  if (_dobcontroller.text != "") {
                    if (_adhaarcontroller.text != "") {
                      if (_phonecontroller.text != "") {
                        if (_emailcontroller.text != "") {
                          if (_statecontroller.text != "") {
                            if (_citycontroller.text != "") {
                              if (_pincodecontroller.text != "") {
                                if (_adhaarcontroller.text != "") {
                                  if (_gardianfirstnameontroller.text != "") {
                                    if (_gardianphonecontroller.text != "") {
                                      if (_gardianemailcontroller.text != "") {
                                        if (_addresscontroller.text != "") {
                                          addnewStudent(userimage, context);
                                        } else {
                                          showToast("Please Enter Address");
                                        }
                                      } else {
                                        showToast("Please Enter Parent Email");
                                      }
                                    } else {
                                      showToast(
                                          "Please Enter Parent Mobile No");
                                    }
                                  } else {
                                    showToast("Please Enter Parent Name");
                                  }
                                } else {
                                  showToast("Please Enter Aadhaar No");
                                }
                              } else {
                                showToast("Please Enter PinCode");
                              }
                            } else {
                              showToast("Please Enter City");
                            }
                          } else {
                            showToast("Please Enter State");
                          }
                        } else {
                          showToast("Please Enter Email");
                        }
                      } else {
                        showToast("Please Enter Mobile No");
                      }
                    } else {
                      showToast("Please Enter Aadhaar No");
                    }
                  } else {
                    showToast("Please Enter Date of Birth");
                  }
                } else {
                  showToast("Please Enter School Name");
                }
              } else {
                showToast("Please Enter Student Name");
              }
            } else {
              showToast("Please upload photo");
            }
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
              isActive: _index == 0,
              title: Text(
                'Student Details',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _index == 0
                        ? Theme.of(context).primaryColor
                        : Colors.black),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        userimage == null
                            ? const CircleAvatar(
                                radius: 50,
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(userimage!),
                              ),
                        GestureDetector(
                          onTap: () {
                            openphotooption(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 15,
                            child: const Icon(
                              Icons.add_a_photo,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  normalgreytext("Select Zone"),
                  const SizedBox(
                    height: 5,
                  ),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _currentSelectedzone,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    // style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        _currentSelectedzone = value!;
                      });
                    },
                    items: widget.droplist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  normalgreytext("Select Center"),
                  const SizedBox(
                    height: 5,
                  ),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _currentSelectedcenter,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    // style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        _currentSelectedcenter = value!;
                      });
                    },
                    items: widget.droplist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _firstnamecontroller,
                    hinttext: "First name",
                    title: "First Name",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _lastnamecontroller,
                    hinttext: "Last name",
                    title: "Last Name",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _schoolcontroller,
                    hinttext: "School name",
                    title: "School Name",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  normalgreytext("Gender"),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: "Male",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
                          Text("Male")
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: "Female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
                          Text("Female")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pickDateDialog();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        normalgreytext("Date of Birth"),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _dobcontroller,
                          decoration: const InputDecoration(
                            enabled: false,
                            hintText: "Birth date",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _adhaarcontroller,
                    hinttext: "xxxxxxxxxxxxx",
                    title: "Aadhaar No.",
                    isnum: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _phonecontroller,
                    hinttext: "987665543211",
                    title: "Mobile No.",
                    isnum: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _emailcontroller,
                    hinttext: "Email",
                    title: "Email",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _addresscontroller,
                    hinttext: "address",
                    title: "Address",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _statecontroller,
                    hinttext: "State",
                    title: "State",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _citycontroller,
                    hinttext: "City",
                    title: "City",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _pincodecontroller,
                    hinttext: "",
                    title: "Pincode",
                    isnum: 0,
                  ),
                ],
              )),
          Step(
              isActive: _index == 1,
              title: Text(
                'Sibling Details',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _index == 1
                        ? Theme.of(context).primaryColor
                        : Colors.black),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  normalgreytext("Sibling"),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: "Yes",
                            groupValue: issibling,
                            onChanged: (value) {
                              setState(() {
                                issibling = value;
                              });
                            },
                          ),
                          Text("Yes")
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: "No",
                            groupValue: issibling,
                            onChanged: (value) {
                              setState(() {
                                issibling = value;
                                _index += 1;
                              });
                            },
                          ),
                          Text("No")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: "Brother",
                            groupValue: broorsis,
                            onChanged: (value) {
                              setState(() {
                                broorsis = value;
                              });
                            },
                          ),
                          Text("Brother")
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: "Sister",
                            groupValue: broorsis,
                            onChanged: (value) {
                              setState(() {
                                broorsis = value;
                                _index += 1;
                              });
                            },
                          ),
                          Text("Sister")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _siblingfullnamecontroller,
                    hinttext: "Name",
                    title: "Full Name",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _siblingagecontroller,
                    hinttext: "",
                    title: "Age",
                    isnum: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _siblingstandardcontroller,
                    hinttext: "",
                    title: "Standard",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _siblingschoolnamecontroller,
                    hinttext: "",
                    title: "School Name",
                    isnum: 1,
                  ),
                ],
              )),
          Step(
              isActive: _index == 2,
              title: Text(
                'Family Details',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _index == 2
                        ? Theme.of(context).primaryColor
                        : Colors.black),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  normalgreytext("Parental Status"),
                  const SizedBox(
                    height: 5,
                  ),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _parentstatus,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    // style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        _parentstatus = value!;
                      });
                    },
                    items: widget.parentstatus
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _gardianfirstnameontroller,
                    hinttext: "",
                    title: "First Name",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _gardianlastnameontroller,
                    hinttext: "",
                    title: "Last Name",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _gardianphonecontroller,
                    hinttext: "",
                    title: "Phone No.",
                    isnum: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _gardianemailcontroller,
                    hinttext: "",
                    title: "Email",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _gardianaddresscontroller,
                    hinttext: "address",
                    title: "Address",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _gardianeducationcontroller,
                    hinttext: "",
                    title: "Educational Qualification",
                    isnum: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Feilds2(
                    controller: _gardianocccupationcontroller,
                    hinttext: "",
                    title: "Occupation",
                    isnum: 1,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void openphotooption(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(30),
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    pickimage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Camara")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pickimage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Gallery")
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void pickimage(source) async {
    final image =
        await ImagePicker().pickImage(source: source, imageQuality: 20);
    if (image == null) return;
    final temimage = File(image.path);

    setState(() {
      userimage = temimage;
    });
  }

  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _dobcontroller.text = DateFormat('yyyy/MM/dd').format(pickedDate);
      });
    });
  }

  void addnewStudent(File? imageFileList, context) async {
    bool sib = issibling == "Yes";
    int sibage = int.parse(
        _siblingagecontroller.text.isEmpty ? "0" : _siblingagecontroller.text);
    debugPrint(sib.toString());
    print(sibage);
    SharedPreferences userdata = await SharedPreferences.getInstance();

    final token = userdata.getString("token");
    print(token);

    final url = Uri.parse(ApiEndPoints.baseurl + ApiEndPoints.addnewstudent);

    GlobalMethods().showLoader(context, true);
    var request = http.MultipartRequest("Post", url);
    request.files
        .add(await http.MultipartFile.fromPath("file", imageFileList!.path));

    request.headers.addAll({
      "Content-type":
          "multipart/form-data; boundary=<calculated when request is sent>",
      "Authorization": "Bearer $token"
    });

    request.fields.addAll({
      'student':
          '{\n"addmissionNumber":68787,\n"addmissionDate":"${DateFormat('yyyy/MM/dd').format(DateTime.now())}",\n "firstName":"${_firstnamecontroller.text} ",\n"lastName":"${_lastnamecontroller.text}",\n"dateOfBirth":"${_dobcontroller.text}",\n"placeOfBirth":"ueruige3r",\n"priviousSchool":"${_schoolcontroller.text}",\n"email":"${_emailcontroller.text}",\n "phone":${int.parse(_phonecontroller.text)},\n    "address":"${_addresscontroller.text}",\n "state":"${_statecontroller.text}",\n "zipCode":${int.parse(_pincodecontroller.text)},\n "city":"${_citycontroller.text}",\n    "nearByCentre":"$_currentSelectedcenter",\n "siblings":$sib,\n "brOrSis":"$broorsis",\n  "siblingFullName":"${_siblingfullnamecontroller.text}",\n "sibAge":$sibage,\n   "sibStandard":"${_siblingstandardcontroller.text}",\n "sibSidNumber":6890,\n  "parentalStatus":"$_parentstatus",\n"parentFirstName":"${_gardianfirstnameontroller.text}",\n "parentLastName":"${_gardianlastnameontroller.text}",\n "parentEmail":"${_gardianemailcontroller.text}",\n "parentPhone":45432453,\n  "parentDateOfBirth":"2002/3/12",\n"parentPlaceOfBirth":"fueuifh",\n    "mediumOfinstruction":"efiefib",\n "parentAddress":"${_gardianaddresscontroller.text}",\n"parentState":"euiiue",\n "parentZipCode":7979,\n"parentCity":"neifgeigfi",\n "educationQualification":"${_gardianeducationcontroller.text}",\n    "occupation":"${_gardianocccupationcontroller.text}"\n}'
    });

    var streamResponse = await request.send();
    var response = await http.Response.fromStream(streamResponse);

    GlobalMethods().showLoader(context, false);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      _firstnamecontroller.text = "";
      _lastnamecontroller.text = "";

      _statecontroller.text = "";
      _citycontroller.text = "";
      _pincodecontroller.text = "";
      _siblingfullnamecontroller.text = "";
      _siblingagecontroller.text = "";
      _siblingstandardcontroller.text = "";
      _siblingschoolnamecontroller.text = "";

      _gardianfirstnameontroller.text = "";

      _gardianlastnameontroller.text = "";
      _gardianphonecontroller.text = "";
      _gardianemailcontroller.text = "";
      _gardianeducationcontroller.text = "";

      _gardianaddresscontroller.text = "";
      _gardianocccupationcontroller.text = "";

      _dobcontroller.text = "";
      _emailcontroller.text = "";
      _addresscontroller.text = "";
      _schoolcontroller.text = "";

      _adhaarcontroller.text = "";
      _phonecontroller.text = '';

      showToast("Post Uploaded Sucessfully");
    } else {
      showToast("Something Went Wrong");
    }
  }
}
