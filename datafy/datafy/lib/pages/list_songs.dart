
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
        var arrNames = [
      "Nirvana",
      "Metallica",
      "Ariana Grande",
      "Rihanna",
      "Miley Cyrus",
      "Bad Bunny",
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
            CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
            title: Text(arrNames[index]),
            trailing: Icon(Icons.arrow_circle_right_rounded),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => FutureBuilderPage()));
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
