import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CachePicture extends StatefulWidget {
  String url;
  double width;
  double height;
  double spinKitRingSize;
  double spinKitRingLineWidth;
  double borderRadius;
  Color spinKitRingColor;
  BoxFit fit;

  CachePicture(
      {this.url,
      this.width: 100,
      this.height: 100,
      this.spinKitRingSize: 30,
      this.spinKitRingLineWidth: 2,
      this.spinKitRingColor: Colors.black12,
      this.fit : BoxFit.fill,
      this.borderRadius: 0});

  @override
  _CachePictureState createState() => _CachePictureState();
}

class _CachePictureState extends State<CachePicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: CachedNetworkImage(
            width: widget.width,
            height: widget.height,
            imageUrl: '${widget.url}',
            fit: BoxFit.fill,
            imageBuilder: (context, imageProvider) => Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: widget.fit,
                    ),
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                ),
            placeholder: (context, url) => SpinKitRing(
                  color: widget.spinKitRingColor,
                  lineWidth: widget.spinKitRingLineWidth,
                  size: widget.spinKitRingSize,
                ),
            errorWidget: (context, url, error) => SpinKitRing(
                  color: widget.spinKitRingColor,
                  lineWidth: widget.spinKitRingLineWidth,
                  size: widget.spinKitRingSize,
                )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ));
  }
}
