import 'package:flutter/material.dart';
import 'package:flutter_shop/model.dart';
import 'package:flutter_shop/utils/screen_util.dart';

class HomeKingKongWidget extends StatelessWidget {
  final KingKongList data;
  final String bgurl;
  final String fontColor;
  HomeKingKongWidget({this.data, this.bgurl, this.fontColor});
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    double height = ScreenUtil().L(80);
    return Container(
      width: deviceWidth,
      height: height,
      child: _buildRow(deviceWidth),
      decoration: bgurl != ''
          ? BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(bgurl), fit: BoxFit.cover))
          : null,
    );
  }

  Row _buildRow(double deviceWidth) {
    var colorInt = int.parse(fontColor.replaceAll('#', '0x'));
    Color color = new Color(colorInt).withOpacity(1.0);
    double iconWidth = ScreenUtil().L(58);
    double iconHeight = ScreenUtil().L(47);
    List<Widget> widgets = data.items.map((i) {
      return Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            i.picUrl,
            width: iconWidth,
            height: iconHeight,
          ),
          Text(
            i.title,
            style: TextStyle(
                fontSize: 13.0,
                height: 1.5,
                decoration: TextDecoration.none,
                color: color),
          )
        ],
      ));
    }).toList();
    return Row(
      children: widgets,
    );
  }
}
