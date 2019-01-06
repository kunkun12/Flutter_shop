import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/index.dart';

class SearchListTopBarTitleWidget extends StatelessWidget {
  final String keyworld;
  SearchListTopBarTitleWidget({Key key, this.keyworld}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Klength.searchTxtFieldHeight,
        padding: EdgeInsets.only(left: 10),
        margin: EdgeInsets.only(right: 30),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: KColorConstant.divideLineColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: KColorConstant.floorTitleColor,
                  size: 20,
                ),
                Text(
                  keyworld,
                  style: KfontConstant.defaultStyle,
                ),
              ],
            )));
  }
}
