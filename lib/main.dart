import 'package:flutter/material.dart';
import 'package:datafy/pages/pages.dart';
import 'package:datafy/providers/providers.dart';
import 'package:datafy/shared/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
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
        'list_songs': (context) => ListArtists(),
      },
    );
  }
}
