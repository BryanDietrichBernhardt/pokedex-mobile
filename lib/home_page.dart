import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "PodeDex Mobile",
                style: TextStyle(
                    fontFamily: 'Pokemon Solid',
                    fontSize: 42,
                    color: Colors.red),
              ),
              Image.asset("assets/images/pokedex-icon-28.jpg"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'pokemons');
                },
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Acessar",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
