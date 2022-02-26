import 'package:http/http.dart';

const String apiKey = '203109b6581a2e4a668f2d41fc02b6f3';
const String apiId = 'ac2a9564';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {
  Future getData(String url) async {
    print('calling url:$url');
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&query=$query&from=$from&to=$to');
    return recipeData;
  }
}
