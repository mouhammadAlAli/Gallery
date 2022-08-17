import 'package:flutter/material.dart';

String images;


class GridPhotosByDate extends StatefulWidget{
  int index;
  bool selectedAllPhotosInGrid;
  GridPhotosByDate(this.index,{selectedAllPhotosInGrid=false});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GridPhotosByDateState(index,selectedAllPhotosInGrid);
  }
}
class _GridPhotosByDateState extends State<GridPhotosByDate>{
  int index;
  bool selectedAllPhotosInGrid=false;
  bool showCheckBox=false;


  _GridPhotosByDateState(this.index,this.selectedAllPhotosInGrid);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: [
            Container(width: 280,child: Text("10 June 2018",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),margin: EdgeInsets.only(left: 18,right: 10),),
            showCheckBox ? Checkbox(value: selectedAllPhotosInGrid,onChanged: (newVal){
              selectedAllPhotosInGrid=newVal;
            },):
            Container(child: SizedBox(width: 25,height: 25),margin: EdgeInsets.symmetric(vertical: 11),)
          ],
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (context, j) {
            return Container(
              child: Container(),
            );
          },
          itemCount: images[index].length,
        )
      ],
    );
  }
}