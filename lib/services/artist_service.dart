import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/relatedArtist.dart';
import '../constants/constants.dart';

class Artists {
  Future<Artist> fetchArtist(String idArtist) async {
    var url = 'api.spotify.com';
    var unencodedPath = '/v1/artists/${idArtist}';
    var response = await http.get(Uri.https(url, unencodedPath),
        headers: {'Authorization': 'Bearer ${TOKEN}'});
    if (response.statusCode == 200) {
      return Artist.fromJson(json.decode(response.body));
    } else {
      print('status code:  ${response.statusCode}');
      throw Exception('Failed to load the releases');
    }
  }
}
