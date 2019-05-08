import 'package:flutter_web/material.dart';

import 'package:flutter_cart/widgets/index.dart';
import 'package:flutter_cart/utils/screen_util.dart';
import 'package:flutter_cart/constants/index.dart';
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

    // double extralHeight = Klength.topBarHeight + //顶部标题栏高度
    //     Klength.bottomBarHeight + //底部tab栏高度
    //     ScreenUtil.statusBarHeight + //状态栏高度
    //     ScreenUtil.bottomBarHeight; //IPhoneX底部状态栏

    List<Widget> widgets = [
      Cart(),
      Cart(),
      Cart(),
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
          BottomAppBarItemModal(Icons.home, '首页'),
          BottomAppBarItemModal(Icons.category, '分类'),
          BottomAppBarItemModal(Icons.cake, '发现'),
          BottomAppBarItemModal(Icons.shopping_cart, '购物车'),
          BottomAppBarItemModal(Icons.person, '个人')
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
