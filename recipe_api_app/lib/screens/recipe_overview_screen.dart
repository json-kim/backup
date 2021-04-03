import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/search_box.dart';
import '../widgets/category_bar.dart';
import '../widgets/recipe_list.dart';

class RecipeOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: dBackroudColor,
        appBar: AppBar(
          backgroundColor: dBackroudColor,
          elevation: 0,
          title: Text('요리 레시피'),
          actions: <Widget>[
            IconButton(
                iconSize: 18,
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: Column(
          children: <Widget>[
            SearchBox(),
            CategoryBar(),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Expanded(
                child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 80,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(90),
                            topRight: Radius.circular(90)),
                        color: Colors.white),
                  ),
                ),
                RecipeList(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
