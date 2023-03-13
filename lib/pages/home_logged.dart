import 'package:datafy/pages/list_artists.dart';
import 'package:datafy/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

class ScreenLogged extends StatelessWidget{
  const ScreenLogged({super.key});
  

  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('ScreenLogged'),),
      drawer: const DrawerMenu(),
      body: Column(children: [ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: Colors.red, // background
    onPrimary: Colors.white, // foreground
  ),
  onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (_) =>ListArtists())); },
  child: Text('Quiero saber las ultimas 5 canciones de ..'),
),
ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: Colors.red, // background
    onPrimary: Colors.white, // foreground
  ),
  onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (_) =>ListArtists())); },
  child: Text('Quiero saber informacion sobre este artista ..'),
),
]),
      
    );
  }
}