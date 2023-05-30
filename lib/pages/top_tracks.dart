import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/top_tracks.dart';
import '../services/top_tracks_service.dart';
import '../widgets/drawer_menu.dart';
import 'album.dart';

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

class TextFuture extends StatelessWidget {
  late Future<TopTracks> futureRelatedArtists;
  TextFuture(this.idArtist, this.nameArtist, this.imageArtist, {super.key})
      : futureRelatedArtists = TopTracksArtist().fetchTopTracks(idArtist);
  String idArtist;
  String nameArtist;
  String imageArtist;

  final Future<Map<String, String>> _calculation =
      Future<Map<String, String>>.delayed(
    const Duration(seconds: 5),
    () => {'title': 'Data Loaded'},
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var index = 0;
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<TopTracks>(
        future:
            futureRelatedArtists, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<TopTracks> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            var idAlbum = '${snapshot.data?.tracks[0].album.id}';
            var imageAlbum = '${snapshot.data?.tracks[0].album.images[0].url}';
            var nameAlbum = '${snapshot.data?.tracks[0].album.name}';
            var nameSong = '${snapshot.data?.tracks[0].name}';
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
                children: [Text('Related Artists')],
              ),
              Column(children: [
                SizedBox(
                  height: 10,
                ),
                Column(
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlbumSongs(
                                                idAlbum,
                                                imageAlbum,
                                                nameAlbum,
                                                totalTracks)));
                                  },
                                  icon: Image.network(
                                    '${imageAlbum}',
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
                                'name: ${nameSong}',
                                maxLines: 3,
                              ))),
                            ),
                            Column(children: [
                              Container(
                                width: 190,
                                child: Center(
                                    child: (AutoSizeText(
                                  'from Album: \n $nameAlbum',
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
                SizedBox(
                  height: 10,
                ),
                Column(
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
                                        '${snapshot.data?.tracks[1].album.name}';
                                    idAlbum =
                                        '${snapshot.data?.tracks[1].album.id}';
                                    imageAlbum =
                                        '${snapshot.data?.tracks[1].album.images[0].url}';
                                    nameSong =
                                        '${snapshot.data?.tracks[1].name}';
                                    totalTracks = int.parse(
                                        '${snapshot.data?.tracks[1].album.totalTracks}'
                                            .toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlbumSongs(
                                                idAlbum,
                                                imageAlbum,
                                                nameAlbum,
                                                totalTracks as int)));
                                  },
                                  icon: Image.network(
                                    '${snapshot.data?.tracks[1].album.images[0].url}',
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
                                'name: ${snapshot.data?.tracks[1].name}',
                                maxLines: 3,
                              ))),
                            ),
                            Column(children: [
                              Container(
                                width: 190,
                                child: Center(
                                    child: (AutoSizeText(
                                  'from Album: \n ${snapshot.data?.tracks[1].album.name}',
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
                SizedBox(
                  height: 10,
                ),
                Column(
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
                              width: 150,
                              child: IconButton(
                                  onPressed: () {
                                    nameAlbum =
                                        '${snapshot.data?.tracks[2].album.name}';
                                    idAlbum =
                                        '${snapshot.data?.tracks[2].album.id}';
                                    imageAlbum =
                                        '${snapshot.data?.tracks[2].album.images[0].url}';
                                    nameSong =
                                        '${snapshot.data?.tracks[2].name}';
                                    totalTracks = int.parse(
                                        '${snapshot.data?.tracks[2].album.totalTracks}'
                                            .toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlbumSongs(
                                                idAlbum,
                                                imageAlbum,
                                                nameAlbum,
                                                totalTracks)));
                                  },
                                  icon: Image.network(
                                    '${snapshot.data?.tracks[2].album.images[0].url}',
                                    alignment: Alignment.topLeft,
                                  )),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Center(
                                  child: (AutoSizeText(
                                'name: ${snapshot.data?.tracks[2].name}',
                                maxLines: 3,
                              ))),
                            ),
                            Column(children: [
                              Container(
                                width: 190,
                                child: Center(
                                    child: (AutoSizeText(
                                  'from Album: \n ${snapshot.data?.tracks[2].album.name}',
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
                SizedBox(
                  height: 10,
                ),
                Column(
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
                                        '${snapshot.data?.tracks[3].album.name}';
                                    idAlbum =
                                        '${snapshot.data?.tracks[3].album.id}';
                                    imageAlbum =
                                        '${snapshot.data?.tracks[3].album.images[0].url}';
                                    nameSong =
                                        '${snapshot.data?.tracks[3].name}';
                                    totalTracks = int.parse(
                                        '${snapshot.data?.tracks[3].album.totalTracks}'
                                            .toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlbumSongs(
                                                idAlbum,
                                                imageAlbum,
                                                nameAlbum,
                                                totalTracks)));
                                  },
                                  icon: Image.network(
                                    '${snapshot.data?.tracks[3].album.images[0].url}',
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
                                'name: ${snapshot.data?.tracks[3].name}',
                                maxLines: 3,
                              ))),
                            ),
                            Column(children: [
                              Container(
                                width: 190,
                                child: Center(
                                    child: (AutoSizeText(
                                  'from Album: \n ${snapshot.data?.tracks[3].album.name}',
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
                SizedBox(
                  height: 10,
                ),
                Column(
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
                                        '${snapshot.data?.tracks[4].album.name}';
                                    idAlbum =
                                        '${snapshot.data?.tracks[4].album.id}';
                                    imageAlbum =
                                        '${snapshot.data?.tracks[4].album.images[0].url}';
                                    nameSong =
                                        '${snapshot.data?.tracks[4].name}';
                                    totalTracks = int.parse(
                                        '${snapshot.data?.tracks[4].album.totalTracks}'
                                            .toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlbumSongs(
                                                idAlbum,
                                                imageAlbum,
                                                nameAlbum,
                                                totalTracks)));
                                  },
                                  icon: Image.network(
                                    '${snapshot.data?.tracks[4].album.images[0].url}',
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
                                'name: ${snapshot.data?.tracks[4].name}',
                                maxLines: 3,
                              ))),
                            ),
                            Column(children: [
                              Container(
                                width: 190,
                                child: Center(
                                    child: (AutoSizeText(
                                  'from Album: \n ${snapshot.data?.tracks[4].album.name}',
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
              ]),
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
