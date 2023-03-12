import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/pokedex.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  @override
  Widget build(BuildContext context) {
    List<String> pokemonsNames = [];

    Uri uri = Uri.https(
        'pokeapi.co', '/api/v2/pokemon', {'limit': '150', 'offset': '0'});
    final request = http.get(uri);
    request.then(
      (response) {
        if (response.statusCode == 200) {
          Map<String, dynamic> data = json.decode(response.body);

          Pokemons pokemonsList = Pokemons(data['results']);
          pokemonsList.pokemons.forEach((element) {
            Pokemon pokemon = Pokemon.fromJson(element);
            print(pokemon.name);
            pokemonsNames.add(pokemon.name);
          });
        } else {
          print('Error.');
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemons"),
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Pokemon"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
