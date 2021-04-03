import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/recipe.dart';

class CookingPhaseDetailScreen extends StatelessWidget {
  final CookingPhase cookingPhase;

  CookingPhaseDetailScreen(this.cookingPhase);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CachedNetworkImage(
                  width: 196,
                  height: 130,
                  imageUrl: cookingPhase.imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Container(
                      width: 196,
                      height: 130,
                      color: Colors.grey.withOpacity(0.2),
                      alignment: Alignment.center,
                      child: Text(
                        '(이미지가 없습니다.)',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    child: Text(
                      cookingPhase.info,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          height: 1.4,
                          wordSpacing: 1.2,
                          fontWeight: FontWeight.w600),
                      maxLines: null,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
