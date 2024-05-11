class PlanModel {
  String? image;
  String? name;
  String? days;
  String? details;
  List<String>? schedule;

  PlanModel(this.image, this.name, this.days);

  PlanModel.fromJson(Map<String, dynamic>? json) {
    image = json!['image'];
    name = json['name'];
    days = json['days'];
    details = json['details'];
    schedule = List.generate(json['schedule'].length, (index) => json['schedule'][index]);
  }
}
