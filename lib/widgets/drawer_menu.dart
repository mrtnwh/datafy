import 'package:flutter/material.dart';
import 'package:datafy/providers/providers.dart';
import 'package:datafy/shared/preferences.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.search),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('List Songs'),
            leading: const Icon(Icons.search),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'list_songs');
            },
          ),
          const Divider(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SwitchListTile.adaptive(
                  title: const Text('Dark mode'),
                  value: Preferences.darkmode,
                  onChanged: (value) {
                    setState(() {
                      Preferences.darkmode = value;
                      value ? currentTheme.setDark() : currentTheme.setLight();
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/green_background.png'),
              fit: BoxFit.cover,
              opacity: 0.9)),
      child: Container(
        alignment: Alignment.centerLeft,
        child: const Text(
          'DATAFY',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
