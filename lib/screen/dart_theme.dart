import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class darktheme extends StatefulWidget {
  const darktheme({super.key});

  @override
  State<darktheme> createState() => _darkthemeState();
}

class _darkthemeState extends State<darktheme> {
  @override
  Widget build(BuildContext context) {
    final themechanger = Provider.of<ThemeChanger>(context,);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Theme provider example")),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: themechanger.themeMode,
            onChanged: themechanger.settheme,
          ),
           RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themechanger.themeMode,
            onChanged: themechanger.settheme,
          ),
           RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themechanger.themeMode,
            onChanged: themechanger.settheme,
          ),
          const Icon(Icons.favorite),
        ],
      ),
    );
  }
}
