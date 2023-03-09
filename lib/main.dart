import 'package:flutter/material.dart';
import 'package:provider_state_management/MyHomePage.dart';
import 'package:provider_state_management/provider/Auth_Prioider.dart';
import 'package:provider_state_management/provider/count_provider.dart';
import 'package:provider_state_management/provider/exampleoneprovider.dart';
import 'package:provider_state_management/provider/favourite_provider.dart';
import 'package:provider_state_management/provider/theme_changer_provider.dart';
import 'package:provider_state_management/provider_screen.dart';
import 'package:provider_state_management/screen/Login.dart';
import 'package:provider_state_management/screen/countexample.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/screen/dart_theme.dart';
import 'package:provider_state_management/screen/exampleonescreen.dart';
import 'package:provider_state_management/screen/favourite/favourite_screen.dart';
import 'package:provider_state_management/screen/value_notify_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final themechanger = Provider.of<ThemeChanger>(context,listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => exampleoneprovider(),
        ),
        ChangeNotifierProvider(
          create: (_) => favouriteitemprovider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: 
      Builder(
        builder: (BuildContext context) {
          final themechanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themechanger.themeMode,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.red,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.yellow,
              primaryColor: Colors.purple,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
              iconTheme: const IconThemeData(color: Colors.pink),
            ),
            home: const LoginScreen(),
          );
        }
      ),
    );
  }
}
