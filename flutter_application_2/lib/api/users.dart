import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchUsers() async {

  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

  if(response.statusCode == 200){
    return jsonDecode(response.body);
  }
  throw Exception('Error al cargar usuarios');
}

Future<dynamic> fetchUsario(String id) async {

  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/"+id));

  if(response.statusCode == 200){
    return jsonDecode(response.body);
  }
  throw Exception('Error al cargar usuarios');
}

 