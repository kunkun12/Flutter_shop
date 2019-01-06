import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/index.dart';
import '../../data/find.dart';
import 'package:flutter_shop/model.dart';
import 'package:flutter_shop/constants/index.dart';
class PinWei extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PinWeiState();
}

class PinWeiState extends State<PinWei> {
  List dataList1 = [];
  _processPinweidata() {
    dataList1 = [];
    var rags = finddata['data']['rags'];
    rags.forEach((rag) {
      if (rag['editorName'] == 'pinwei_home_floor') {
        dataList1.add({'editorName':'pinwei_home_floor_title','title': rag['title'], 'url': rag['more']});
      }
      (rag['rags'] as List).forEach((dynamic r) {
        if (r['title'] == '') {
          r['title'] = rag['title'];
        }
        dataList1.add(r);
      });
    });
    //  print(dataList1);
  }

  @override
  void initState() {
    _processPinweidata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TopBarWidget(KString.pinweiTitle),
        Expanded(
          child: ListView.builder(
            
            itemCount: this.dataList1.length,
            itemBuilder: (BuildContext context, int i) {
              var data = dataList1[i];
              String editorName = data['editorName'];
              switch (editorName) {
                case "pinwei_home_banner":
                  return PinweiBannerWidget(
                      BannerListModel.fromJson(data['banners']));
                case "pinwei_home_kingkong":
                  return PinWeiKingKongWidget(
                    data: KingKongList.fromJson(data['items']),
                  );
                case 'pinwei_home_big_article':
                  return PinweiHomeBigArticleWidget(
                      data: PinweiHomeBigArticleModel.fromJson(data));
                case 'pinwei_home_article_cover':
                  return PinweiHomeArticleCoverWidget(
                      PinWeiHomeArticleCoverModel.fromJson(data));
                case 'pinwei_home_floor_title':
                return PinWeiFloorTitleWidget(PinWeiFloorTitleModel.fromJson(data));
              }
              return SizedBox();
            },
            padding: EdgeInsets.all(0),
          ),
        )
      ],
    );
  }
}
