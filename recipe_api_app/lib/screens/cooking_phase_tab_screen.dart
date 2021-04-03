import 'package:flutter/material.dart';

import '../model/recipe.dart';
import '../screens/cooking_phase_detail_screen.dart';

class CookingPhaseTabScreen extends StatefulWidget {
  final List<CookingPhase> cookingPhases;
  final int currentIdx;

  CookingPhaseTabScreen(this.cookingPhases, this.currentIdx);

  @override
  _CookingPhaseTabScreenState createState() => _CookingPhaseTabScreenState();
}

class _CookingPhaseTabScreenState extends State<CookingPhaseTabScreen> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.currentIdx);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.black26,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              children: <Widget>[
                ...widget.cookingPhases
                    .map((phase) => CookingPhaseDetailScreen(phase))
                    .toList()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
