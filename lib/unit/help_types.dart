import 'package:pet/helper/helper_list_page.dart';

class HelpTypes{

  //帮助类型
  List<HelpType> typeList = [
    HelpType(
      url: 'assets/icons/p1.png',
      type: '宠物健康',
    ),
    HelpType(
      url: 'assets/icons/p7.png',
      type: '宠物走失',
    ),
    HelpType(
      url: 'assets/icons/p2.png',
      type: '宠物百科',
    ),
    HelpType(
      url: 'assets/icons/p3.png',
      type: '宠物训练',
    ),
    HelpType(
      url: 'assets/icons/p4.png',
      type: '养宠知识',
    ),
    HelpType(
      url: 'assets/icons/p5.png',
      type: '我来帮忙',
    ),
    HelpType(
      url: 'assets/icons/p8.png',
      type: '其他',
    ),
  ];

  List<HelpType> getTypeList() {
    return typeList;
  }
}

class ServicesTypes{

  //帮助类型
  List<ServiceType> typeList = [
    ServiceType(
      url: 'assets/icons/p1.png',
      type: '宠物医院',
    ),
    ServiceType(
      url: 'assets/icons/p5.png',
      type: '宠物美容',
    ),
    ServiceType(
      url: 'assets/icons/p6.png',
      type: '流浪救助',
    ),
    ServiceType(
      url: 'assets/icons/p7.png',
      type: '短期寄养',
    ),
    ServiceType(
      url: 'assets/icons/p2.png',
      type: '宠物领养',
    ),
    ServiceType(
      url: 'assets/icons/p8.png',
      type: '其他',
    ),
  ];

  List<ServiceType> getTypeList() {
    return typeList;
  }
}

class CircleTypes{

  //帮助类型
  List<CircleType> typeList = [
    CircleType(
      url: 'assets/icons/p1.png',
      type: '推荐',
    ),
    CircleType(
      url: 'assets/icons/p5.png',
      type: '热门',
    ),
    CircleType(
      url: 'assets/icons/p6.png',
      type: '搞笑',
    ),
    CircleType(
      url: 'assets/icons/p7.png',
      type: '动图',
    ),
    CircleType(
      url: 'assets/icons/p6.png',
      type: '小视频',
    ),
  ];

  List<CircleType> getTypeList() {
    return typeList;
  }
}

class HelpType{
  String url;
  String type;

  HelpType({this.url,this.type});
}

class ServiceType{
  String url;
  String type;

  ServiceType({this.url,this.type});
}

class CircleType{
  String url;
  String type;

  CircleType({this.url,this.type});
}