import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/http/character.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick And Morty'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                     TextField(
                      controller: textController,
                      decoration: const InputDecoration(filled: true),
                      cursorRadius: const Radius.circular(35),
                      
                    ),
                    Positioned(
                      right: 5,
                      bottom: 6,
                      width: 30,
                      height: 30,
                      child: FloatingActionButton(
                        onPressed: () async {
                            var characters;
                            print(textController.text);
                            characters = await getCharacters();
                            textController.clear();
                            print(characters);
  

                        },
                        backgroundColor: Colors.blue,
                        child: const Icon(Icons
                            .search_off_rounded), // Puedes personalizar el icono del botón
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
