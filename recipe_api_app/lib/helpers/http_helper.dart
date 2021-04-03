import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/recipe_api_exception.dart';

class HttpHelper {
  static Future<dynamic> getRequest(String url) async {
    try {
      await http.get(url);

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

      return getResult;
    } catch (error) {
      print(error);
      throw RecipeAPIException(error.toString());
    }
  }
}
