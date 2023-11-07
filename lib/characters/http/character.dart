
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


Future <Map<String, dynamic>> getCharacters() async {

//Espera dos argumentos el primero es el dominio host, y el segundo es la ruta del recurso en ese dominio

var url = Uri.https('rickandmortyapi.com', '/api/character');

  var response = await http.get(url);


        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

        var itemCount = jsonResponse['results'];

  return {'Api':itemCount};


}











