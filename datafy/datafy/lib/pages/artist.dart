import 'dart:convert';

import 'package:datafy/services/artists_service.dart';
import 'package:datafy/widgets/artist_tile.dart';
import 'package:dio/dio.dart';
import '../pages/future_builder.dart';
import 'package:flutter/material.dart';

class ScreenArtist extends StatelessWidget{
  late Future<Artists> futureArtist;
  ScreenArtist({super.key});

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Nirvana',style:(TextStyle(fontFamily: 'GothamSpotify',fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25))),),
      body: SingleChildScrollView(
        child: 
        Column(
        children: [
          Row(children: [
            Container(height:size.height*0.24, width: size.width*1,
          child: 
          Image.asset('assets/images/nirvana.jpeg', fit: BoxFit.fitWidth, color: Colors.grey.withOpacity(0.87),colorBlendMode: BlendMode.modulate),)],
          ),
          SizedBox(height: 20,),
          Row(children: [RichText(text: TextSpan(text: '1600000 followers                             ', style: TextStyle(color: Colors.black),children: [TextSpan(text: 'genres: asda,asdasda,asda') ] ))],
          ),
          SizedBox(height: 50,),
                    //Last 5 releases
          Column(children: [
            Row(children: [Text('last 5 releases                                                                                    '),],),
            SizedBox(height: 10,),
            Row(children: [
              Column(children: [
              Container(height: 180, width: 200, child: 
              Image.network('https://i.pinimg.com/474x/51/cd/3a/51cd3aea2b0852fd4f5e98ac51eb074b.jpg',alignment: Alignment.topLeft, ),
             )
             ],
             ),
             
             Column(children: [Row(children: [Text('name:                                           ',)],),
             Row(children: [Text('release date:                                ')],),
             Row(children: [Text('type:                                              ')],),],)
             
            ],
            ),
            SizedBox(height: 10,),
            Row(children: [
              Column(children: [
              Container(height: 180, width: 200, child: 
              Image.network('https://i.pinimg.com/474x/51/cd/3a/51cd3aea2b0852fd4f5e98ac51eb074b.jpg',alignment: Alignment.topLeft, ),
             )
             ],
             ),
             Column(children: [Row(children: [Text('name:                                            ',)],),
             Row(children: [Text('release date:                                ')],),
             Row(children: [Text('type:                                              ')],),],)
             
            ],
            ),
                        SizedBox(height: 10,),
            Row(children: [
              Column(children: [
              Container(height: 180, width: 200, child: 
              Image.network('https://i.pinimg.com/474x/51/cd/3a/51cd3aea2b0852fd4f5e98ac51eb074b.jpg',alignment: Alignment.topLeft, ),
             )
             ],
             ),
             Column(children: [Row(children: [Text('name:                                            ',)],),
             Row(children: [Text('release date:                                ')],),
             Row(children: [Text('type:                                              ')],),],)
             
            ],
            ),
                        SizedBox(height: 10,),
            Row(children: [
              Column(children: [
              Container(height: 180, width: 200, child: 
              Image.network('https://i.pinimg.com/474x/51/cd/3a/51cd3aea2b0852fd4f5e98ac51eb074b.jpg',alignment: Alignment.topLeft, ),
             )
             ],
             ),
             Column(children: [Row(children: [Text('name:                                            ',)],),
             Row(children: [Text('release date:                                ')],),
             Row(children: [Text('type:                                              ')],),],)
             
            ],
            ),
                        SizedBox(height: 10,),
            Row(children: [
              Column(children: [
              Container(height: 180, width: 200, child: 
              Image.network('https://i.pinimg.com/474x/51/cd/3a/51cd3aea2b0852fd4f5e98ac51eb074b.jpg',alignment: Alignment.topLeft, ),
             )
             ],
             ),
             Column(children: [Row(children: [Text('name:                                            ',)],),
             Row(children: [Text('release date:                                ')],),
             Row(children: [Text('type:                                              ')],),],)
             
            ],
            )
          ],
          ),
          

                   // Similar Artists
          SizedBox(height: 20,),
          Column(children: [Row(children: [Text('Similar Artists                                                                                     ')],)],),
          SizedBox(height: 10,),
          Row(children: [
              Column(children: [
              Container(height: 180, width: 200, child: 
              Image.network('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/399b0628-4b14-4324-9032-ec873a2e0451/dbat80l-4d1de834-57cd-4c51-91df-f5fab521666c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM5OWIwNjI4LTRiMTQtNDMyNC05MDMyLWVjODczYTJlMDQ1MVwvZGJhdDgwbC00ZDFkZTgzNC01N2NkLTRjNTEtOTFkZi1mNWZhYjUyMTY2NmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.64BS8qZB3AXJfWyaqEYfz0wVE5ZdWzrpwXlHNQaZG8A',alignment: Alignment.topLeft, ),
             )
             ],
             ),
             Column(children: [Row(children: [Text('name:                                            ',)],),
             Row(children: [Text('followers:                                      ')],),
             Row(children: [Text('genres:                                          ')],),],
             ),
             
            ],
            ),
                      SizedBox(height: 20,),
          Row(children: [
              Column(children: [
              Container(height: 180, width: 200, child: 
              Image.network('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/399b0628-4b14-4324-9032-ec873a2e0451/dbat80l-4d1de834-57cd-4c51-91df-f5fab521666c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM5OWIwNjI4LTRiMTQtNDMyNC05MDMyLWVjODczYTJlMDQ1MVwvZGJhdDgwbC00ZDFkZTgzNC01N2NkLTRjNTEtOTFkZi1mNWZhYjUyMTY2NmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.64BS8qZB3AXJfWyaqEYfz0wVE5ZdWzrpwXlHNQaZG8A',alignment: Alignment.topLeft, ),
             )
             ],
             ),
             Column(children: [Row(children: [Text('name:                                            ',)],),
             Row(children: [Text('followers:                                      ')],),
             Row(children: [Text('genres:                                          ')],),],
             ),
             
              ],
            ),
                      SizedBox(height: 20,),
          Row(children: [
              Column(children: [
              Container(height: 180, width: 200, child: 
              Image.network('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/399b0628-4b14-4324-9032-ec873a2e0451/dbat80l-4d1de834-57cd-4c51-91df-f5fab521666c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM5OWIwNjI4LTRiMTQtNDMyNC05MDMyLWVjODczYTJlMDQ1MVwvZGJhdDgwbC00ZDFkZTgzNC01N2NkLTRjNTEtOTFkZi1mNWZhYjUyMTY2NmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.64BS8qZB3AXJfWyaqEYfz0wVE5ZdWzrpwXlHNQaZG8A',alignment: Alignment.topLeft, ),
             )
             ],
             ),
             Column(children: [Row(children: [Text('name:                                            ',)],),
             Row(children: [Text('followers:                                      ')],),
             Row(children: [Text('genres:                                          ')],),],
             ),
             
            ],
            ),

          ],
        
          ),
          
        
          
          
      )
      );
      
      


  }
  

}
