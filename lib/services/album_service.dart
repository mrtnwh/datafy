import 'dart:convert';
import 'package:datafy/services/token_bearer.dart';
import 'package:http/http.dart' as http;
import '../models/album_tracks.dart';
import '../constants/constants.dart';

class AlbumTracks {
  Future<TracksAlbum> fetchAlbumTracks(idAlbum) async {
    String TOKEN = await obtenerToken();
    var url = 'api.spotify.com';
    var unencodedPath = 'v1/albums/$idAlbum/tracks';
    var response = await http.get(
        Uri.https(url, unencodedPath, {'market': 'ES', 'limit': '50'}),
        headers: {'Authorization': 'Bearer $TOKEN'});
    if (response.statusCode == 200) {
      return TracksAlbum.fromJson(json.decode(response.body));
    } else {
      if('${response.statusCode}' == '401' )
      enviarSolicitudPost();
      else
      print('status code:  ${response.statusCode}');
      throw Exception('Failed to load the releases');
    }
  }
}
