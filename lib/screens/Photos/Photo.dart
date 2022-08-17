import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class Photo extends StatefulWidget {
  String path;

  Photo(String path);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PhotoState(path);
  }
}

class _PhotoState extends State<Photo> {
  String path;

  _PhotoState(this.path);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Photo Date",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.share_outlined, color: Colors.black,),
                      Text("Share", style: TextStyle(color: Colors.black, fontSize: 12),)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.edit_outlined, color: Colors.black,),
                      Text("Edit", style: TextStyle(color: Colors.black, fontSize: 12),)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(top: 3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.delete_outlined, color: Colors.black,),
                      Text("Delete", style: TextStyle(color: Colors.black, fontSize: 12),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: Center(
            child: Container(
                child: PhotoView(
                  imageProvider: AssetImage(path),
                  minScale: PhotoViewComputedScale.contained *0.8,
                  maxScale: PhotoViewComputedScale.covered*2,
                )
            ),
            //margin: EdgeInsets.all(5))
            )
    );
  }
}
