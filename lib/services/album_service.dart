import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album_tracks.dart';
import '../constants/constants.dart';



class AlbumTracks{
      Future<TracksAlbum> fetchAlbumTracks() async {
      var id = '5eA0qtE7Yu29XiMlwoby2G';
      var url = 'api.spotify.com';
      var unencodedPath = 'v1/albums/${id}/tracks';
      var response = await http.get(Uri.https(url,unencodedPath,{
     'market': 'ES',
     'limit':'13'
    }), headers: {
        'Authorization':'Bearer ${TOKEN}'
      });
      if(response.statusCode == 200){
        return TracksAlbum.fromJson(json.decode(response.body));
      }else{
          print('status code:  ${response.statusCode}');
          throw Exception('Failed to load the releases');
      }
}
}