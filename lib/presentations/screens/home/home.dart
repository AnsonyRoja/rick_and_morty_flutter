import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/http/character.dart';

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Home extends StatefulWidget {
  String characterName = '';

  Home({super.key, characterName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController textController = TextEditingController();
  Map<String, dynamic> character = {};
  String selectedGenderFilter = 'Male'; // Valor predeterminado
  bool isAlphabeticalOrder = false;
  var dropdownValue = list.first;

  // @override
  // void didUpdateWidget(covariant Home oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   print('hubo un cambio');
  //   // Aquí puedes manejar los cambios en las propiedades del widget
  //   if (widget.characterName != oldWidget.characterName) {
  //     print("El widget se actualizó");
  //   }
  // }

  void getChar() async {
    var characters = await getCharacters();
    setState(() {
      character = characters;
    });
    print(character);
  }

  @override
  void initState() {
    getChar();
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   print('me desmonte');
  // }

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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(
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
                                characters = await getCharactersName(
                                    textController.text);
                                textController.clear();
                                setState(() {
                                  character = characters;
                                  widget.characterName =
                                      characters['Api'][0]['name'];
                                });
                                print("esto es los personajes $character");
                                print("name  $widget.characterName");
                              },
                              backgroundColor: Colors.blue,
                              child: const Icon(Icons.search_off_rounded),
                            ),
                          ),
                        ],
                      ),

                      DropdownButton(
                        value: dropdownValue,
                        onChanged: (String? value) {
                          print('value $value');
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                            print('esto es dropdownvalue $dropdownValue');
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),

                      //filtros aqui
                      if (character.isNotEmpty)
                        ...character['Api'].map((char) {
                          return Center(
                            child: Card(
                              margin: const EdgeInsets.all(5),
                              color: Color.fromARGB(255, 18, 188, 151),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      char['name'].toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Image.network(
                                    char['image'].toString(),
                                    width: 250,
                                    height:
                                        200, // Ajusta la altura de la imagen según tus necesidades
                                    fit: BoxFit
                                        .cover, // Ajusta la forma en que la imagen se ajusta dentro del contenedor
                                  ),
                                  ListTile(
                                    title: Text('Status: ${char['status']}'),
                                  ),
                                  ListTile(
                                    title: Text('Species: ${char['species']}'),
                                  ),
                                  ListTile(
                                    title: Text('Gender: ${char['gender']}'),
                                  ),
                                  ListTile(
                                    title: Text(
                                        'Origin: ${char['origin']['name']}'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
