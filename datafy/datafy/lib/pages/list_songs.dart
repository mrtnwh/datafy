import 'package:datafy/pages/artist.dart';
import 'package:datafy/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:datafy/models/search_artist.dart';
 
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
 
class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
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
              showSearch(
                context: context,
                delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _Lista(),
    );
  }
  
  Widget _Lista() {
    final lst = [
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
        onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ScreenArtist()));
                }
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading: /* Logo banda */  CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading: /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing:Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading: /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading:  /* Logo banda */ CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      ListTile(
        leading: /* Logo banda */  CircleAvatar(backgroundImage: AssetImage("assets/images/nirvana.jpeg")),
        trailing: Icon(Icons.abc_outlined),
        title: /* Nombre banda */ Text('Nirvana'),
        subtitle: /* Followers o genero */ Text('700000 Followers'),
      ),
      


    
    ];
    return ListView.builder(
      itemCount: lst.length,
      itemBuilder: (context, i){
        return lst[i];
      }
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
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
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