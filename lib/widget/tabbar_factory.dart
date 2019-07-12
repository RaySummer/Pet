import 'package:flutter/material.dart';
import 'package:pet/models/models.dart';

class TabBarFactory extends StatefulWidget{
  TabController controller;
  List<EnumModel> enumList;
  bool isScroll ;

  TabBarFactory({this.controller,this.enumList,this.isScroll = false});

  @override
  _TabBarFactoryState createState() => _TabBarFactoryState();
}

class _TabBarFactoryState extends State<TabBarFactory>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
          controller: widget.controller,
          indicatorWeight: 1.0,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Color(0xffB4EEB4),
          tabs: widget.enumList.map(
                (type) =>
                Tab(
                  child: Text(
                    type.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ),
          ).toList()
      ),
    );
  }

}