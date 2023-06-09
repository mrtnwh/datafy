import 'package:auto_size_text/auto_size_text.dart';
import 'package:datafy/pages/album.dart';
import 'package:flutter/material.dart';
import '../models/tracks.dart';
import '../services/tracks_service.dart';
import '../widgets/drawer_menu.dart';

class ScreenAlbums extends StatelessWidget {
  ScreenAlbums(this.id, this.imageToPass, {super.key});
  String id;
  String imageToPass;
  String? idAlbum;
  String? imageAlbum;
  String? nameAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        body: TextFuture(id, imageToPass, idAlbum, imageAlbum, nameAlbum));
  }
}

class TextFuture extends StatelessWidget {
  late Future<TracksReleased> futureTracks;
  TextFuture(
      this.id, this.imageToPass, this.idAlbum, this.imageAlbum, this.nameAlbum,
      {super.key})
      : futureTracks = Tracks().fetchLastReleases(id);
  String id;
  String imageToPass;
  String? idAlbum;
  String? imageAlbum;
  String? nameAlbum;

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
        builder:
            (BuildContext context, AsyncSnapshot<TracksReleased> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            var idAlbum = '${snapshot.data?.items[0].id}';
            var imageAlbum = '${snapshot.data?.items[0].images[0].url}';
            var nameAlbum = '${snapshot.data?.items[0].name}';
            int totalTracks =
                int.parse('${snapshot.data?.items[0].totalTracks}'.toString());
            children = <Widget>[
              Column(children: [
                Row(
                  children: [
                    Container(
                      height: size.height * 0.24,
                      width: size.width * 1,
                      child: Image.network('${imageToPass}',
                          fit: BoxFit.fitWidth,
                          color: Colors.grey.withOpacity(0.87),
                          colorBlendMode: BlendMode.modulate),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //Last 5 releases
                Column(children: [
                  Column(
                    children: [Text('Last 5 albums')],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      for (int x = 0; x <= 4; x++) ...[
                        Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: 190,
                                  ),
                                  Container(
                                    height: 150,
                                    width: 180,
                                    child: IconButton(
                                        onPressed: () {
                                          nameAlbum =
                                              '${snapshot.data?.items[x].name}';
                                          idAlbum =
                                              '${snapshot.data?.items[x].id}';
                                          imageAlbum =
                                              '${snapshot.data?.items[x].images[0].url}';
                                          totalTracks = int.parse(
                                              '${snapshot.data?.items[x].totalTracks}'
                                                  .toString());

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AlbumSongs(
                                                          idAlbum,
                                                          imageAlbum,
                                                          nameAlbum,
                                                          totalTracks as int)));
                                        },
                                        icon: Image.network(
                                          '${snapshot.data?.items[x].images[0].url}',
                                          alignment: Alignment.topLeft,
                                        )),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 190,
                                    child: Center(
                                        child: (AutoSizeText(
                                            'name: ${snapshot.data?.items[x].name}',
                                            maxLines: 2))),
                                  ),
                                  Row(
                                    children: [
                                      Center(
                                          child: Text(
                                        'release date: ${snapshot.data?.items[x].releaseDate.day}-${snapshot.data?.items[x].releaseDate.month}-${snapshot.data?.items[x].releaseDate.year}',
                                        style: TextStyle(fontSize: 15),
                                      ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Center(
                                          child: Text(
                                              'total tracks: ${snapshot.data?.items[x].totalTracks}'))
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ])
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
                title: Text(
                    'Last 5 albums from ${snapshot.data?.items[0].artists[0].name}',
                    style: (TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25))),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              ));
        },
      ),
    );
  }
}
