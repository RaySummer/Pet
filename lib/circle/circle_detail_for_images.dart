import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pet/bloc/bloc_provider.dart';
import 'package:pet/bloc/circle/circle_bloc.dart';
import 'package:pet/models/circle/circle.dart';
import 'package:pet/unit/swiper_images.dart';

class CircleDetailForImagesPage extends StatefulWidget {
  CircleModel model;

  CircleDetailForImagesPage({this.model});

  @override
  _CircleDetailForImagesPageState createState() =>
      _CircleDetailForImagesPageState();
}

class _CircleDetailForImagesPageState extends State<CircleDetailForImagesPage> {
  // 声明一个list，存放image Widget
  List<Widget> imageList = SwiperImages().getImageList();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _buildCarouselPicture()
    );
  }



  //轮播图
  Widget _buildCarouselPicture() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
        width: MediaQuery.of(context).size.width,
        height: 300.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: imageList.length,
//          viewportFraction: 0.8,
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: 300.0,
          layout: SwiperLayout.TINDER,
//          scale: 0.9,
//          scrollDirection: Axis.horizontal,
          autoplay: false,
          pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
              builder: DotSwiperPaginationBuilder(
                  color: Colors.black54, activeColor: Colors.white)
          ),
          onTap: (index) {
            //动态读取图片时可以增加H5的链接跳转
            print('点击了第$index个');
          },
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }

  //轮播图自动调用图片方法
  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
}
