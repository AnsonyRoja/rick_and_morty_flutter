import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const TextField(
                      cursorRadius: Radius.circular(10),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 6,
                      width: 30,
                      height: 30,
                      child: FloatingActionButton(
                        onPressed: () {
                          // Lógica para el botón flotante
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
