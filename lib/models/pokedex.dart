class Pokemons {
  List pokemons = [];

  Pokemons(this.pokemons);
}

class Pokemon {
  final String name;
  final String url;

  Pokemon(this.name, this.url);

  factory Pokemon.fromJson(Map json) {
    return Pokemon(json['name'], json['url']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
