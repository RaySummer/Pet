import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet/models/models.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryExample extends StatelessWidget {
  void open(BuildContext context, final int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GalleryPhotoViewWrapper(
            galleryItems: galleryItems,
            backgroundDecoration: const BoxDecoration(
              color: Colors.black,
            ),
            initialIndex: index,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GalleryExampleItemThumbnail(
                        galleryExampleItem: galleryItems[0],
                        onTap: () {
                          open(context, 0);
                        },
                      ),
                      GalleryExampleItemThumbnail(
                        galleryExampleItem: galleryItems[2],
                        onTap: () {
                          open(context, 2);
                        },
                      ),
                      GalleryExampleItemThumbnail(
                        galleryExampleItem: galleryItems[3],
                        onTap: () {
                          open(context, 3);
                        },
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}

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
  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Container(
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
                  itemCount: galleryItems.length,
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
  const GalleryExampleItemThumbnail(
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
          onLongPress: (){

          },
          child: Hero(
            tag: galleryExampleItem.id,
            child: Image.network(galleryExampleItem.url, height: 80.0),
          ),
        ));
  }
}

List<MediaModel> galleryItems = <MediaModel>[
  MediaModel(
    name: "tag1",
    url: 'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1561446752&di=31c13611d5076309eb2e1cdc607221f7&src=http://hbimg.b0.upaiyun.com/5eef0ed7e64c1f68661687506388cace446e1a3cb01e5-jFObah_fw658',
  ),
  MediaModel(
    name: "tag2",
    url: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561528441494&di=f74fbe2e76a5082d975b4be18cef3a74&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201608%2F03%2F20160803093833_eRyhc.thumb.700_0.jpeg',
  ),
  MediaModel(
    name: "tag3",
    url: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=259655612,4126868174&fm=26&gp=0.jpg',
  ),
  MediaModel(
    name: "tag4",
    url: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561457125459&di=0bfd97a9f5865905cea03febd0151622&imgtype=0&src=http%3A%2F%2Fpuui.qpic.cn%2Fqqvideo_ori%2F0%2Fe0860cw6hv8_496_280%2F0',
  ),
];
