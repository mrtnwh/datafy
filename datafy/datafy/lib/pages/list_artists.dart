import 'package:datafy/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

import 'artist.dart';


class ListSongs extends StatelessWidget {
  const ListSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GFG(),
    );
  }
}

// This is the widget that will be shown
// as the homepage of your application.
class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);

  @override
  State<GFG> createState() => _GFGState();
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
     final List<Map<String,dynamic>> arrNames = [
    {'url':'https://i.scdn.co/image/84282c28d851a700132356381fcfbadc67ff498b', 'name': 'Nirvana'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb69ca98dd3083f1082d740e44','name':'Metallica'},
    {'url':'https://i.scdn.co/image/ab6761610000e5ebcdce7620dc940db079bf4952','name':'Ariana Grande'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb99e4fca7c0b7cb166d915789','name':'Rihanna'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb7e8110a92ec2252f0821f8b8','name':'Miley Cyrus'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb8ee9a6f54dcbd4bc95126b14','name':'Bad Bunny'},
    {'url':'https://i.scdn.co/image/ab6761610000e5ebe1988a1a730ae50728967a16','name':'Luis Alberto Spinetta'},
    {'url':'https://i.scdn.co/image/ab67616d0000b2733b5ad8b3f780523376b2f9b4','name':'Sumo'},
    {'url':'https://i.scdn.co/image/ab6761610000f17865b686a674b413dcc31e4b08','name':'Seru Giran'},
    {'url':'https://i.scdn.co/image/ab6761610000e5ebd25ab3ee01527706a3b47cc6','name':'Charly Garcia'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb6d38c7aebc81afb076354b3b','name':'Gustavo Cerati'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eba03696716c9ee605006047fd','name':'Radiohead'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb284894d68fe2f80cad555110','name':'Shakira'},
    {'url':'https://i.scdn.co/image/ab6761610000e5ebfd7a593cda27e19c8768edea','name':'PinkPantheress'},
    {'url':'https://i.scdn.co/image/ab6761610000e5ebaeb5c04fdd8ec6273850d207','name':'Bjork'},
    {'url':'https://i.scdn.co/image/ab6761610000e5ebfd30ebd7e80dad6b2383aab0','name':'Men I Trust'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb09ac9d040c168d4e4f58eb42','name':'Steve Lacy'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb1454debf3d21173c9051342b','name':'Quavo'},
    {'url':'https://i.scdn.co/image/ab6761610000e5ebc8d3d98a1bccbe71393dbfbf','name':'Lady Gaga'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb1b227136246869eb248cafef','name':'Azealia Banks'},
    {'url':'https://i.scdn.co/image/5419a05563a9ba8cb16fe207199c298f621eef85','name':'Crystal Castles'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb567fe9fd96f438ec865dd9bb','name':'Underaiki'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb0ed68984dc1e96340205039e','name':'Aphex Twin'},
    {'url':'https://i.scdn.co/image/c3d256b560f88164c5346543311b0a353c71cfd7','name':'Cocteau Twins'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb21c79e4e6e1af6af9b94d3a0','name':'my bloody valentine'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb8ae7f2aaa9817a704a87ea36','name':'Justin Bieber'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb10ca40ea0b0b5082dba0ff75','name':'Sam Smith'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb1ca139a174e216880498dc16','name':'MF DOOM'},
    {'url':'https://i.scdn.co/image/ab6761610000e5eb504ff11d788162fbf8078654','name':'Playboi Carti'},
    ].toList();

    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Spotify",
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body:ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: //CircleAvatar(backgroundImage: AssetImage("assets/images/${arrNames[index]}.jpeg"),),
            CircleAvatar(backgroundImage: NetworkImage('${arrNames[index]['url']}')),
            title: Text(arrNames[index]['name']),
            trailing: Icon(Icons.arrow_circle_right_rounded),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => FutureBuilderPage(arrNames[index]['name'])));
            },
          );
        },
        itemCount: arrNames.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 10, thickness: 1);
        },
      ),
    );

  }
    
  }



class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Nirvana",
    "Metallica",
    "Ariana Grande",
    "Rihanna",
    "Miley Cyrus",
    "Luis Alberto Spinetta",
    "Sumo",
    "Seru Giran",
    "Charly Garcia",
    "Gustavo Cerati",
    "Radiohead",
    "Shakira",
    "PinkPantheress",
    "Bjork",
    "Men I Trust",
    "Steve Lacy",
    "Quavo",
    "Lady Gaga",
    "Azealia Banks",
    "Crystal Castles",
    "Alice Glass",
    "Underaiki",
    "Aphex Twin",
    "Cocteau Twins",
    "my bloody valentine",
    "Justin Bieber",
    "Sam Smith",
    "MF DOOM",
    "Playboi Carti",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var artist in searchTerms) {
      if (artist.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(artist);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var artist in searchTerms) {
      if (artist.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(artist);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}