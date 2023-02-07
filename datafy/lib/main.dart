import 'package:datafy/pages/list_songs.dart';
import 'package:flutter/material.dart';
import 'package:datafy/pages/pages.dart';
import 'package:datafy/providers/providers.dart';
import 'package:datafy/shared/preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:datafy/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      initialRoute: Preferences.isLogged ? 'home_logged' : 'home',
      routes: {
        'home': (context) => const LogIn(),
        'List Songs': (context) => const ListSongs()

      },
    );
  }
}
