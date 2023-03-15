import 'package:flutter/material.dart';
import 'package:pokedex_mobile/models/extensions/captalize.dart';

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
        title: Text(arguments.name.capitalize()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Trazer dados de API + /nome:\npokeapi.co/api/v2/pokemon/${arguments.name}",
            ),
          ],
        ),
      ),
    );
  }
}
