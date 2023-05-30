import 'dart:convert';
import 'package:datafy/models/top_tracks.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';

class TopTracksArtist {
  Future<TopTracks> fetchTopTracks(String idArtist) async {
    var url = 'api.spotify.com';
    var unencodedPath = '/v1/artists/$idArtist/top-tracks';
    var response = await http.get(
        Uri.https(url, unencodedPath, {'market': 'ES'}),
        headers: {'Authorization': 'Bearer $TOKEN'});
    if (response.statusCode == 200) {
      return TopTracks.fromJson(json.decode(response.body));
    } else {
      print('status code:  ${response.statusCode}');
      throw Exception('Failed to load the releases');
    }
  }
}
