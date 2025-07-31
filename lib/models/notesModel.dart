import 'dart:math';

class notesModel {
  String? id;
  String? title;
  String? message;
  int? color;
  DateTime? createdAt;
  DateTime? updatedAt;

  notesModel(
      {required this.id,
      required this.title,
      required this.message,
      this.color,
      required this.createdAt,
      required this.updatedAt});

  notesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['color'] = this.color;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

int generateRandomColor(){
  Random random = new Random();
  int red=200 + random.nextInt(56);
  int green=200 + random.nextInt(56);
  int blue=200 + random.nextInt(56);

  return (0xFF <<24) | (red <<16) | (green <<8) | blue;
}