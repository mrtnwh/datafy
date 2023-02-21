import 'package:auto_size_text/auto_size_text.dart';
import 'package:datafy/pages/albums.dart';

import '../models/artist.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';
import '../services/artists_service.dart';

class FutureBuilderPage extends StatelessWidget {
  FutureBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        body: TextFuture());
  }
}

class TextFuture extends StatefulWidget {
  TextFuture({
    Key? key,
  }) : super(key: key);

  @override
  State<TextFuture> createState() => _TextFutureState();
}

class _TextFutureState extends State<TextFuture> {
  //late Future<TracksReleased> futureTracks;
  late Future<SearchArtist> futureArtist;

  @override
  void initState() {
    super.initState();
    futureArtist = SearchArtists().fetchSearchArtist();
    //futureTracks = Tracks().fetchLastReleases();
  }

  final Future<Map<String, String>> _calculation =
      Future<Map<String, String>>.delayed(
    const Duration(seconds: 2),
    () => {'title': 'Data Loaded'},
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var index = 0;
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<SearchArtist>(
        future: futureArtist, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<SearchArtist> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Column(children: [
                Row(
                  children: [
                    Container(
                      height: size.height * 0.24,
                      width: size.width * 1,
                      child: Image.asset('assets/images/nirvana.jpeg',
                          fit: BoxFit.fitWidth,
                          color: Colors.grey.withOpacity(0.87),
                          colorBlendMode: BlendMode.modulate),
                    )
                  ],
                ),

                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 5,
                    ),
                    RichText(
                        text: TextSpan(
                            text:
                                'followers: ${snapshot.data?.artists.items[0].followers.total}',
                            style: TextStyle(color: Colors.black),
                            children: [
                          TextSpan(text: '\n'),
                          TextSpan(
                              text:
                                  'genres: ${snapshot.data?.artists.items[0].genres[0]}, ${snapshot.data?.artists.items[0].genres[1]}, ${snapshot.data?.artists.items[0].genres[2]}'),
                          TextSpan(text: '\n')
                        ]))
                  ],
                ),
                // Similar Artists
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                            'Similar Artists                                                                                     ')
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 210,
                      ),
                      Container(
                        height: 180,
                        width: 200,
                        child: IconButton(onPressed: (){
                          print('toque');
                        }, icon:Image.network('${snapshot.data?.artists.items[2].images[0].url}',
                          
                          alignment: Alignment.topLeft,
                        ),iconSize: 100,),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          width: 170,
                          child: Center(
                              child: AutoSizeText(
                                  'name: ${snapshot.data?.artists.items[2].name}',
                                  maxLines: 2))),
                      Row(
                        children: [
                          Center(
                              child: AutoSizeText(
                                  'followers: ${snapshot.data?.artists.items[2].followers.total}'))
                        ],
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                              'genres: ${snapshot.data?.artists.items[2].genres.length}')
                        ],
                      ),
                    ],
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 210,
                      ),
                      Container(
                        height: 180,
                        width: 200,
                        child: IconButton(onPressed: (){
                          print('toque');
                        }, icon:Image.network('${snapshot.data?.artists.items[3].images[0].url}',
                          
                          alignment: Alignment.topLeft,
                        ),iconSize: 100),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          width: 170,
                          child: Center(
                              child: AutoSizeText(
                                  'name: ${snapshot.data?.artists.items[3].name}',
                                  maxLines: 2))),
                      Row(
                        children: [
                          Center(
                              child: AutoSizeText(
                                  'followers: ${snapshot.data?.artists.items[3].followers.total}'))
                        ],
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                              'genres: ${snapshot.data?.artists.items[3].genres.length}')
                        ],
                      ),
                    ],
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 210,
                      ),
                      Container(
                        height: 180,
                        width: 200,
                        child: IconButton(onPressed: (){
                          print('toque');
                        }, icon:Image.network('${snapshot.data?.artists.items[4].images[0].url}',
                          
                          alignment: Alignment.topLeft,
                        ),iconSize: 100,)
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          width: 170,
                          child: Center(
                              child: AutoSizeText(
                                  'name: ${snapshot.data?.artists.items[4].name}',
                                  maxLines: 2))),
                      Center(
                          child: AutoSizeText(
                        'followers: ${snapshot.data?.artists.items[4].followers.total}',
                      )),
                      Center(
                          child: AutoSizeText(
                              'genres: ${snapshot.data?.artists.items[4].genres.length}'))
                    ],
                  ),
                ])
              ]),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScreenAlbums()));
                  },
                  child: Text(
                    'Tap this button to see the last 5 albums from ${snapshot.data?.artists.items[0].name}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    disabledForegroundColor: Colors.grey.withOpacity(0.38),
                    disabledBackgroundColor: Colors.grey.withOpacity(0.12),
                  ),
                ),
              ),
              SizedBox(height: 10,)
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
                title: Text('${snapshot.data?.artists.items[0].name}',
                    style: (TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
