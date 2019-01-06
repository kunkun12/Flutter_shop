import 'package:flutter/material.dart';
import 'package:flutter_shop/model.dart';
import 'package:flutter_shop/constants/index.dart';
import '../../utils/utils.dart';

class RecommendFloor extends StatelessWidget {
  final ProductListModel data;
  RecommendFloor(this.data);
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.5),
      child: _build(deviceWidth),
    );
  }

  Widget _build(double deviceWidth) {
    List<ProductItemModel> items = data.items;

    double itemWidth = deviceWidth * 168.5 / 360;
    double imageWidth = deviceWidth * 110.0 / 360;
    List<Widget> listWidgets = items.map((i) {
      var bgColor = string2Color(i.bgColor);
      Color titleColor = string2Color(i.titleColor);
      Color subtitleColor = string2Color(i.subtitleColor);
      return Container(
          width: itemWidth,
          margin: EdgeInsets.only(bottom: 5, left: 2),
          padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                i.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: titleColor),
              ),
              Text(
                i.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: subtitleColor),
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5),
                child: Image.network(
                  i.picurl,
                  width: imageWidth,
                  height: imageWidth,
                ),
              )
            ],
          ));
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5, bottom: 10),
          child: Text(data.title, style: KfontConstant.fLoorTitleStyle),
        ),
        Wrap(
          spacing: 2,
          children: listWidgets,
        )
      ],
    );
  }
}
