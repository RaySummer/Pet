import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet/models/models.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;
import 'package:permission_handler/permission_handler.dart';
import 'package:pet/widget/toast.dart';


//class GalleryExample extends StatelessWidget {
//  void open(BuildContext context, final int index) {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//          builder: (context) => GalleryPhotoViewWrapper(
//            galleryItems: galleryItems,
//            backgroundDecoration: const BoxDecoration(
//              color: Colors.black,
//            ),
//            initialIndex: index,
//          ),
//        ));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
//          Expanded(
//              child: Center(
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      GalleryExampleItemThumbnail(
//                        galleryExampleItem: galleryItems[0],
//                        onTap: () {
//                          open(context, 0);
//                        },
//                      ),
//                      GalleryExampleItemThumbnail(
//                        galleryExampleItem: galleryItems[2],
//                        onTap: () {
//                          open(context, 2);
//                        },
//                      ),
//                      GalleryExampleItemThumbnail(
//                        galleryExampleItem: galleryItems[3],
//                        onTap: () {
//                          open(context, 3);
//                        },
//                      ),
//                    ],
//                  ))),
//        ],
//      ),
//    );
//  }
//}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper(
      {this.loadingChild,
        this.backgroundDecoration,
        this.minScale,
        this.maxScale,
        this.initialIndex,
        @required this.galleryItems})
      : pageController = PageController(initialPage: initialIndex);

  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<MediaModel> galleryItems;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  int currentIndex;
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
    var permission = PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print("permission status is " + permission.toString());
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage, // 在这里添加需要的权限
    ]);
  }



  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _saved(List<MediaModel> list, int index) async {
    RenderRepaintBoundary boundary =
    _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData =
    await image.toByteData(format: ui.ImageByteFormat.png);
//    final result = await ImageGallerySaver.save(byteData.buffer.asUint8List());

    Uri uri = Uri();

    ByteData bytes = await NetworkAssetBundle(uri).load(list[index].url);

    final result = await ImageGallerySaver.save(bytes.buffer.asUint8List());

    Toast.toast(
        context, msg: result ? '保存成功' : '保存失败', position: ToastPosition.bottom);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      onLongPress: (){
        _saved(widget.galleryItems,currentIndex);
      },
      child: Scaffold(
        body: RepaintBoundary(
          key: _globalKey,
          child: Container(
              decoration: widget.backgroundDecoration,
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height,
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: _buildItem,
                    itemCount: widget.galleryItems.length,
                    loadingChild: widget.loadingChild,
                    backgroundDecoration: widget.backgroundDecoration,
                    pageController: widget.pageController,
                    onPageChanged: onPageChanged,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Image ${currentIndex + 1}",
                      style: const TextStyle(
                          color: Colors.white, fontSize: 17.0, decoration: null),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final MediaModel item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: NetworkImage(item.url),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 1.1,
      heroTag: item.id,
    );
  }
}

class GalleryExampleItem {
  GalleryExampleItem({this.id, this.resource, this.isSvg = false});

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  GalleryExampleItemThumbnail(
      {Key key, this.galleryExampleItem, this.onTap})
      : super(key: key);

  final MediaModel galleryExampleItem;

  final GestureTapCallback onTap;




  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: GestureDetector(
          onTap: onTap,
          child: Hero(
            tag: galleryExampleItem.id,
            child: Image.network(galleryExampleItem.url, height: 80.0),
          ),
        ));
  }

}
