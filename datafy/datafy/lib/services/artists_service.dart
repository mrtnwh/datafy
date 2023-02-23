import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/artist.dart';
import '../constants/constants.dart';



class SearchArtists{
  final id = '6olE6TJLqED3rqDCT0FyPh';


    Future<SearchArtist> fetchSearchArtist(String nameArtist) async {
      var url = 'api.spotify.com';
      var unencodedPath = 'v1/search';
      var response = await http.get(Uri.https(url,unencodedPath,{
     'q': '$nameArtist',
     'type': 'artist',
     'market': 'ES',
     'limit': '5',
    }), headers: {
        'Authorization':'Bearer ${TOKEN}'
      });
      if(response.statusCode == 200){
        print(response.body);
        return SearchArtist.fromJson(json.decode(response.body));
      }else{
          print('status code:  ${response.statusCode}');
          throw Exception('Failed to load the releases');
      }
}
}