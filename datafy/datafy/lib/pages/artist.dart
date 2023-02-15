import 'package:flutter/material.dart';

class ScreenArtist extends StatelessWidget{
  const ScreenArtist({super.key});

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Nirvana',style:(TextStyle(fontFamily: 'GothamSpotify',fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25))),),
      body: Stack(children: [
        Container(child: Row(children: [Container(height:size.height*0.24, width: size.width*1,child: Image.asset('assets/images/nirvana.jpeg', fit: BoxFit.fitWidth, color: Colors.grey.withOpacity(0.87),colorBlendMode: BlendMode.modulate),)],),
      ),

      ]
      )
    );
  }
}