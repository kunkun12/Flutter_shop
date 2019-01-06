import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/index.dart';
import 'package:flutter_shop/model.dart';
import 'package:flutter_shop/utils/screen_util.dart';

class SearchResultListWidget extends StatelessWidget {
  final SearchResultListModal list;
  final ValueChanged<String> onItemTap;
  final VoidCallback getNextPage;
  SearchResultListWidget(this.list, {this.onItemTap,this.getNextPage});
  @override
  Widget build(BuildContext context) {
    return list.data.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: list.data.length,
            itemExtent: ScreenUtil().L(127),
            itemBuilder: (BuildContext context, int i) {
              SearchResultItemModal item = list.data[i];
              if((i+3)==list.data.length){
                getNextPage();
              }
              return Container(
                color: KColorConstant.searchAppBarBgColor,
                padding: EdgeInsets.only(
                    top: ScreenUtil().L(5), right: ScreenUtil().L(10)),
                child: Row(
                  children: <Widget>[
                    Image.network(
                      item.imageUrl,
                      width: ScreenUtil().L(120),
                      height: ScreenUtil().L(120),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: KColorConstant.divideLineColor))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.wareName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '￥${item.price}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: KColorConstant.priceColor),
                              ),
                              item.coupon == null
                                  ? SizedBox()
                                  : Container(
                                      child: Text(
                                        item.coupon,
                                        style: TextStyle(
                                            color: KColorConstant.themeColor),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 3),
                                      margin: EdgeInsets.only(left: 4),
                                      decoration: BoxDecoration(border: Border.all(width: 1,color:KColorConstant.themeColor)),
                                    )
                            ],
                          ),
                          Text(
                            '${item.commentcount}人评价 好评率${item.good}%',
                            style:
                                KfontConstant.searchResultItemCommentCountStyle,
                          ),
                          Text(
                            '${item.shopName}',
                            style:
                                KfontConstant.searchResultItemCommentCountStyle,
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              );
            },
          );
  }
}
