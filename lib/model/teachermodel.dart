class TeacherModel {
  int? id;
  String? photo;
  String? firstName;
  String? lastName;
  String? email;
  int? phone;
  String? address;
  String? dateOfBirth;
  String? placeOfBirth;
  int? adharNumber;
  String? university;
  String? degree;
  String? startDate;
  String? endDate;
  String? city;

  TeacherModel(
      {this.id,
        this.photo,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.address,
        this.dateOfBirth,
        this.placeOfBirth,
        this.adharNumber,
        this.university,
        this.degree,
        this.startDate,
        this.endDate,
        this.city});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    placeOfBirth = json['placeOfBirth'];
    adharNumber = json['adharNumber'];
    university = json['university'];
    degree = json['degree'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['dateOfBirth'] = this.dateOfBirth;
    data['placeOfBirth'] = this.placeOfBirth;
    data['adharNumber'] = this.adharNumber;
    data['university'] = this.university;
    data['degree'] = this.degree;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['city'] = this.city;
    return data;
  }
}