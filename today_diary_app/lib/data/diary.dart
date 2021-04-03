import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/date_helper.dart';

class Diary {
  String text;
  DateTime dateTime;
  int color;
  String imageUrl;

  Diary({this.text, this.dateTime, this.color, this.imageUrl});

  String get key => DateHelper.dateToString(this.dateTime);

  void changeData(
      {String text, DateTime dateTime, int color, String imageUrl}) {
    if (text != null) this.text = text;
    if (dateTime != null) this.dateTime = dateTime;
    if (color != null) this.color = color;
    if (imageUrl != null) this.imageUrl = imageUrl;
  }

  factory Diary.fromJson(Map<String, dynamic> json) {
    return Diary(
      text: json['text'] as String,
      color: json['color'] as int,
      dateTime: DateTime.parse(json['dateTime']),
      imageUrl: json['imageUrl'] as String,
    );
  }

  factory Diary.fromDoc(QueryDocumentSnapshot doc) {
    var data = doc.data();
    return Diary(
      text: data['text'] as String,
      color: data['color'] as int,
      dateTime: DateTime.parse(data['dateTime']),
      imageUrl: data['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.key,
        'year': this.dateTime.year,
        'month': this.dateTime.month,
        'day': this.dateTime.day,
        'feel': this.color,
        'message': this.text,
      };

  @override
  String toString() {
    return "${dateTime.toString()} $text $color";
  }
}
