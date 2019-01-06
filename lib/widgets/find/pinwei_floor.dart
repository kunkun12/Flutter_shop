import 'package:flutter/material.dart';
import 'package:flutter_shop/model.dart';
import 'package:flutter_shop/utils/screen_util.dart';
import 'package:flutter_shop/constants/index.dart';
import 'package:flutter/widgets.dart';

class PinWeiFloorTitleWidget  extends StatelessWidget{
   final PinWeiFloorTitleModel data;
   PinWeiFloorTitleWidget(this.data);
    @override
      Widget build(BuildContext context) {
       return   Container(
          height: ScreenUtil().L(50),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: KColorConstant.divideLineColor,
                      width: ScreenUtil().L(10)))),
          child: Text(
            data.title,
            style: KfontConstant.fLoorTitleStyle,
          ),
        );
      
      }
}

class _GoodsListWidget extends StatelessWidget {
  final List<PinWeiGoodsModel> goodsList;
  _GoodsListWidget({Key key, this.goodsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: goodsList.map((i) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Image.network(
                  i.picUrl,
                  width: ScreenUtil().L(100),
                  height: ScreenUtil().L(100),
                ),
                Container(
                  width: ScreenUtil().L(100),
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        i.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '￥${i.price}',
                        style: TextStyle(
                            color: KColorConstant.priceColor, height: 1.5),
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ));
  }
}

class PinweiHomeBigArticleWidget extends StatelessWidget {
  final PinweiHomeBigArticleModel data;
  PinweiHomeBigArticleWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(data.picUrl,
            width: ScreenUtil().L(330), height: ScreenUtil().L(92)),
        _GoodsListWidget(
          goodsList: data.goodsList,
        )
      ],
    );
  }
}

class PinweiHomeArticleCoverWidget extends StatelessWidget {
  final PinWeiHomeArticleCoverModel data;
  PinweiHomeArticleCoverWidget(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7, bottom: 15, left: 15, right: 15),
      child: Column(
        children: <Widget>[
          Image.network(data.picurl,
              width: ScreenUtil().L(330), height: ScreenUtil().L(160)),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 8),
            child: Text(
              data.title,
              style: KfontConstant.fLoorTitleStyle,
            ),
          ),
          Text(
            data.subtitle,
            style: KfontConstant.pinweiCorverSubtitleStyle,
          ),
          Container(
            color: KColorConstant.pinweicorverBtbgColor,
            width: 64,
            height: 26,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top:10,bottom: 8),
            child: Text(KString.pinweigoFindTxt,
                style: TextStyle(
                    color: KColorConstant.pinweicorverBtTxtColor,
                    fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
