import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/index.dart';
import 'package:flutter_shop/model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_shop/constants/color.dart';

class CartListWidget extends StatelessWidget {
  CartListModel model;
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScopedModelDescendant<CartListModel>(
        builder: (context, child, model) {
      this.model = model;
      return Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: model.itemsCount,
          itemExtent: 93,
          itemBuilder: (BuildContext context, int index) {
            CartItemModel item = model.items[index];
            return Dismissible(
              resizeDuration: Duration(milliseconds: 100),
              key: Key(item.productName),
              onDismissed: (direction) {
                model.removeItem(index);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("${item.productName}   成功移除"),
                  backgroundColor: KColorConstant.themeColor,
                  duration: Duration(seconds: 1),
                ));
              },
              background: Container(color: KColorConstant.themeColor),
              child: CartItemWidget(model.items[index],
                  addCount: _addCount,
                  downCount: _downCount,
                  index: index,
                  switchChaned: _switchChanged),
            );
          },
        ),
      );
    }) ;
  }

  _switchChanged(int i) {
    model.switchSelect(i);
  }

  _addCount(int i) {
    model.addCount(i);
  }

  _downCount(int i) {
    model.downCount(i);
  }
}
