import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/index.dart';

class SearchTopBarLeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child:
          Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797), size: 26),
    );
  }
}

class SearchTopBarActionWidget extends StatelessWidget {
 final VoidCallback onActionTap;
  SearchTopBarActionWidget({this.onActionTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onActionTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          KString.searchBtTxt,
          style: TextStyle(
              color: KColorConstant.goPayBtBgColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SearchTopBarTitleWidget extends StatelessWidget {
  final ValueChanged<String> seachTxtChanged;
  final TextEditingController controller;
  SearchTopBarTitleWidget({Key key, this.seachTxtChanged,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Klength.searchTxtFieldHeight,
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: KColorConstant.divideLineColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.search,color: KColorConstant.floorTitleColor,size: 20,),
          Expanded(
            child: TextField(
              controller: controller ,
              onSubmitted: (s) {
                print(s);
              }, // 键盘回车键
              onChanged: seachTxtChanged,
              cursorWidth: 1.5,
              autofocus: true,
              cursorColor: KColorConstant.floorTitleColor,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  hintText: KString.homeSearchBarHint,
                  hintStyle: TextStyle(fontSize: 14),
                  border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}
