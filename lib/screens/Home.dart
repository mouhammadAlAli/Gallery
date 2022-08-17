import 'package:flutter/material.dart';
import 'package:smart_gallery/screens/Photos/Photos.dart';
import 'package:smart_gallery/screens/Albums.dart';
import 'package:smart_gallery/screens/Edit.dart';
import 'package:smart_gallery/screens/Discover.dart';

Future getPermission() async {
  var result = await PhotoManager.requestPermissionExtend();
  if (result.isAuth) {
    print("okkkkkkkkkkkk");
  } else {
    print("bad");
    PhotoManager.openSetting();
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<String> titles = ["Photos", "Albums", "Edit", "Discover"];

  List<Widget> screens = [Albums(), Albums(), Edit(), Discover()];
  String title = "Photos";
  int selected = 0;
  @override
  void initState() {
    // TODO: implement initState
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$title",
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            title = titles.elementAt(selected);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Photos",),
          BottomNavigationBarItem(icon: Icon(Icons.photo_library), label: "Albums"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
          BottomNavigationBarItem(icon: Icon(Icons.public_rounded), label: "Discover"),
        ],
      ),
      body: screens[selected],
    );
  }
}
