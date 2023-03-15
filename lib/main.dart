import 'package:flutter/material.dart';
import 'package:pokedex_mobile/screens/pokemon_page.dart';
import 'screens/home_page.dart';
import 'screens/pokemons_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex Mobile',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: "Pokedex Mobile"),
        'pokemons': (context) => PokemonsPage(),
        PokemonPage.routeName: (context) => PokemonPage(),
      },
    );
  }
}
