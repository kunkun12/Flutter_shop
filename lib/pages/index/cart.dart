import 'package:flutter_web/material.dart';
import 'package:flutter_cart/widgets/index.dart';
import '../../data/cart.dart';
import 'package:flutter_cart/model.dart';
import 'package:flutter_cart/constants/index.dart';
import 'package:flutter_cart/scope_modal.dart';

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

