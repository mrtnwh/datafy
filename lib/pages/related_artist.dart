import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/relatedArtist.dart';
import '../services/related_artists_service.dart';
import '../widgets/drawer_menu.dart';
import 'artist.dart';

class FutureBuilderPageRelatedArtist extends StatelessWidget {
  FutureBuilderPageRelatedArtist(
      this.idArtist, this.nameArtist, this.imageArtist,
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
  late Future<RelatedArtist> futureRelatedArtists;
  TextFuture(this.idArtist, this.nameArtist, this.imageArtist, {super.key})
      : futureRelatedArtists = RelatedArtists().fetchRelatedArtist(idArtist);
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
      child: FutureBuilder<RelatedArtist>(
        future:
            futureRelatedArtists, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<RelatedArtist> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
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
                height: 20,
              ),
              Column(
                children: [Text('Related Artists')],
              ),
              Column(children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    for (int x = 0; x <= 4; x++) ...[
                      Container(
                        child: Row(children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 210,
                              ),
                              Container(
                                height: 180,
                                width: 200,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => FutureBuilderPage(
                                                '${snapshot.data?.artists[x].id}',
                                                '${snapshot.data?.artists[x].name}')));
                                  },
                                  icon: Image.network(
                                    '${snapshot.data?.artists[x].images[0].url}',
                                    alignment: Alignment.topLeft,
                                  ),
                                  iconSize: 100,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  width: 170,
                                  child: Center(
                                      child: AutoSizeText(
                                          'name: ${snapshot.data?.artists[x].name}',
                                          maxLines: 2))),
                              Row(
                                children: [
                                  Center(
                                      child: AutoSizeText(
                                          'followers: ${snapshot.data?.artists[x].followers.total}'))
                                ],
                              ),
                              if ('${snapshot.data?.artists[x].genres}' == '[]')
                                Center(
                                    child: AutoSizeText(
                                        'genre main: \n no se han encontrado\n generos :(.'))
                              else
                                Center(
                                    child: AutoSizeText(
                                        'genre main: \n ${snapshot.data?.artists[x].genres[0]}'))
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
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
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              )
            ];
          }
          return Scaffold(
              appBar: AppBar(
                title: Text('Related artists From ${nameArtist}',
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
