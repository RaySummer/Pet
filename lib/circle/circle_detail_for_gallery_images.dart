import 'dart:core';

import 'package:flutter/material.dart';
import 'package:pet/models/circle/circle.dart';
import 'package:pet/models/models.dart';
import 'package:pet/unit/gallery.dart';
import 'package:pet/widget/cache_picture.dart';
import 'package:pet/widget/picture_gallery.dart';

///滑动画廊主键，
class CircleDetailForGalleryImagesPage extends StatefulWidget {
  CircleModel model;

  CircleDetailForGalleryImagesPage({this.model});

  @override
  _CircleDetailForGalleryImagesPageState createState() =>
      _CircleDetailForGalleryImagesPageState();
}

class _CircleDetailForGalleryImagesPageState extends State<CircleDetailForGalleryImagesPage> {
  // 声明一个list，存放image Widget
  List<MediaModel> galleryList = GalleryList().getGalleryItems();
  PageController pageController = PageController(initialPage: 0);
  int _curPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            _buildPictureList(),
            _buildPicList(),
          ],
        ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
    );
  }

  Widget _buildPictureList() {
    return Container(
      height: 250,
      child: PageView(
          scrollDirection: Axis.horizontal,
          onPageChanged: _changePage,
          controller: pageController,
          children: galleryList.map((media) =>
                _buildPicWidget(media),
          ).toList()),
    );
  }

  Widget _buildPicWidget(MediaModel media){
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GalleryPhotoViewWrapper(
                galleryItems: galleryList,
                backgroundDecoration: const BoxDecoration(
                  color: Colors.black54,
                ),
                initialIndex: _curPageIndex,
              ),
            ));
      },
      child: Container(
          child: CachePicture(
            url: media.url,
            width: 300,
            height: 250,
            borderRadius: 8,
          ),
      ),
    );
  }

  _changePage(int index) {
    setState(() {
      _curPageIndex = index;
    });
  }

  Widget _buildPicList(){
    return Container(
      height: 80,
      alignment: Alignment.bottomRight,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: galleryList.length,
        itemBuilder: (BuildContext context,int index){
          return _buildPic(context,galleryList[index],index);
        },
      ),
    );
  }

  Widget _buildPic(BuildContext context, MediaModel model, int index) {
    return GestureDetector(
        onTap: () {
          print(_curPageIndex);
          pageController.jumpToPage(index);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child: Stack(
            children: [
              Container(
                child: CachePicture(
                  url: '${model.url}',
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
              index == _curPageIndex ?
              Container() :
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(color: Color(0x90000000)),
              )
            ],
          ),
        ));
  }

}
