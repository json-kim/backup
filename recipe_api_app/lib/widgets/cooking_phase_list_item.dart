import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/recipe.dart';
import '../screens/cooking_phase_tab_screen.dart';

class CookingPhaseListItem extends StatelessWidget {
  final CookingPhase cookingPhase;
  final Function navigateTabScreen;
  final index;
  final Key key;

  CookingPhaseListItem(
      this.cookingPhase, this.navigateTabScreen, this.index, this.key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTabScreen(index);
      },
      child: Container(
        width: double.infinity,
        child: Container(
          height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 100,
                child: cookingPhase.imageUrl == ''
                    ? null
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: cookingPhase.imageUrl,
                          fit: BoxFit.fitWidth,
                          width: 100,
                        ),
                      ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  cookingPhase.info,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
