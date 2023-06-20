import 'package:flutter/material.dart';
import '../data/remote/hero_service.dart';

class SearchHeros extends StatefulWidget {
  const SearchHeros({super.key});

  @override
  State<SearchHeros> createState() => _SearchHerosState();
}

class _SearchHerosState extends State<SearchHeros> {
  final _heroService = HeroService();
  List _heros = List.empty();
  final _controller = TextEditingController();

  loadHeros() async {
    if (_controller.text.isNotEmpty) {
      final result = await _heroService.searchHeros(_controller.text);
      setState(() {
        _heros = result!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SuperHero'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          OutlinedButton(
            onPressed: () {
              loadHeros();
            },
            child: const Text('Search'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _heros.length,
              itemBuilder: (context, index) {
                final hero = _heros[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(hero.poster),
                    title: Text(hero.name),
                    subtitle: Text(hero.fullName),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.favorite,
                      ),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
