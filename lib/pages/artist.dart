import 'package:auto_size_text/auto_size_text.dart';
import 'package:datafy/pages/albums.dart';
import 'package:datafy/pages/related_artist.dart';
import 'package:datafy/pages/top_tracks.dart';
import 'package:flutter/material.dart';
import '../models/relatedArtist.dart';
import '../services/artist_service.dart';
import '../widgets/drawer_menu.dart';

// ignore: must_be_immutable
class FutureBuilderPage extends StatelessWidget {
  FutureBuilderPage(this.idArtist, this.nameArtist, {super.key});
  String idArtist;
  String nameArtist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        body: Stack(
          children: [
            TextFutureArtist(idArtist, nameArtist),
          ],
        ));
  }
}

// ignore: must_be_immutable
class TextFutureArtist extends StatelessWidget {
  late Future<Artist> futureArtist;
  TextFutureArtist(this.idArtist, this.nameArtist, {super.key})
      : futureArtist = Artists().fetchArtist(idArtist);
  String idArtist;
  String nameArtist;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<Artist>(
        future: futureArtist, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Artist> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            var imageToPass = '${snapshot.data?.images[0].url}';
            children = <Widget>[
              Column(children: [
                Row(
                  children: [
                    Container(
                      height: size.height * 0.24,
                      width: size.width * 1,
                      child: Image.network('${snapshot.data?.images[0].url}',
                          fit: BoxFit.fitWidth,
                          color: Colors.grey.withOpacity(0.87),
                          colorBlendMode: BlendMode.modulate),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Center(
                            child: (AutoSizeText(
                          'followers: ${snapshot.data?.followers.total}',
                          minFontSize: 16,
                        ))),
                      ),
                    ]),
                    Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      if ('${snapshot.data?.genres}' == '[]')
                      Container(
                        width: 300,
                        child: (AutoSizeText(
                          'genres: no se han encontrado generos :(.',
                          maxLines: 2,
                          minFontSize: 16,
                        )),
                      )
                      else
                      Container(
                        width: 300,
                        child: (AutoSizeText(
                          'genres: ${snapshot.data?.genres.join(", ")}',
                          maxLines: 2,
                          minFontSize: 16,
                        )),
                      ),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 400,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScreenAlbums(idArtist, imageToPass)));
                    },
                    child: Text(
                      'Tap this button to see the last 5 albums from ${nameArtist}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      disabledForegroundColor: Colors.grey.withOpacity(0.38),
                      disabledBackgroundColor: Colors.grey.withOpacity(0.12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 400,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FutureBuilderPageRelatedArtist(
                                      idArtist, nameArtist, imageToPass)));
                    },
                    child: Text(
                      'Tap this button to see related artist from ${nameArtist}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      disabledForegroundColor: Colors.grey.withOpacity(0.38),
                      disabledBackgroundColor: Colors.grey.withOpacity(0.12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 400,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FutureBuilderPageTopTracks(
                                  idArtist, nameArtist, imageToPass)));
                    },
                    child: Text(
                      'Tap this button to see the top tracks from ${nameArtist}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      disabledForegroundColor: Colors.grey.withOpacity(0.38),
                      disabledBackgroundColor: Colors.grey.withOpacity(0.12),
                    ),
                  ),
                ),
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
                title: Text('${nameArtist}',
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
