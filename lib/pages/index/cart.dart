import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/index.dart';
import '../../data/cart.dart';
import 'package:flutter_shop/model.dart';
import 'package:flutter_shop/constants/index.dart';
import 'package:scoped_model/scoped_model.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartState();
}

class CartState extends State<Cart> {
  CartListModel cartListModel;
  @override
  void initState() {
    cartListModel = CartListModel.fromJson(cartInitData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CartListModel>(
        model: cartListModel,
        child: Column(
          children: <Widget>[
            TopBarWidget(KString.cartTitle),
            CartListWidget(),
            CartBottomWidget()
          ],
        ));
  }
}

