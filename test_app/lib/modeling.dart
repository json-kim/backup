import 'package:flutter/foundation.dart';

class Modeling {
  final String USE_DT;
  final String LINE_NUM;
  final int RIDE_PASGR_NUM;
  final int ALIGHT_PASGR_NUM;
  final String WORK_DT;

  Modeling(
      {@required this.USE_DT,
      @required this.LINE_NUM,
      @required this.RIDE_PASGR_NUM,
      @required this.ALIGHT_PASGR_NUM,
      @required this.WORK_DT});

  factory Modeling.toJson({@required Map<String, dynamic> json}) => Modeling(
      USE_DT: json['USE_DT'] as String,
      LINE_NUM: json['LINE_NUM'] as String,
      RIDE_PASGR_NUM: json['RIDE_PASGR_NUM'] as int,
      ALIGHT_PASGR_NUM: json['ALIGHT_PASGR_NUM'] as int,
      WORK_DT: json['WORK_DT'] as String);
}
