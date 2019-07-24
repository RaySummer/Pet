import 'package:pet/helper/helper_list_page.dart';
import 'package:pet/models/models.dart';
import 'package:pet/models/my/my.dart';

class MomentData{

  //帮助类型
  List<PetMomentModel> momentList = [
    PetMomentModel(
      title: '养宠第一天',
      context: '今天家里来了一位新的成员----小吉吉',
      createTime: DateTime.parse('2018-04-03'),
      video: MediaModel.fromJson({
        'url':'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=259655612,4126868174&fm=26&gp=0.jpg'
      }),
      pictures:  <MediaModel>[
        MediaModel.fromJson({
          'url': ''
        }),
        MediaModel.fromJson({
          'url': ''
        }),
      ],
      isPublic: true,
    ),
    PetMomentModel(
      title: '养宠第一周',
      context: '最美的不是下雨天，是曾与你躲过雨的屋檐',
      createTime: DateTime.parse('2018-04-10'),
      video: MediaModel.fromJson({
        'url':'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=259655612,4126868174&fm=26&gp=0.jpg'
      }),
      pictures:  <MediaModel>[
        MediaModel.fromJson({
          'url': ''
        }),
        MediaModel.fromJson({
          'url': ''
        }),
      ],
      isPublic: true,
    ),
    PetMomentModel(
      title: '养宠第一年',
      context: '让爱渗透了地面，我要的只是你在我身边',
      createTime: DateTime.parse('2018-04-03'),
      video: MediaModel.fromJson({
        'url':'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=259655612,4126868174&fm=26&gp=0.jpg'
      }),
      pictures:  <MediaModel>[
        MediaModel.fromJson({
          'url': ''
        }),
        MediaModel.fromJson({
          'url': ''
        }),
      ],
      isPublic: true,
    ),
  ];

  List<PetMomentModel> getList() {
    return momentList;
  }
}

