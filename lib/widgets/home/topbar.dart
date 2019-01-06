import 'package:flutter/material.dart';

import 'package:flutter_shop/pages/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/i10n/localization_intl.dart';
class HomeTopBar extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          top: statusBarHeight, left: 10, right: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          FlutterLogo(),
          Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: () {
                     Navigator.push(context,CupertinoPageRoute(builder: (BuildContext context){
                        return  SearchPage();
                     }));
                },
                child: Container(
                  height: 34.0,
                  padding: EdgeInsets.all(5.0),
                  color: Color.fromRGBO(238, 238, 238, 0.5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.search,
                          color: Color(0xFF979797),
                          size: 22,
                        ),
                      ),
                      Text(
                        KKLocalizations.of(context).search,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Color(0xFF979797),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 6.0),
            child: Icon(
              Icons.add_alert,
              size: 25.0,
              color: Color.fromRGBO(132, 95, 63, 1.0),
            ),
          )
        ],
      ),
    );
  }
}
