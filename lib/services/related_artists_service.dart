import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/relatedArtist.dart';
import '../constants/constants.dart';

class RelatedArtists {
  Future<RelatedArtist> fetchRelatedArtist(String idArtist) async {
    var url = 'api.spotify.com';
    var unencodedPath = '/v1/artists/$idArtist/related-artists';
    var response = await http.get(
        Uri.https(url, unencodedPath, {
          'market': 'ES',
          'limit': '5',
        }),
        headers: {'Authorization': 'Bearer $TOKEN'});
    if (response.statusCode == 200) {
      return RelatedArtist.fromJson(json.decode(response.body));
    } else {
      print('status code:  ${response.statusCode}');
      throw Exception('Failed to load the releases');
    }
  }
}
