import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/index.dart';
import 'package:flutter_shop/model.dart';
import 'package:flutter_shop/constants/index.dart';

//大的占一行
class BigCrowdFundingWidget extends StatelessWidget {
  final CrowdFundItemModel data;
  final AnimationController controller;
  BigCrowdFundingWidget(this.data, {this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(249, 243, 233, 1),
          padding: EdgeInsets.only(left: 14.5, top: 14.5, right: 14.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.5, color: Colors.black),
                    ),
                    Text(
                      data.summary,
                      maxLines: 1,
                      style:
                          TextStyle(color: Color.fromRGBO(153, 153, 153, 1.0)),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '￥' + (data.marketPrice / 100).toString(),
                      style: TextStyle(
                          color: KColorConstant.priceColor,
                          fontSize: 15,
                          height: 1.5),
                    )
                  ],
                ),
              ),
              Image.network(
                data.picUrl,
                width: 114,
                height: 114,
              )
            ],
          ),
        ),
        ProgressBar(
          data,
          Color.fromRGBO(249, 243, 233, 1),
          controller: controller,
        )
      ],
    );
  }
}

class LittleCrowdFundingWidget extends StatelessWidget {
  final CrowdFundItemModel data;
  final AnimationController controller;
  LittleCrowdFundingWidget(this.data, {this.controller});
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double imageWidth = 86 * deviceWidth / 360;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 12, right: 3.5, top: 14.5),
          margin: EdgeInsets.only(top: 3),
          color: Color.fromRGBO(248, 248, 248, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data.name,
                style: TextStyle(fontSize: 15.5, color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '￥' + (data.marketPrice / 100).toString(),
                    style: TextStyle(
                        color: KColorConstant.priceColor,
                        fontSize: 15,
                        height: 1.5),
                  ),
                  Image.network(data.picUrl,
                      width: imageWidth, height: imageWidth)
                ],
              )
            ],
          ),
        ),
        ProgressBar(data, Color.fromRGBO(248, 248, 248, 1),
            controller: controller)
      ],
    );
  }
}

class CrowdFundingFloor extends StatelessWidget {
  final CrowdFundingListModel data;
  final AnimationController controller;
  CrowdFundingFloor({Key key, this.data, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      padding: EdgeInsets.all(7.5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromRGBO(244, 244, 244, 1.0), width: 5.0))),
      child: _build(deviceWidth),
    );
  }

  Widget _build(double deviceWidth) {
    List<CrowdFundItemModel> items = data.items;
    return Column(children: <Widget>[
      BigCrowdFundingWidget(items[0], controller: controller),
      Row(
        children: <Widget>[
          Expanded(
            child: LittleCrowdFundingWidget(
              items[1],
              controller: controller,
            ),
          ),
          Container(
            width: 4,
            color: Colors.white,
          ),
          Expanded(
            child: LittleCrowdFundingWidget(items[2], controller: controller),
          )
        ],
      )
    ]);
  }
}
