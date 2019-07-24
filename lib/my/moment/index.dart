import 'package:flutter/material.dart';
import 'package:pet/models/my/my.dart';
import 'package:pet/unit/date_util.dart';
import 'package:pet/unit/moment_data.dart';
import 'package:pet/widget/cache_picture.dart';

///养宠时光
class PetMomentPage extends StatefulWidget{

  @override
  _PetMomentPageState createState() =>
      _PetMomentPageState();
}

class _PetMomentPageState extends State<PetMomentPage>{
  List<PetMomentModel> momentList = MomentData().getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: Colors.white,
        title: Text(
          '宠物时光',
          style: TextStyle(
              color: Colors.black54
          ),
        ),
        automaticallyImplyLeading: true,
        elevation: 0.5,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.share,
                size: 22,
              ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: _buildTimer(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget _buildTimer(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        itemCount: momentList.length,
        itemBuilder: (BuildContext context,int index){
          return _buildTimerItem(context,momentList[index],index);
        },
      ),
    );
  }


  //TimeLineUI
  Widget _buildTimerItem(BuildContext context,PetMomentModel model,int _index) {
    return Stack(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: _buildTimeLineData(context, model, _index)
        ),
        Positioned(
          top: 32.0,
          bottom: 0.0,
          left: 17.5,
          child: Container(
            height: double.infinity,
            width: 1.3,
            color: Colors.black45,
          ),
        ),
        Positioned(
          top: 16.0,
          left: 10.0,
          child: Container(
            height: 16.0,
            width: 16.0,
            child: Container(
              margin: EdgeInsets.all(0.0),
              height: 16.0,
              width: 16.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black45
              ),
            ),
          ),
        )
      ],
    );
  }

//TimeLineUI右边的Card部分
  Widget _buildTimeLineData(BuildContext context,PetMomentModel model,int _index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
            child: Row(
              children: <Widget>[
                Text(
                    '${model.title}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 18)
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
            child: Row(
              children: <Widget>[
                Text(
                    '${DateFormatUtil.formatYMD(model.createTime)}',
                    style: TextStyle(
                      color: Colors.black38,
                    )
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            '${model.context}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            )
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CachePicture(
                        url: model.video.url,
                        height: 150,
                      )
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }


}