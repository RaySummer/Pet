import 'package:flutter/material.dart';
import 'package:pet/my/moment/index.dart';
import 'package:pet/widget/cache_picture.dart';


typedef void ClickAction();

class MyIndexPage extends StatefulWidget {
  @override
  _MyIndexPageState createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              _buildTop(),
              _buildCenterContent(),
            ],
          )
      ),
    );
  }

  //头部
  Widget _buildTop() {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildLogged(),
          _buildMyBehaviors(),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((8.0)),
        gradient: RadialGradient(colors: [ Color(0xffDAF9CA),Color(0xffB4EEB4)]),
      ),
    );
  }

  //未登录显示
  Widget _buildNotLogged() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: Row(
        children: <Widget>[
          Container(
            height: 80,
            child: Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
                ),
                radius: 40,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 0.5),
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular((50.0)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              '主人，您未登录呀！',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  //登录时显示
  Widget _buildLogged() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 30),
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            child: Container(
              child: CachePicture(
                url: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
                width: 80,
                height: 80,
                borderRadius: 40,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 0.5),
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular((50.0)),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Summer',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    '当你凝视深渊时，深渊也在凝视着你',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.aspect_ratio,
              color: Colors.black54,
              size: 22,
            ),
          )
        ],
      ),
    );
  }

  //我的行为（我的收藏，我的评论，我的点赞，我的发布，我的关注）
  Widget _buildMyBehaviors() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildBehavior(
              '我的收藏',
              Icon(
                Icons.star,
                color: Colors.black54,
                size: 20,
              )),
          _buildVerticalLine(),
          _buildBehavior(
              '我的评论',
              Icon(
                Icons.chat_bubble_outline,
                color: Colors.black54,
                size: 20,
              )),
          _buildVerticalLine(),
          _buildBehavior(
              '我的点赞',
              Icon(
                Icons.favorite,
                color: Colors.black54,
                size: 20,
              )),
          _buildVerticalLine(),
          _buildBehavior(
              '我的发布',
              Icon(
                Icons.content_paste,
                color: Colors.black54,
                size: 20,
              )),
          _buildVerticalLine(),
          _buildBehavior(
              '我的关注',
              Icon(
                Icons.add_box,
                color: Colors.black54,
                size: 20,
              )),
        ],
      ),
    );
  }

  //单个行为的显示
  Widget _buildBehavior(String text, Icon icon) {
    return Container(
      child: Column(
        children: <Widget>[
          icon,
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0x99FFFFFF),
              offset: Offset(5.0, 5.0),
              blurRadius: 25.0,
              spreadRadius: 20.0),
//          BoxShadow(color: Color(0xffB4EEB4),
//              offset: Offset(1.0, 1.0)
//          ),
//          BoxShadow(color: Color(0xFF0000FF))
        ],
      ),
    );
  }

  //竖线 间隔线
  Widget _buildVerticalLine() {
    return Container(
      height: 20,
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.white, width: 1))),
    );
  }

  //横线 间隔线
  Widget _buildHorizontalLine() {
    return Container(
      width: 260,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
    );
  }


  Widget _buildCenterContent(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildMenu(Icon(Icons.account_box,color: Colors.black54,),'个人资料',null),
          _buildHorizontalLine(),
          _buildMenu(Icon(Icons.group,color: Colors.black54),'我的好友',null),
          _buildHorizontalLine(),
          _buildMenu(Icon(Icons.pets,color: Colors.black54),'我的宠物',null),
          _buildHorizontalLine(),
          _buildMenu(Icon(Icons.timeline,color: Colors.black54),'宠物时光',null),
          _buildHorizontalLine(),
          _buildMenu(Icon(Icons.event,color: Colors.black54),'备忘提醒',null),
          _buildHorizontalLine(),
          _buildMenu(Icon(Icons.settings_applications,color: Colors.black54),'设置',null),
          _buildHorizontalLine(),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  jumpPage(){
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => PetMomentPage()),
    );
  }

  Widget _buildMenu(Icon icon,String text,ClickAction action){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => PetMomentPage()),
        );
      },
      child: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: icon,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Icons.keyboard_arrow_right,
                  color: Colors.black54
              ),
            ),
          ],
        ),
      ),
    );
  }


}
