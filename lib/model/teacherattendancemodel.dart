class TeacherAttendanceModel {
  int? id;
  String? teacherId;
  String? teacherName;
  List<int>? date;
  List<int>? checkin;
  List<int>? checkOut;
  int? workingHours;

  TeacherAttendanceModel(
      {this.id,
      this.teacherId,
      this.teacherName,
      this.date,
      this.checkin,
      this.checkOut,
      this.workingHours});

  TeacherAttendanceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacherId'];
    teacherName = json['teacherName'];
    date = json['date'].cast<int>();
    checkin = json['checkin'].cast<int>();
    checkOut = json['checkOut'].cast<int>();
    workingHours = json['workingHours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacherId'] = this.teacherId;
    data['teacherName'] = this.teacherName;
    data['date'] = this.date;
    data['checkin'] = this.checkin;
    data['checkOut'] = this.checkOut;
    data['workingHours'] = this.workingHours;
    return data;
  }
}
