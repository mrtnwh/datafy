import 'package:datafy/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

class ListSongs extends StatelessWidget{
  const ListSongs({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: const Center(child: Text('ListSongs')),
      appBar: AppBar(title: Text('List Songs'),),
      drawer: DrawerMenu(),
    );
  }
}