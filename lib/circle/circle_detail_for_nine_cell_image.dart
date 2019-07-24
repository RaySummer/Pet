
import 'package:flutter/material.dart';
import 'package:pet/models/models.dart';
import 'package:pet/unit/gallery.dart';
import 'package:pet/widget/cache_picture.dart';
import 'package:pet/widget/picture_gallery.dart';

class CircleDetailForNineCellImages extends StatefulWidget{

  @override
  _CircleDetailForNineCellImagesState createState() =>
      _CircleDetailForNineCellImagesState();
}

class _CircleDetailForNineCellImagesState extends State<CircleDetailForNineCellImages>{
  List<MediaModel> mediaList = GalleryList().getGalleryItems();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          _buildPicGridView(),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
      ),
    );
  }


  Widget _buildPicGridView(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: GridView.count(
          shrinkWrap:true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          //宽高比
          children: List.generate(mediaList.length, (index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryPhotoViewWrapper(
                        galleryItems: mediaList,
                        backgroundDecoration: const BoxDecoration(
                          color: Colors.black54,
                        ),
                        initialIndex: index,
                      ),
                    ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                child: CachePicture(
                  url: mediaList[index].url,
                  width: 80,
                  height: 80,
                  borderRadius: 8,
                  fit: BoxFit.cover,
                ),
              ),
            );
          })
      ),
    );
  }

}