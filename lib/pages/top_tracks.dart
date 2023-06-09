import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/top_tracks.dart';
import '../services/top_tracks_service.dart';
import '../widgets/drawer_menu.dart';
import 'album.dart';

// ignore: must_be_immutable
class FutureBuilderPageTopTracks extends StatelessWidget {
  FutureBuilderPageTopTracks(this.idArtist, this.nameArtist, this.imageArtist,
      {super.key});
  String idArtist;
  String nameArtist;
  String imageArtist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        body: TextFuture(idArtist, nameArtist, imageArtist));
  }
}

// ignore: must_be_immutable
class TextFuture extends StatelessWidget {
  late Future<TopTracks> futureTopTracks;
  TextFuture(this.idArtist, this.nameArtist, this.imageArtist, {super.key})
      : futureTopTracks = TopTracksArtist().fetchTopTracks(idArtist);
  String idArtist;
  String nameArtist;
  String imageArtist;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<TopTracks>(
        future: futureTopTracks, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<TopTracks> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            var idAlbum = '${snapshot.data?.tracks[0].album.id}';
            var imageAlbum = '${snapshot.data?.tracks[0].album.images[0].url}';
            var nameAlbum = '${snapshot.data?.tracks[0].album.name}';
            int totalTracks = int.parse(
                '${snapshot.data?.tracks[0].album.totalTracks}'.toString());
            children = <Widget>[
              Row(
                children: [
                  Container(
                    height: size.height * 0.24,
                    width: size.width * 1,
                    child: Image.network('${imageArtist}',
                        fit: BoxFit.fitWidth,
                        color: Colors.grey.withOpacity(0.87),
                        colorBlendMode: BlendMode.modulate),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [Text('Top Tracks')],
              ),
              Column(
                children: [
                  for (int x = 0; x <= 9; x++) ...[
                    Container(
                      child: Column(
                        children: [
                          Row(
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
                                              '${snapshot.data?.tracks[x].album.name}';
                                          idAlbum =
                                              '${snapshot.data?.tracks[x].album.id}';
                                          imageAlbum =
                                              '${snapshot.data?.tracks[x].album.images[0].url}';
                                          totalTracks = int.parse(
                                              '${snapshot.data?.tracks[x].album.totalTracks}'
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
                                          '${snapshot.data?.tracks[x].album.images[0].url}',
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
                                      'name: ${snapshot.data?.tracks[x].name}',
                                      maxLines: 3,
                                    ))),
                                  ),
                                  Column(children: [
                                    Container(
                                      width: 190,
                                      child: Center(
                                          child: (AutoSizeText(
                                        'from Album: \n ${snapshot.data?.tracks[x].album.name}',
                                        maxLines: 3,
                                      ))),
                                    ),
                                  ])
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ],
              ),
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
                title: Text('Top tracks From ${nameArtist}',
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
