import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_mobile/screens/pokemon_page.dart';
import 'dart:convert';
import '../models/pokedex.dart';

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
      print(pokemon.name);
      pokemonsNames.add(pokemon.name);
    }
  } else {
    print('Error.');
  }
  return pokemonsNames;
}

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemons"),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getPokemons(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<dynamic>? pokemons = snapshot.data;

          return pokemons != null && pokemons.isNotEmpty
              ? ListView.builder(
                  itemCount: pokemons.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          _,
                          'pokemon',
                          arguments: PokemonPageArgs(pokemons[i], pokemons[i]),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(pokemons[i]),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("Sem dados..."),
                );
        },
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    String search = '';

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: _controller,
            onChanged: (value) {
              search = value;
            },
            decoration: InputDecoration(
              hintText: 'Buscar...',
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    search = '';
                    _controller.clear();
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
