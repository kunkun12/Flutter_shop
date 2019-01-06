import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/index.dart';
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(top:MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color:KColorConstant.searchBarBgColor,width: 1.0))),
      padding: EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      child: Container(
        height: 27,
        padding: EdgeInsets.symmetric(horizontal: 6),
        alignment: Alignment.center,
        color: KColorConstant.searchBarBgColor,
        child: Row(
          children: <Widget>[
            Icon(Icons.search,size: 17,),
            Container(
              margin: EdgeInsets.only(left: 5) ,
              child: Text(KString.categorySearchBarHint,style: TextStyle(color: KColorConstant.searchBarTxtColor),),
            )
          ],
        ),
      ),
    );
  }
}
