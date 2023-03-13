import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tracks.dart';
import '../constants/constants.dart';



class Tracks{
  Map<String, String> queryParameters = {
     'market': 'ES',
     'limit': '5',
    };

    Future<TracksReleased> fetchLastReleases(String id) async {
      var url = 'api.spotify.com';
      var unencodedPath = 'v1/artists/${id}/albums';
      var response = await http.get(Uri.https(url,unencodedPath,queryParameters), headers: {
        'Authorization':'Bearer ${TOKEN}'
      });
      if(response.statusCode == 200){
        return TracksReleased.fromJson(json.decode(response.body));
      }else{
          print('status code:  ${response.statusCode}');
          throw Exception('Failed to load the releases');
      }
}
}