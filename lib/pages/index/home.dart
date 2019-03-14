import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/index.dart';
import './firsttab.dart';
import './beautygirl.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 9,
        initialIndex: 0,
        child: Column(
          children: <Widget>[
            HomeTopBar(),
            KTabBarWidget(),
            Expanded(
                child: TabBarView(
              children: <Widget>[
                FisrtTabWidget(),
                //=['首页','性感美女','制服','清新美女','校园','古装','动漫','壁纸','苍老师'];
                BeautyGirlWidget(
                    /*key: PageStorageKey<String>('sexy'), */keyword: '性感美女'),
                BeautyGirlWidget(
                    /* key: PageStorageKey<String>('zhifu') ,*/ keyword: '制服美女'),
                BeautyGirlWidget(
                    /* key: PageStorageKey<String>('fresh') ,*/ keyword: '清新美女'),
                BeautyGirlWidget(keyword: '校园美女'),
                BeautyGirlWidget(keyword: '古装美女'),
                BeautyGirlWidget(keyword: '动漫美女'),
                BeautyGirlWidget(keyword: '美女壁纸'),
                BeautyGirlWidget(keyword: '苍老师'),
              ],
            ))
          ],
        ));
  }
}
