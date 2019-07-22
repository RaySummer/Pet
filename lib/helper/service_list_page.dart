import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pet/bloc/helper/helper_bloc.dart';
import 'package:pet/unit/help_types.dart';
import 'package:pet/unit/swiper_images.dart';
import 'package:pet/widget/cache_picture.dart';


class ServicePage extends StatefulWidget{
  AsyncSnapshot<ListData> snapshot;

  ServicePage({this.snapshot});

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>{

  List<Widget> imageList = SwiperImages().getImageList();

  //帮助类型
  List<ServiceType> typeList = ServicesTypes().getTypeList();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildSearchAndHelpType(),
          _buildCarouselPicture(),
          _buildServiceItem(),
        ],
      ),
    );
  }

  //轮播图
  Widget _buildCarouselPicture() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
        width: MediaQuery.of(context).size.width,
        height: 220.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 4,
//          viewportFraction: 0.8,
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: 200.0,
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
            print('点击了第$index个');
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
          _buildServicesTypeForListView(),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
      ),
    );
  }

  Widget _buildSearch(){
    return Container(
      margin: EdgeInsets.only(top: 0),
      child: Row(
        children: <Widget>[
//          Container(
//            margin: EdgeInsets.only(left: 10),
//            child: Row(
//              children: <Widget>[
//                Icon(
//                  Icons.location_on,
//                  color: Colors.black54,
//                ),
//                Text(
//                  '白云区',
//                ),
//              ],
//            ),
//          ),
          Expanded(
              child: _buildSearchWidget()
          ),
//          _buildSearchButton(),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }


  //页面的头（包括定位地址，搜索框，筛选条件)
  Widget _buildSearchWidget() {
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

  Widget _buildServicesTypeForListView(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap:true,
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
        }),
      ),
    );
  }

  Widget _buildServicesTypeForGridView(){
    return Container(
      child: GridView.count(
          shrinkWrap:true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          //宽高比
          childAspectRatio: 1 / 1.15,
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

  Widget _buildServiceItem(){
    return Column(
      children: <Widget>[
        _buildItem(),
        _buildItem(),
        _buildItem(),
      ],
    );
  }

  Widget _buildItem(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildItemHead(),
          _buildItemContent(),
          _buildItemBottom(),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildItemHead(){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: CachePicture(
              url: 'http://b-ssl.duitang.com/uploads/item/201808/21/20180821215317_kepjr.jpeg',
              borderRadius: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black38,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                     Expanded(
                       child: Container(
                            child: Text(
                              '小猫小狗助养中心',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                     ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/icons/identification.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '500M',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.fromLTRB(10,0,20,0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '专注照顾小猫小狗30年，有专业的团队支撑，悉心呵护您的小宠物。。',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
//          Container(
//            child: Text(
//              '888 M',
//              style: TextStyle(
//                color: Colors.black54,
//              ),
//            ),
//          )
        ],
      ),
    );
  }

  Widget _buildItemContent(){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  child: CachePicture(
                    url: 'http://b-ssl.duitang.com/uploads/item/201808/21/20180821215317_kepjr.jpeg',
                    borderRadius: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: CachePicture(
                    url: 'http://b-ssl.duitang.com/uploads/item/201808/21/20180821215317_kepjr.jpeg',
                    borderRadius: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: CachePicture(
                    url: 'http://b-ssl.duitang.com/uploads/item/201808/21/20180821215317_kepjr.jpeg',
                    borderRadius: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: CachePicture(
                    url: 'http://b-ssl.duitang.com/uploads/item/201808/21/20180821215317_kepjr.jpeg',
                    borderRadius: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemBottom(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '进去看看',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

}