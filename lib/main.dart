import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/Photos/Photo.dart';

void main() {
  runApp(Gallery());
}

class Gallery extends StatelessWidget {
  String path;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {"Photo":(context)=> Photo(path)},
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white,titleTextStyle: TextStyle(color: Colors.black)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white.withOpacity(0.2),
          selectedItemColor: Colors.blue,
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedLabelStyle: TextStyle(fontSize: 10),
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black38,
        )
      ),
    );
  }
}


