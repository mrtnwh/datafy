import 'package:datafy/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

import 'artist.dart';

final List<Map<String, dynamic>> arrNames = [
  {
    'url': 'https://i.scdn.co/image/84282c28d851a700132356381fcfbadc67ff498b',
    'name': 'Nirvana',
    'id': '6olE6TJLqED3rqDCT0FyPh'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb69ca98dd3083f1082d740e44',
    'name': 'Metallica',
    'id': '2ye2Wgw4gimLv2eAKyk1NB'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5ebcdce7620dc940db079bf4952',
    'name': 'Ariana Grande',
    'id': '66CXWjxzNUsdJxJ2JdwvnR'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb99e4fca7c0b7cb166d915789',
    'name': 'Rihanna',
    'id': '5pKCCKE2ajJHZ9KAiaK11H'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb7e8110a92ec2252f0821f8b8',
    'name': 'Miley Cyrus',
    'id': '5YGY8feqx7naU7z4HrwZM6'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb8ee9a6f54dcbd4bc95126b14',
    'name': 'Bad Bunny',
    'id': '4q3ewBCX7sLwd24euuV69X'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5ebe1988a1a730ae50728967a16',
    'name': 'Luis Alberto Spinetta',
    'id': '1MuQ2m2tg7naeRGAOxYZer'
  },
  {
    'url': 'https://i.scdn.co/image/ab67616d0000b2733b5ad8b3f780523376b2f9b4',
    'name': 'Sumo',
    'id': '10AzTrYMPVVmpKoBP5bX9W'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb3e0a5fbc871b4020abb789d7',
    'name': 'Natanael Cano',
    'id': '0elWFr7TW8piilVRYJUe4P'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5ebd25ab3ee01527706a3b47cc6',
    'name': 'Charly Garcia',
    'id': '3jO7X5KupvwmWTHGtHgcgo'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb6d38c7aebc81afb076354b3b',
    'name': 'Gustavo Cerati',
    'id': '1QOmebWGB6FdFtW7Bo3F0W'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eba03696716c9ee605006047fd',
    'name': 'Radiohead',
    'id': '4Z8W4fKeB5YxbusRsdQVPb'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb284894d68fe2f80cad555110',
    'name': 'Shakira',
    'id': '0EmeFodog0BfCgMzAIvKQp'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5ebfd7a593cda27e19c8768edea',
    'name': 'PinkPantheress',
    'id': '78rUTD7y6Cy67W1RVzYs7t'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5ebaeb5c04fdd8ec6273850d207',
    'name': 'Bjork',
    'id': '7w29UYBi0qsHi5RTcv3lmA'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5ebfd30ebd7e80dad6b2383aab0',
    'name': 'Men I Trust',
    'id': '3zmfs9cQwzJl575W1ZYXeT'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb09ac9d040c168d4e4f58eb42',
    'name': 'Steve Lacy',
    'id': '57vWImR43h4CaDao012Ofp'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb1454debf3d21173c9051342b',
    'name': 'Quavo',
    'id': '0VRj0yCOv2FXJNP47XQnx5'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5ebc8d3d98a1bccbe71393dbfbf',
    'name': 'Lady Gaga',
    'id': '1HY2Jd0NmPuamShAr6KMms'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb1b227136246869eb248cafef',
    'name': 'Azealia Banks',
    'id': '7gRhy3MIPHQo5CXYfWaw9I'
  },
  {
    'url': 'https://i.scdn.co/image/5419a05563a9ba8cb16fe207199c298f621eef85',
    'name': 'Crystal Castles',
    'id': '7K3zpFXBvPcvzhj7zlGJdO'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb567fe9fd96f438ec865dd9bb',
    'name': 'Underaiki',
    'id': '55IzEzlyUcBFqGgyam2Seo'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb0ed68984dc1e96340205039e',
    'name': 'Aphex Twin',
    'id': '6kBDZFXuLrZgHnvmPu9NsG'
  },
  {
    'url': 'https://i.scdn.co/image/c3d256b560f88164c5346543311b0a353c71cfd7',
    'name': 'Cocteau Twins',
    'id': '5Wabl1lPdNOeIn0SQ5A1mp'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb21c79e4e6e1af6af9b94d3a0',
    'name': 'my bloody valentine',
    'id': '3G3Gdm0ZRAOxLrbyjfhii5'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb8ae7f2aaa9817a704a87ea36',
    'name': 'Justin Bieber',
    'id': '1uNFoZAHBGtllmzznpCI3s'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb10ca40ea0b0b5082dba0ff75',
    'name': 'Sam Smith',
    'id': '2wY79sveU1sp5g7SokKOiI'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb1ca139a174e216880498dc16',
    'name': 'MF DOOM',
    'id': '2pAWfrd7WFF3XhVt9GooDL'
  },
  {
    'url': 'https://i.scdn.co/image/ab6761610000e5eb504ff11d788162fbf8078654',
    'name': 'Playboi Carti',
    'id': '699OTQXzgjhIYAHMy9RyPD'
  },
].toList();

class ListArtists extends StatefulWidget {
  ListArtists({super.key});

  @override
  _ListArtistState createState() => _ListArtistState();
}

class _ListArtistState extends State<ListArtists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          "DATAFY",
          style: TextStyle(color: Colors.white),
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
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: //CircleAvatar(backgroundImage: AssetImage("assets/images/${arrNames[index]}.jpeg"),),
                CircleAvatar(
                    backgroundImage: NetworkImage('${arrNames[index]['url']}')),
            title: Text(arrNames[index]['name']),
            trailing: const Icon(Icons.arrow_circle_right_rounded),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => FutureBuilderPage(
                          arrNames[index]['id'], arrNames[index]['name'])));
            },
          );
        },
        itemCount: arrNames.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 10, thickness: 1);
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
    "Bad Bunny",
    "Luis Alberto Spinetta",
    "Sumo",
    "Natanael Cano",
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
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var artist in arrNames[1]['name']) {
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
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => FutureBuilderPage(
                        arrNames[index]['id'], arrNames[index]['name'])));
          },
        );
      },
    );
  }
}
