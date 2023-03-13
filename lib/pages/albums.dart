import 'package:auto_size_text/auto_size_text.dart';
import 'package:datafy/pages/album.dart';
import 'package:flutter/material.dart';
import '../models/tracks.dart';
import '../services/tracks_service.dart';
import '../widgets/drawer_menu.dart';


class ScreenAlbums extends StatelessWidget {
  ScreenAlbums(this.id, this.imageToPass,{super.key});
  String id;
  String imageToPass;
  String? idAlbum;
  String? imageAlbum;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        body: TextFuture(id, imageToPass, idAlbum, imageAlbum));
  }
}

class TextFuture extends StatelessWidget {
  late Future<TracksReleased> futureTracks;
  TextFuture(this.id, this.imageToPass, this.idAlbum, this.imageAlbum, {super.key}) : futureTracks = Tracks().fetchLastReleases(id);
  String id;
  String imageToPass;
  String? idAlbum;
  String? imageAlbum;

  

  


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
      child: FutureBuilder<TracksReleased>(
        future: futureTracks, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<TracksReleased> snapshot) {
          var idAlbum = '${snapshot.data?.items[0].id}';
          var imageAlbum = '${snapshot.data?.items[0].images[0].url}';
          print('id album 1 ${idAlbum}');
          print('image album 1 ${imageAlbum}');
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
        Column(
        children: [
          Row(children: [
            Container(height:size.height*0.24, width: size.width*1,
          child: 
          Image.network('${imageToPass}', fit: BoxFit.fitWidth, color: Colors.grey.withOpacity(0.87),colorBlendMode: BlendMode.modulate),
          )],
          ),
          SizedBox(height: 20,),
                    //Last 5 releases
          Column(
            children: [
            Row(children: [SizedBox(width: 10,),Text('Last 5 albums                                                                                    '),],),
            SizedBox(height: 10,),
            Row(children: [
              Column(children: [
              SizedBox(width: 190,),
              Container(height: 150, width: 180, child: 
              IconButton(onPressed: (){         Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AlbumSongs(idAlbum, imageAlbum,)));}, icon: Image.network('${snapshot.data?.items[0].images[0].url}',alignment: Alignment.topLeft, )),
             )
             ],
             ),
             Column(children: [Container(width: 190,child: Center(child: (AutoSizeText('name: ${snapshot.data?.items[0].name}',maxLines: 3,))),),
             Row(children: [Center(child: Text('release date: ${snapshot.data?.items[0].releaseDate.day}-${snapshot.data?.items[0].releaseDate.month}-${snapshot.data?.items[0].releaseDate.year}',style: TextStyle(fontSize: 15),))],),
             Row(children: [Center(child: Text('total tracks: ${snapshot.data?.items[0].totalTracks}'))],),],)
            ],
            ),
            SizedBox(height: 10,),
             Row(children: [
              Column(children: [
                                SizedBox(width: 190,),
              Container(height: 150, width: 180, child: 
              IconButton(onPressed: (){print('album 2');}, icon: Image.network('${snapshot.data?.items[1].images[0].url}',alignment: Alignment.topLeft, )),
             )
             ],
             ),
             Column(children: [Container(width: 190,child: Center(child: (AutoSizeText('name: ${snapshot.data?.items[1].name}',maxLines: 2))),),
             Row(children: [Center(child: Text('release date: ${snapshot.data?.items[1].releaseDate.day}-${snapshot.data?.items[1].releaseDate.month}-${snapshot.data?.items[1].releaseDate.year}',style: TextStyle(fontSize: 15),))],),
             Row(children: [Center(child: Text('total tracks: ${snapshot.data?.items[1].totalTracks}'))],),],)
            ],
            ),
            SizedBox(height: 10,),
             Row(children: [
              Column(children: [
                                SizedBox(width: 190,),
              Container(height: 150, width: 180, child: 
              IconButton(onPressed: (){print('album 3');}, icon: Image.network('${snapshot.data?.items[2].images[0].url}',alignment: Alignment.topLeft, )),
             )
             ],
             ),
             Column(children: [Container(width: 190,child: Center(child: (AutoSizeText('name: ${snapshot.data?.items[2].name}',maxLines: 2,))),),
             Row(children: [Center(child: Text('release date: ${snapshot.data?.items[2].releaseDate.day}-${snapshot.data?.items[2].releaseDate.month}-${snapshot.data?.items[2].releaseDate.year}',style: TextStyle(fontSize: 15),))],),
             Row(children: [Center(child: Text('total tracks: ${snapshot.data?.items[2].totalTracks}'))],),],)
            ],
            ),
                        SizedBox(height: 10,),
             Row(children: [
              Column(children: [
                                SizedBox(width: 190,),
              Container(height: 150, width: 180, child: 
              IconButton(onPressed: (){print('album 4');}, icon: Image.network('${snapshot.data?.items[3].images[0].url}',alignment: Alignment.topLeft, )),
             )
             ],
             ),
             Column(children: [Container(width: 190,child: Center(child: (AutoSizeText('name: ${snapshot.data?.items[3].name}',maxLines: 2,))),),
             Row(children: [Center(child: Text('release date: ${snapshot.data?.items[3].releaseDate.day}-${snapshot.data?.items[3].releaseDate.month}-${snapshot.data?.items[3].releaseDate.year}',style: TextStyle(fontSize: 15),))],),
             Row(children: [Center(child: Text('total tracks: ${snapshot.data?.items[3].totalTracks}'))],),],)
            ],
            ),
                        SizedBox(height: 10,),
             Row(children: [
              Column(children: [
                                SizedBox(width: 190,),
              Container(height: 150, width: 180, child: 
              IconButton(onPressed: (){print('album 5');}, icon: Image.network('${snapshot.data?.items[4].images[0].url}',alignment: Alignment.topLeft, )),
             )
             ],
             ),
             Column(children: [Container(width: 190,child: Center(child: (AutoSizeText('name: ${snapshot.data?.items[4].name}',maxLines: 2,))),),
             Row(children: [Center(child: Text('release date: ${snapshot.data?.items[4].releaseDate.day}-${snapshot.data?.items[4].releaseDate.month}-${snapshot.data?.items[4].releaseDate.year}',style: TextStyle(fontSize: 15),))],),
             Row(children: [Center(child: Text('total tracks: ${snapshot.data?.items[4].totalTracks}'))],),],)
            ],
            ),
            ]
          )
        ]
        )
            ];
          } else if (snapshot.hasError) {
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
          return 
          Scaffold(
            appBar: AppBar(title: Text('${snapshot.data?.items[0].artists[0].name}',style:(TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25))),),
          body:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          )
          );
        },
      ),
    );
  }
  }