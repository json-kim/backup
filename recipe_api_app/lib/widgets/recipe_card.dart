import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/recipe.dart';
import '../constants.dart';
import '../screens/recipe_detail_screen.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    @required this.recipe,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 136,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: dlightColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 27,
                      color: Colors.black12),
                ]),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(22)),
            ),
          ),
          Positioned(
              top: 15,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                height: 120,
                width: 160,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: CachedNetworkImage(
                    imageUrl: recipe.imageUrl_s,
                    width: 60,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 130,
              width: size.width - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: defaultPadding + 10,
                        right: defaultPadding,
                        top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            recipe.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FittedBox(
                          child: Text(
                            '${recipe.cookMethod} / ${recipe.category} / ${recipe.calories}Kcal',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Navigator..
                      Navigator.of(context).pushNamed(
                          RecipeDetailScreen.routeName,
                          arguments: recipe);
                    },
                    child: Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: dButtonColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22),
                            topRight: Radius.circular(22)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Go',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
