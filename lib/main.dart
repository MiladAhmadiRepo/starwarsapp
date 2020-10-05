import 'package:flutter/material.dart';
import 'MainPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget  {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StartWarsMovies',
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/MainPage': (context) => MainPage(),
      },
    );
  }
}
