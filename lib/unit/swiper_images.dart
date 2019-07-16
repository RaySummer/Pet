import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SwiperImages{

  List<Widget> imageList = [
    Container(
      child: CachedNetworkImage(
          imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1561446752&di=31c13611d5076309eb2e1cdc607221f7&src=http://hbimg.b0.upaiyun.com/5eef0ed7e64c1f68661687506388cace446e1a3cb01e5-jFObah_fw658',
          fit: BoxFit.fill,
          placeholder: (context, url) =>  SpinKitRing(
            color: Colors.black12,
            lineWidth:2,
            size: 30.0,
          ),
          errorWidget: (context, url, error) => SpinKitRing(
            color: Colors.black12,
            lineWidth:2,
            size: 30,
          )
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          )
      ),
    ),
    Container(
      child: CachedNetworkImage(
          imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561528441494&di=f74fbe2e76a5082d975b4be18cef3a74&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201608%2F03%2F20160803093833_eRyhc.thumb.700_0.jpeg',
          fit: BoxFit.fill,
          placeholder: (context, url) =>  SpinKitRing(
            color: Colors.black12,
            lineWidth:2,
            size: 30.0,
          ),
          errorWidget: (context, url, error) => SpinKitRing(
            color: Colors.black12,
            lineWidth:2,
            size: 30,
          )
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          )
      ),
    ),
    Container(
      child: CachedNetworkImage(
          imageUrl: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=259655612,4126868174&fm=26&gp=0.jpg',
          fit: BoxFit.fill,
          placeholder: (context, url) =>  SpinKitRing(
            color: Colors.black12,
            lineWidth:2,
            size: 30.0,
          ),
          errorWidget: (context, url, error) => SpinKitRing(
            color: Colors.black12,
            lineWidth:2,
            size: 30,
          )
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          )
      ),
    ),
    Container(
      child: CachedNetworkImage(
          imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561457125459&di=0bfd97a9f5865905cea03febd0151622&imgtype=0&src=http%3A%2F%2Fpuui.qpic.cn%2Fqqvideo_ori%2F0%2Fe0860cw6hv8_496_280%2F0',
          fit: BoxFit.fill,
          placeholder: (context, url) =>  SpinKitRing(
            color: Colors.black12,
            lineWidth:2,
            size: 30.0,
          ),
          errorWidget: (context, url, error) => SpinKitRing(
            color: Colors.black12,
            lineWidth:2,
            size: 30,
          )
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          )
      ),
    ),
  ];

  List<Widget> getImageList() {
    return imageList;
  }

  List<String> getImageUrl(){
      return [
        'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1561446752&di=31c13611d5076309eb2e1cdc607221f7&src=http://hbimg.b0.upaiyun.com/5eef0ed7e64c1f68661687506388cace446e1a3cb01e5-jFObah_fw658',
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561528441494&di=f74fbe2e76a5082d975b4be18cef3a74&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201608%2F03%2F20160803093833_eRyhc.thumb.700_0.jpeg',
        'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=259655612,4126868174&fm=26&gp=0.jpg',
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561457125459&di=0bfd97a9f5865905cea03febd0151622&imgtype=0&src=http%3A%2F%2Fpuui.qpic.cn%2Fqqvideo_ori%2F0%2Fe0860cw6hv8_496_280%2F0',
      ];
  }

}