import 'package:datafy/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

import '../models/album_tracks.dart';
import '../services/album_service.dart';

class AlbumSongs extends StatelessWidget{
  AlbumSongs(this.idAlbum,this.imageAlbum, this.nameAlbum, {super.key});
    String idAlbum, imageAlbum, nameAlbum;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: const DrawerMenu(),
      body: TextFuture(idAlbum, imageAlbum, nameAlbum),
    );
  }
}

class TextFuture extends StatelessWidget{
  late Future<TracksAlbum> futureTracksAlbum;
  TextFuture(this.idAlbum, this.imageAlbum, this.nameAlbum,{super.key}) : futureTracksAlbum = AlbumTracks().fetchAlbumTracks(idAlbum);
  String idAlbum, imageAlbum, nameAlbum;
  
  final Future<Map<String, String>> _calculation =
      Future<Map<String, String>>.delayed(
    const Duration(seconds: 2),
    () => {'title': 'Data Loaded'},
  );

    @override
Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;
   return DefaultTextStyle(
    style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<TracksAlbum>(
        future: futureTracksAlbum, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<TracksAlbum> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
        Column(
        children: [
          Row(children: [
            Container(height:size.height*0.24, width: size.width*1,
          child: 
          Image.network('${imageAlbum}', fit: BoxFit.fitWidth, color: Colors.grey.withOpacity(0.87),colorBlendMode: BlendMode.modulate),
          )],
          ),
          SizedBox(height: 20,),
          Text('${nameAlbum}',style: TextStyle(),),
          ListTile()
             ] )
            ];
  }
  else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
  return Scaffold(appBar: AppBar(title: Text('${nameAlbum}',style:(TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25))),),
            body:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ));

}
      )
   );
   }
  }