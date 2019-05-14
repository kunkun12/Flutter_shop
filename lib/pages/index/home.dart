import 'package:flutter_web/material.dart';
import 'package:flutter_cart/widgets/index.dart';
import './firsttab.dart';


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
                FisrtTabWidget(),
                FisrtTabWidget(),
                FisrtTabWidget(),
                FisrtTabWidget(),
                FisrtTabWidget(),
                FisrtTabWidget(),
                FisrtTabWidget(),
                FisrtTabWidget(),
              ],
            ))
          ],
        ));
  }
}
