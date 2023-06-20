import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:superhero_flutter/data/model/hero.dart';

class HeroService {
 
  final String _searchHeroUrl =
      'https://www.superheroapi.com/api.php/10157703717092094/search/';

  Future<List?> searchHeros(String name) async {
    final result = await http.get(Uri.parse(_searchHeroUrl + name));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      final maps = jsonResponse['results'];
      return maps.map((map) => Hero.fromJson(map)).toList();
    } else {
      return null;
    }
  }
}
