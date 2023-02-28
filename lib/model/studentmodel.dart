class StudentModel {
  String? id;
  String? photo;
  String? zone;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? placeOfBirth;
  String? email;
  int? phone;
  String? address;
  String? state;
  int? pinCode;
  String? city;
  int? adharNumber;
  bool? siblingStuding;
  String? brOrSis;
  String? siblingFullName;
  int? sibAge;
  String? sibStandard;
  String? siblingSchool;
  String? parentalStatus;
  String? parentFirstName;
  String? parentLastName;
  int? parentPhone;
  String? parentOccupation;
  String? schoolName;
  String? parentEmail;
  String? centerName;

  StudentModel(
      {this.id,
      this.photo,
      this.zone,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.placeOfBirth,
      this.email,
      this.phone,
      this.address,
      this.state,
      this.pinCode,
      this.city,
      this.adharNumber,
      this.siblingStuding,
      this.brOrSis,
      this.siblingFullName,
      this.sibAge,
      this.sibStandard,
      this.siblingSchool,
      this.parentalStatus,
      this.parentFirstName,
      this.parentLastName,
      this.parentPhone,
      this.parentOccupation,
      this.schoolName,
      this.parentEmail,
      this.centerName});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    zone = json['zone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    placeOfBirth = json['placeOfBirth'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    state = json['state'];
    pinCode = json['pinCode'];
    city = json['city'];
    adharNumber = json['adharNumber'];
    siblingStuding = json['siblingStuding'];
    brOrSis = json['brOrSis'];
    siblingFullName = json['siblingFullName'];
    sibAge = json['sibAge'];
    sibStandard = json['sibStandard'];
    siblingSchool = json['siblingSchool'];
    parentalStatus = json['parentalStatus'];
    parentFirstName = json['parentFirstName'];
    parentLastName = json['parentLastName'];
    parentPhone = json['parentPhone'];
    parentOccupation = json['parentOccupation'];
    schoolName = json['schoolName'];
    parentEmail = json['parentEmail'];
    centerName = json['centerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['zone'] = this.zone;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['placeOfBirth'] = this.placeOfBirth;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['state'] = this.state;
    data['pinCode'] = this.pinCode;
    data['city'] = this.city;
    data['adharNumber'] = this.adharNumber;
    data['siblingStuding'] = this.siblingStuding;
    data['brOrSis'] = this.brOrSis;
    data['siblingFullName'] = this.siblingFullName;
    data['sibAge'] = this.sibAge;
    data['sibStandard'] = this.sibStandard;
    data['siblingSchool'] = this.siblingSchool;
    data['parentalStatus'] = this.parentalStatus;
    data['parentFirstName'] = this.parentFirstName;
    data['parentLastName'] = this.parentLastName;
    data['parentPhone'] = this.parentPhone;
    data['parentOccupation'] = this.parentOccupation;
    data['schoolName'] = this.schoolName;
    data['parentEmail'] = this.parentEmail;
    data['centerName'] = this.centerName;
    return data;
  }
}
