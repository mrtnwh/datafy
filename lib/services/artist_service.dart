import 'dart:convert';
import 'package:datafy/services/token_bearer.dart';
import 'package:http/http.dart' as http;
import '../models/relatedArtist.dart';
import '../constants/constants.dart';

class Artists {
  Future<Artist> fetchArtist(String idArtist) async {
    String TOKEN = await obtenerToken();
    var url = 'api.spotify.com';
    var unencodedPath = '/v1/artists/$idArtist';
    var response = await http.get(Uri.https(url, unencodedPath),
        headers: {'Authorization': 'Bearer $TOKEN'});
    if (response.statusCode == 200) {
      return Artist.fromJson(json.decode(response.body));
    } else {
      if('${response.statusCode}' == '401' )
      enviarSolicitudPost();
      else
      print('status code:  ${response.statusCode}');
      //TODO: refrescar si es 401
      throw Exception('Failed to load the releases');
    }
  }
}
