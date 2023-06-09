import 'dart:convert';
import 'package:datafy/services/token_bearer.dart';
import 'package:http/http.dart' as http;
import '../models/tracks.dart';
import '../constants/constants.dart';

class Tracks {
  Map<String, String> queryParameters = {
    'market': 'ES',
    'limit': '5',
  };

  Future<TracksReleased> fetchLastReleases(String id) async {
    String TOKEN = await obtenerToken();
    var url = 'api.spotify.com';
    var unencodedPath = 'v1/artists/$id/albums';
    var response = await http.get(
        Uri.https(url, unencodedPath, queryParameters),
        headers: {'Authorization': 'Bearer $TOKEN'});
    if (response.statusCode == 200) {
      return TracksReleased.fromJson(json.decode(response.body));
    } else {
      if('${response.statusCode}' == '401' )
      enviarSolicitudPost();
      else
      print('status code:  ${response.statusCode}');
      throw Exception('Failed to load the releases');
    }
  }
}
