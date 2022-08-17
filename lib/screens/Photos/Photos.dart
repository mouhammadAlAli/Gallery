import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:selectable_container/selectable_container.dart';
import 'package:smart_gallery/screens/Photos/PhotosByDate.dart';

var images = [

      ["images/ (1).jpg",
      "images/ (1).png",
      "images/ (2).jpg",
      "images/ (2).png",
      "images/ (3).jpg",
      "images/ (3).png"],
    [
      "images/ (1).jpg",
      "images/ (1).png",
      "images/ (2).jpg",
      "images/ (2).png"
    ],
    [
      "images/ (1).jpg",
      "images/ (1).png",
      "images/ (2).jpg",
      "images/ (2).png",
      "images/ (1).jpg",
      "images/ (1).png",
      "images/ (2).jpg",
      "images/ (2).png",
      "images/ (3).jpg",
      "images/ (3).png"
    ],

    [
      "images/ (1).jpg",
      "images/ (1).png",
      "images/ (2).jpg",
      "images/ (2).png",
      "images/ (3).jpg",
      "images/ (3).png",
      "images/ (1).jpg",
      "images/ (1).png",
      "images/ (2).jpg",
      "images/ (2).png",
      "images/ (3).jpg",
      "images/ (3).png",
    ],
  [
    "images/ (1).jpg",
    "images/ (1).png",
    "images/ (2).jpg",
    "images/ (2).png",
    "images/ (3).jpg",
    "images/ (3).png",
    "images/ (1).jpg",
    "images/ (1).png",
    "images/ (2).jpg",
    "images/ (2).png",
    "images/ (3).jpg",
    "images/ (3).png",
  ]
];

class Photos extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PhotoState();
  }
}

class _PhotoState extends State<Photos> {
  ScrollController sc ;
  bool showCheckBox=false;
  bool longPressFlag=false;
  List<int> indexList =  [];

  @override
  void initState() {
    // TODO: implement initState
    sc=ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: DraggableScrollbar.semicircle(
        /*labelTextBuilder: (offset){

          return Text("value");
        },*/
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: images.length,
            controller: sc,
            itemBuilder: (context, index) {
              return GridPhotosByDate(index);
            },
          )
          , controller: sc
      ),
    );
  }
  void longPress() {
    setState(() {
      if (indexList.isEmpty) {
        longPressFlag = false;
      } else {
        longPressFlag = true;
      }
    });
  }
}



Widget imageContainer(BuildContext context,String path,isSelected){
  bool selected=isSelected;
  return InkWell(
    child: SelectableContainer(
      selected: selected,
      child: Container(
        child: Image.asset(
          path,
          fit: BoxFit.fill,
          width: 100,
          height: 100,
        ),
      ),
    )
    ,
    onTap: (){
      Navigator.pushNamed(context, "Photo($path)");
    },
    onLongPress: (){},
  );
}
/*class d extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DraggableScrollbar.semicircle(
      controller: myScrollController,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        controller: myScrollController,
        padding: EdgeInsets.zero,
        itemCount: 1000,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(2.0),
            color: Colors.grey[300],
          );
        },
      ),
    );
  }
}*/


/*Column(
                children: [
                  Row(
                    children: [
                      Container(width: 280,child: Text("10 June 2018",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),margin: EdgeInsets.only(left: 18,right: 10),),
                      showCheckBox ? Checkbox(value: false,onChanged: (newVal){},):
                      Container(child: SizedBox(width: 25,height: 25),margin: EdgeInsets.symmetric(vertical: 11),)
                    ],
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),
                    itemBuilder: (context, j) {
                      return Container(
                        child: Container(),
                      );
                    },
                    itemCount: images[index].length,
                  )
                ],
              );*/