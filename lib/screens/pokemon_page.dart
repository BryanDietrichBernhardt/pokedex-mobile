import 'package:flutter/material.dart';

class PokemonPageArgs {
  final String name;

  PokemonPageArgs(this.name);
}

class PokemonPage extends StatefulWidget {
  static const routeName = "pokemon";

  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as PokemonPageArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.name),
      ),
      body: Column(
        children: [
          Text(arguments.name),
        ],
      ),
    );
  }
}
