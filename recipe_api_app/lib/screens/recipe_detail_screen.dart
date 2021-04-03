import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/recipe.dart';
import '../widgets/cooking_phase_list_item.dart';
import '../widgets/star_rating_bar.dart';
import '../screens/cooking_phase_tab_screen.dart';

class RecipeDetailScreen extends StatefulWidget {
  static const routeName = '/recipe-detail';

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool _isFavorite = false;
  bool lastStatus = true;
  ScrollController _scrollController;

  bool get isShrink {
    final height = MediaQuery.of(context).size.width * 3 / 4 + 10;
    final toolBarHeight = AppBar().preferredSize.height;
    return _scrollController.hasClients &&
        _scrollController.offset > (height - toolBarHeight - 10);
  }

  void _scrollListener() {
    // 슬리버 앱바 상태(줄어듬, 늘어남)가 변했을 때 setState를 실행시키기 위해
    if (lastStatus != isShrink) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height - MediaQuery.of(context).padding.top;

    final _recipe = ModalRoute.of(context).settings.arguments as Recipe;

    void navigateTapScreen(int currentIdx) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) =>
              CookingPhaseTabScreen(_recipe.cookingProcess, currentIdx)));
    }

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            // 슬리버 앱바 (이미지 >> 앱바)
            SliverAppBar(
              expandedHeight: size.width * 3 / 4 + 10,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    isShrink ? null : EdgeInsets.only(bottom: 20, left: 30),
                title: Text(
                  _recipe.title,
                  style: TextStyle(
                      color: isShrink ? Colors.black : Colors.white,
                      fontSize: 16),
                  softWrap: true,
                ),
                background: Stack(
                  children: <Widget>[
                    Container(height: height),
                    Container(
                      width: size.width,
                      height: size.width * 3 / 4 + 10,
                      child: CachedNetworkImage(
                        imageUrl: _recipe.imageUrl_b,
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.dstIn,
                      shaderCallback: (rect) {
                        return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.1),
                              Colors.black
                            ]).createShader(Rect.fromLTRB(
                            0, rect.height / 2, rect.width, rect.height));
                      },
                      child: Container(
                        width: size.width,
                        height: size.width * 3 / 4 + 10,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 24,
                  color: isShrink ? Colors.black : Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      _isFavorite ? Icons.bookmark : Icons.bookmark_border,
                      color: isShrink ? Colors.black : Colors.white,
                    ),
                    iconSize: 24,
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    })
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              // 평점 정보
              StarRatingBar(),
              // 레시피 재료 정보
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '재료 정보',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      _recipe.ingredient,
                      style:
                          TextStyle(fontSize: 16, wordSpacing: 1, height: 1.4),
                    ),
                  ],
                ),
              ),
              // 레시피 요리 과정 리스트
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: _recipe.cookingProcess.length * 100.0 + 10,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _recipe.cookingProcess.length,
                    itemBuilder: (ctx, idx) {
                      return CookingPhaseListItem(
                        _recipe.cookingProcess[idx],
                        navigateTapScreen,
                        idx,
                        ValueKey(_recipe.serialNum + idx),
                      );
                    }),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
