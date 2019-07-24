import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pet/bloc/helper/helper_bloc.dart';
import 'package:pet/models/helper/helper.dart';
import 'package:pet/unit/date_util.dart';
import 'package:pet/unit/help_types.dart';
import 'package:pet/unit/swiper_images.dart';
import 'package:pet/widget/cache_picture.dart';
import 'package:pet/widget/video_player.dart';

class HelperPage extends StatefulWidget {
  AsyncSnapshot<ListData> snapshot;

  HelperPage({this.snapshot});

  @override
  _HelperPageState createState() => _HelperPageState();
}

class _HelperPageState extends State<HelperPage> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  // 声明一个list，存放image Widget
  List<Widget> imageList = SwiperImages().getImageList();

  //帮助类型
  List<HelpType> typeList = HelpTypes().getTypeList();

  List<Widget> _widgetList = new List();



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildSearchAndHelpType(),
          _buildCarouselPicture(),
          _buildServicesItem(),
        ],
      ),
    );
  }

  //轮播图
  Widget _buildCarouselPicture() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 220.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 4,
//          viewportFraction: 0.8,
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: 220.0,
          layout: SwiperLayout.STACK,
//          scale: 0.9,
//          scrollDirection: Axis.horizontal,
          autoplay: true,
          pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
              builder: DotSwiperPaginationBuilder(
                  color: Colors.black54, activeColor: Colors.white)),
          onTap: (index) {
            //动态读取图片时可以增加H5的链接跳转
//            print('点击了第$index个');
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => VideoApp()
            ),
            );

          },
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 1.0,
                  spreadRadius: 0.0),
            ],
            borderRadius: BorderRadius.all(
                Radius.circular(10)
            )
        )
    );
  }

  //轮播图自动调用图片方法
  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }

  Widget _buildSearchAndHelpType(){
    return Container(
      child: Column(
        children: <Widget>[
          _buildSearch(),
          _buildHelpTypeForListView(),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Container(
        height: 35,
        padding:EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300], width: 0.5),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(1.0, 1.0),
                blurRadius: 5.0,
                spreadRadius: 0.0),
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.only(left: 2),
          child: Row(
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.black54,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    '搜点什么。。。。',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpTypeForListView(){
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap:true,
        children: List.generate(typeList.length, (index) {
          return Container(
            margin: EdgeInsets.fromLTRB( 10,0,0,10),
            child: Column(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        '${typeList[index].url}',
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.0),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    '${typeList[index].type}',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  //GridView 方式显示
  Widget _buildHelpTypeForGridView(){
    return Container(
      child: GridView.count(
          shrinkWrap:true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          //宽高比
          childAspectRatio: 1 / 1.2,
          children: List.generate(typeList.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          '${typeList[index].url}',
                        ),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0,
                            spreadRadius: 0.0),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      '${typeList[index].type}',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
      ),
    );
  }

  Widget _buildServicesTypes(){
    return Container(
      child: ListView(
        shrinkWrap: true,
        //是否能滚动
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        children: _bildStatusIcon(context),
      ),
    );
  }

  List<Widget> _bildStatusIcon(BuildContext context) {
    for (int i = 0; i < typeList.length; i++) {
      _widgetList.add(
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        '${typeList[i].url}',
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.0),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    '${typeList[i].type}',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          )
      );
    }

    return _widgetList;
  }


  Widget _buildServicesItem(){
    return Column(
      children: widget.snapshot.data.data.map((model) {
        return _buildItem(model);
      }).toList(),
    );
  }

  Widget _buildItem(HelperModel model){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildItemHead(model),
          _buildItemContent(model),
          _buildItemBottom(model),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
    );
  }

  Widget _buildItemHead(HelperModel model){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            child: CachePicture(
              url: '${model.userPic}',
              borderRadius: 100,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black38,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '${model.userName}',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              '${DateFormatUtil.formatMD(DateTime.now())}',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemContent(HelperModel model) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildContentTitle(model.title),
          _buildContentMain(model.content),
          _buildContentPhoto(model.mediaModel.url,model.medias.length),
        ],
      ),
    );
  }

  Widget _buildItemBottom(HelperModel model){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildForwardCount(model.forwardCount),
          _buildCommentCount(model.commentCount),
          _buildPraiseCount(model.praiseCount),
        ],
      ),
    );
  }

  //标题
  Widget _buildContentTitle(String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                '${title}',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //正文
  Widget _buildContentMain(String content){
    return Container(
      margin: EdgeInsets.all(5),
      child: Text(
        '${content}',
        style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14
        ),
      ),
    );
  }

  //图片
  Widget _buildContentPhoto(String url,int count){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CachePicture(
              width: MediaQuery.of(context).size.width,
              height: 200,
              url:'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=259655612,4126868174&fm=26&gp=0.jpg',
              fit: BoxFit.cover,
            borderRadius: 10,
          ),
          Container(
            width: 20,
            height: 20,
            child: Center(
              child: Text(
                '${count}',
                style: TextStyle(
                    color: Colors.grey[700]
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  //评论
  Widget _buildCommentCount(int count){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.chat_bubble_outline,
              size: 16,
              color: Colors.black54,
            ),
          ),
          Container(
            child: Text(
              '${count}',
              style: TextStyle(
                  color: Colors.black54
              ),
            ),
          )
        ],
      ),
    );
  }
  //转发
  Widget _buildForwardCount(int count){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.call_missed_outgoing,
              size: 16,
              color: Colors.black54,
            ),
          ),
          Container(
            child: Text(
              '${count}',
              style: TextStyle(
                  color: Colors.black54
              ),
            ),
          )
        ],
      ),
    );
  }
  //点赞
  Widget _buildPraiseCount(int count){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.favorite,
              size: 16,
              color: Colors.red[400],
            ),
          ),
          Container(
            child: Text(
              '${count}',
              style: TextStyle(
                  color: Colors.black54
              ),
            ),
          )
        ],
      ),
    );
  }

}

