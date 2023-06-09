import 'package:auto_size_text/auto_size_text.dart';
import 'package:datafy/models/album_tracks.dart';
import 'package:datafy/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

import '../services/album_service.dart';

class AlbumSongs extends StatelessWidget {
  AlbumSongs(this.idAlbum, this.imageAlbum, this.nameAlbum, this.totalTracks,
      {super.key});
  String idAlbum, imageAlbum, nameAlbum;
  int totalTracks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        body: TextFuture(idAlbum, imageAlbum, nameAlbum, totalTracks));
  }
}

class TextFuture extends StatelessWidget {
  late Future<TracksAlbum> futureTracksAlbum;
  TextFuture(this.idAlbum, this.imageAlbum, this.nameAlbum, this.totalTracks,
      {super.key})
      : futureTracksAlbum = AlbumTracks().fetchAlbumTracks(idAlbum);
  String idAlbum, imageAlbum, nameAlbum;
  int totalTracks;

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
            future:
                futureTracksAlbum, // a previously-obtained Future<String> or null
            builder:
                (BuildContext context, AsyncSnapshot<TracksAlbum> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  Column(children: [
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.24,
                          width: size.width * 1,
                          child: Image.network('${imageAlbum}',
                              fit: BoxFit.fitWidth,
                              color: Colors.grey.withOpacity(0.87),
                              colorBlendMode: BlendMode.modulate),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                        child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: totalTracks < 50 ? totalTracks : 50,
                      itemBuilder: (_, int i) {
                        return Card(
                          child: ListTile(
                            leading: Image.network('${imageAlbum}'),
                            title: AutoSizeText(
                              '${snapshot.data?.items[i].name}',
                            ),
                            subtitle: AutoSizeText(
                              '${snapshot.data?.items[i].artists[0].name}',
                            ),
                            trailing:
                                Text('${snapshot.data?.items[i].trackNumber}'),
                          ),
                        );
                      },
                    ))
                  ])
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
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Awaiting result...'),
                        ),
                        SizedBox(height: 15,),
                        CircularProgressIndicator()
                      ],
                    ),
                  )
                ];
              }
              return Scaffold(
                  appBar: AppBar(
                    title: Text('${nameAlbum}',
                        style: (const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25))),
                  ),
                  body: SingleChildScrollView(
                    child: Stack(
                      children: children,
                    ),
                  ));
            }));
  }
}
