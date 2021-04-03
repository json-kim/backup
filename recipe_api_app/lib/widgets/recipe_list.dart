import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../model/recipe.dart';
import '../provider/recipes.dart';
import '../widgets/recipe_card.dart';

class RecipeList extends StatelessWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  Future getRecipeData(BuildContext context) async {
    try {
      List<Recipe> recipeData =
          await Provider.of<Recipes>(context, listen: false)
              .getRecipeData(getMode.Refresh);
      return recipeData;
    } catch (error) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () async {
          await Provider.of<Recipes>(context, listen: false)
              .getRecipeData(getMode.Refresh);
          _refreshController.refreshCompleted();
        },
        onLoading: () async {
          await Provider.of<Recipes>(context, listen: false)
              .getRecipeData(getMode.Load);
          _refreshController.loadComplete();
        },
        footer: CustomFooter(builder: (context, mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = InkWell(
                onTap: () {
                  _refreshController.requestLoading();
                },
                child: Container(height: 30, child: Text('더 보기')));
          } else if (mode == LoadStatus.loading) {
            body = CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text('실패 다시 시도하세요');
          } else if (mode == LoadStatus.canLoading) {
            body = Text('더 보기');
          } else {
            body = Text('더 이상 없습니다.');
          }

          return Container(
            height: 55,
            child: Center(child: body),
          );
        }),
        child: ListView.builder(
          itemCount: Provider.of<Recipes>(context).recipes.length,
          itemBuilder: (ctx, idx) {
            return RecipeCard(
              recipe: Provider.of<Recipes>(context).recipes[idx],
            );
          },
        ));
  }
}

// FutureBuilder(
//                 future: Provider.of<Recipes>(context, listen: false)
//                     .getRecipeData(),
//                 builder: (ctx, recipeSnapshot) {
//                   if (recipeSnapshot.connectionState ==
//                       ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }

//                   final recipes = recipeSnapshot.data as List<Recipe>;

//                   return Expanded(
//                     child: ListView.builder(
//                         itemCount: recipes.length,
//                         itemBuilder: (ctx, idx) {
//                           return ListTile(
//                             title: Text(recipes[idx].title),
//                             subtitle: Text(recipes[idx].ingredient),
//                             leading: CircleAvatar(
//                               backgroundImage:
//                                   NetworkImage(recipes[idx].imageUrl_s),
//                             ),
//                             onTap: () {
//                               Navigator.of(context).pushNamed(
//                                   RecipeDetailScreen.routeName,
//                                   arguments: recipes[idx]);
//                             },
//                           );
//                         }),
//                   );
//                 });
