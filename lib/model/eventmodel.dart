class Eventsmodel {
  int? id;
  String? title;
  String? selectTime;
  int? selectDate;
  String? description;

  Eventsmodel(
      {this.id,
        this.title,
        this.selectTime,
        this.selectDate,
        this.description});

  Eventsmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    selectTime = json['selectTime'];
    selectDate = json['selectDate'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['selectTime'] = this.selectTime;
    data['selectDate'] = this.selectDate;
    data['description'] = this.description;
    return data;
  }
}