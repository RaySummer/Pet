import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pet/bloc/bloc_provider.dart';
import 'package:pet/bloc/circle/circle_bloc.dart';
import 'package:pet/models/circle/circle.dart';
import 'package:pet/unit/swiper_images.dart';
import 'package:pet/widget/picture.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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
  List<String> imageUrls = SwiperImages().getImageUrl();
  List<Widget> smallImages = new List();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            _buildCarouselPicture(),
            _buildPicList(),
          ],
        )
    );
  }


  //轮播图
  Widget _buildCarouselPicture() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: imageList.length,
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: 300.0,
          layout: SwiperLayout.STACK,
          autoplay: false,
          onTap: (index) {
            //动态读取图片时可以增加H5的链接跳转
            setState(() {
              selectedIndex = index;
            });
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

  Widget _buildPicList(){
    return Container(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _buildPic(),
      ),
    );
  }

  List<Widget> _buildPic() {
    smallImages.clear();
    for (int i = 0; i < imageUrls.length; i++) {
      smallImages.add(
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GalleryPhotoViewWrapper(
                      galleryItems: galleryItems,
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.black54,
                      ),
                      initialIndex: i,
                    ),
                  ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  Container(
                    child: Image.network(
                      "${imageUrls[i]}",
                      width: i == selectedIndex ? 50 : 30,
                      height: i == selectedIndex ? 50 : 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                  i == selectedIndex ?
                  Container() :
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(color: Color(0x90000000)),
                  )
                ],
              ),
            ),
          ));
    }
    return smallImages;
  }

}


class SwiperPicPaginationBuilder extends SwiperPlugin {
  final Color activeColor;

  final Color color;

  final double activeSize;

  final double size;

  final double space;

  final Alignment alignment;

  final Key key;

  const SwiperPicPaginationBuilder(
      {this.activeColor,
        this.color,
        this.key,
        this.size: 10.0,
        this.activeSize: 10.0,
        this.alignment : Alignment.bottomRight,
        this.space: 3.0});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    if (config.itemCount > 20) {
      print(
          'The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation');
    }
    Color activeColor = this.activeColor;
    Color color = this.color;

    if (activeColor == null || color == null) {
      ThemeData themeData = Theme.of(context);
      activeColor = this.activeColor ?? themeData.primaryColor;
      color = this.color ?? themeData.scaffoldBackgroundColor;
    }

    List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(Container(
        width: 20,
        height: 20,
        key: Key('pagination_$i'),
        margin: EdgeInsets.all(space),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=259655612,4126868174&fm=26&gp=0.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ));
    }

    if (config.scrollDirection == Axis.vertical) {
      return new Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return new Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }
}