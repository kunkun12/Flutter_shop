import 'package:flutter_web/material.dart';
import 'package:flutter_cart/model.dart';
import 'package:flutter_cart/utils/screen_util.dart';

class _KingKongItemWidget extends StatelessWidget {
  final KingKongItem item;
  _KingKongItemWidget({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5,right: 5),
          child: Image.network(
            item.picUrl,
            width: ScreenUtil().L(70),
            height: ScreenUtil().L(60),
          ),
        ),
        Text(
          item.title,
          style: TextStyle(height: 2),
        )
      ],
    );
  }
}

class PinWeiKingKongWidget extends StatelessWidget {
  final KingKongList data;
  PinWeiKingKongWidget({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: data.items.map((KingKongItem item) {
          return _KingKongItemWidget(
            item: item,
          );
        }).toList(),
      ),
    );
  }
}
