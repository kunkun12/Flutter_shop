import 'package:flutter/material.dart';
import 'package:flutter_shop/i10n/localization_intl.dart';
import 'package:flutter_shop/widgets/index.dart';
import 'package:flutter_shop/utils/screen_util.dart';
import 'package:flutter_shop/constants/index.dart';
import 'find.dart';
import 'home.dart';
import 'category.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  PageController pageController;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: Klength.designWidth)..init(context);

    double extralHeight = Klength.topBarHeight + //顶部标题栏高度
        Klength.bottomBarHeight + //底部tab栏高度
        ScreenUtil.statusBarHeight + //状态栏高度
        ScreenUtil.bottomBarHeight; //IPhoneX底部状态栏

    List<Widget> widgets = [
      IndexPage(),
      Category(
        rightListViewHeight: ScreenUtil.screenHeight - extralHeight,
      ),
      PinWei(),
      Cart(),
      Center(
        child: Text('这里是空白'),
      )
    ];
    return Scaffold(
      bottomNavigationBar: KKBottomAppBar(
        actviveColor: KColorConstant.themeColor,
        onTabSeleted: onTap,
        color: KColorConstant.tabtxtColor,
        items: [
          BottomAppBarItemModal(Icons.home, KKLocalizations.of(context).home),
          BottomAppBarItemModal(Icons.category, KKLocalizations.of(context).cate),
          BottomAppBarItemModal(Icons.cake,KKLocalizations.of(context).find),
          BottomAppBarItemModal(Icons.shopping_cart, KKLocalizations.of(context).cart),
          BottomAppBarItemModal(Icons.person, KKLocalizations.of(context).person)
        ],
      ),
      body: IndexedStack(
        children: widgets,
        index: currentPage,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      this.currentPage = index;
    });
  }
}
