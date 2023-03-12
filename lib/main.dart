import 'package:flutter/material.dart';
import 'home_page.dart';
import 'pokemons_page.dart';

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
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: "Pokedex Mobile"),
        'pokemons': (context) => PokemonsPage(),
      },
    );
  }
}
