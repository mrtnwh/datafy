import 'dart:convert';

import 'package:http/http.dart' as http;



  Future<String> enviarSolicitudPost() async {
    var url = Uri.parse('https://accounts.spotify.com/api/token');

    var response = await http.post(url, body: {
      'grant_type': 'client_credentials',
      'client_id': '36f84c4388d241afa8cb4861cef58165',
      'client_secret': '129274c5773d40088c564104aab1d9e7'
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var resultado = jsonResponse['access_token'];
      print('Response status: ${response.statusCode}');
      return resultado;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

