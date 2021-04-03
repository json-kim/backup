import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import './constants.dart';
import './provider/recipes.dart';
import './screens/recipe_overview_screen.dart';
import './screens/recipe_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Recipes(),
      child: MaterialApp(
        title: 'recipe_API_app',
        theme: ThemeData(
          textTheme: GoogleFonts.nanumMyeongjoTextTheme(
              Theme.of(context).textTheme.apply(
                    bodyColor: Colors.black,
                    decorationColor: Colors.black,
                    displayColor: Colors.black,
                  )),
          accentTextTheme: GoogleFonts.nanumMyeongjoTextTheme(
              Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                    decorationColor: Colors.white,
                    displayColor: Colors.white,
                  )),
          primaryTextTheme: GoogleFonts.nanumMyeongjoTextTheme(
              Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                    decorationColor: Colors.white,
                    displayColor: Colors.white,
                  )),
          primaryColor: dPrimaryColor,
          accentColor: dPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: RecipeOverviewScreen(),
        routes: {
          RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen(),
        },
      ),
    );
  }
}
