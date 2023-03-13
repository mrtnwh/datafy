import 'package:datafy/pages/album.dart';
import 'package:flutter/material.dart';
import 'package:datafy/pages/pages.dart';
import 'package:datafy/providers/providers.dart';
import 'package:datafy/shared/preferences.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBSffFcTecNJK0SllDuz12wG0y32X56oTk", 
      appId: "9dd09", 
      messagingSenderId: "584930411693", 
      projectId: "datafy-9dd09")
);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
          create: (context) =>
              ThemeProvider(darkmodeEnabled: Preferences.darkmode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DATAFY',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      initialRoute: Preferences.isLogged ? 'home_logged' : 'home',
      routes: {
        'home': (context) => const LogIn(),
        'home_logged':(context)=> const ScreenLogged(),
        'list_songs': (context) => ListArtists(),      
        },
    );
  }
}