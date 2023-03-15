import 'package:pokedex_mobile/models/pokedex.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getPokemons() async {
  Uri uri = Uri.https(
      'pokeapi.co', '/api/v2/pokemon', {'limit': '20', 'offset': '0'});
  List<String> pokemonsNames = [];
  final response = await http.get(uri);
  Map<String, dynamic> data = json.decode(response.body);

  if (response.statusCode == 200) {
    Pokemons pokemonsList = Pokemons(data['results']);
    for (var element in pokemonsList.pokemons) {
      Pokemon pokemon = Pokemon.fromJson(element);
      pokemonsNames.add(pokemon.name);
    }
  }
  return pokemonsNames;
}
