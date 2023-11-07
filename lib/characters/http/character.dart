
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


Future <Map<String, dynamic>> getCharacters() async {


var url = Uri.https('rickandmortyapi.com', '/api/character');

  var response = await http.get(url);


        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

        var itemCount = jsonResponse['results'];

  return {'Api':itemCount};


}











