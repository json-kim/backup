import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../model/recipe_api_exception.dart';
import '../model/recipe.dart';

enum getMode {
  Refresh,
  Load,
}

class Recipes with ChangeNotifier {
  List<Recipe> _recipes = [];
  var currentIndex = 0;

  List<Recipe> get recipes {
    return [..._recipes];
  }

  void removeAll() {
    _recipes = [];
    notifyListeners();
  }

  Future<List<Recipe>> getRecipeData(getMode mode) async {
    var url;
    if (mode == getMode.Refresh) {
      removeAll();
      url =
          'http://openapi.foodsafetykorea.go.kr/api/84a51e2a588746a2b064/COOKRCP01/json/1/${10 * (currentIndex + 1)}';
    } else {
      currentIndex += 1;
      url =
          'http://openapi.foodsafetykorea.go.kr/api/84a51e2a588746a2b064/COOKRCP01/json/${10 * currentIndex + 1}/${10 * (currentIndex + 1)}';
    }

    try {
      final respond = await http.get(url);
      print('after get');
      final getResult = json.decode(respond.body);
      // print(json.decode(respond.body)['COOKRCP01']['RESULT']);
      // print(json.decode(respond.body)['COOKRCP01']['total_count']);
      print('1 + ${getResult['COOKRCP01']['RESULT']['CODE']}');
      if (getResult['COOKRCP01']['RESULT']['CODE'] != 'INFO-000') {
        print('2 + ${getResult['COOKRCP01']['RESULT']['CODE'] != 'INFO-000'}');
        throw RecipeAPIException(getResult['COOKRCP01']['RESULT']['MSG']);
      }

      final recipesData = getResult['COOKRCP01']['row'] as List<dynamic>;
      recipesData.forEach((recipeItem) {
        int i = 0;
        List<CookingPhase> cookingProcess = [];

        while (recipeItem['MANUAL${NumberFormat('00').format(i + 1)}'] != '') {
          CookingPhase cookingPhase = CookingPhase(
              info: recipeItem['MANUAL${NumberFormat('00').format(i + 1)}'],
              imageUrl:
                  recipeItem['MANUAL_IMG${NumberFormat('00').format(i + 1)}']);

          cookingProcess.add(cookingPhase);

          i++;
        }

        //print(cookingProcess.length);
        final recipe = Recipe(
            serialNum: int.parse(recipeItem['RCP_SEQ']),
            title: recipeItem['RCP_NM'],
            category: recipeItem['RCP_PAT2'],
            cookMethod: recipeItem['RCP_WAY2'],
            calories: double.parse(recipeItem['INFO_ENG']),
            carbohydrate: double.parse(recipeItem['INFO_CAR']),
            protein: double.parse(recipeItem['INFO_PRO']),
            fat: double.parse(recipeItem['INFO_FAT']),
            sodium: double.parse(recipeItem['INFO_NA']),
            imageUrl_s: recipeItem['ATT_FILE_NO_MAIN'],
            imageUrl_b: recipeItem['ATT_FILE_NO_MK'],
            ingredient: recipeItem['RCP_PARTS_DTLS'],
            cookingProcess: cookingProcess);

        _recipes.add(recipe);
      });
    } catch (error) {
      print(error);
      throw RecipeAPIException(error.toString());
    }

    notifyListeners();
    return [..._recipes];
  }
}
