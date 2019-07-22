import 'package:flutter/material.dart';
import 'package:pet/models/circle/circle.dart';


class CircleContextPage extends StatefulWidget{
  CircleModel model;

  CircleContextPage({
    this.model
  });

  @override
  _CircleContextPageState createState() =>
      _CircleContextPageState();
}

class _CircleContextPageState extends State<CircleContextPage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,),
      child: Text(
        '这是一段很有魔性的文字，因为我不知道该写什么东西！！',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }

}