import 'package:flutter/foundation.dart';

class Recipe {
  final int serialNum; // 일련번호
  final String title; // 요리 명
  final String category; // 요리 종류
  final String cookMethod; // 요리 방법
  final double calories; // 열량
  final double carbohydrate; // 탄수화물
  final double protein; // 단백질
  final double fat; // 지방
  final double sodium; // 나트륨
  String hashTag; // 해쉬태그
  final String imageUrl_s; // 이미지 (소)
  final String imageUrl_b; // 이미지 (대)
  final String ingredient; // 재료
  final List<CookingPhase> cookingProcess;

  Recipe({
    @required this.serialNum,
    @required this.title,
    @required this.category,
    @required this.cookMethod,
    @required this.calories,
    @required this.carbohydrate,
    @required this.protein,
    @required this.fat,
    @required this.sodium,
    this.hashTag,
    @required this.imageUrl_s,
    @required this.imageUrl_b,
    @required this.ingredient,
    @required this.cookingProcess,
  });
}

class CookingPhase {
  final String info;
  final String imageUrl;

  CookingPhase({@required this.info, @required this.imageUrl});
}
