import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/theme/colors.dart';

import '../home_controller.dart';

class CardList extends GetView<HomeController> {
  final String? title;
  const CardList({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ListTile-Hero',
      child: Material(
        child: ListTile(
          title: Text(title ?? ''),
          tileColor: kbackgroundColor,
          trailing: IconButton(
            onPressed: () => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              height: 200,
              child: Flow(
                delegate: FlowMenuDelegate(),
                children: controller.menuItems,
              ),
            ),
            icon: const Icon(Icons.menu),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<Widget>(builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(title: Text(title ?? '')),
                  body: Center(
                    child: Hero(
                      tag: 'ListTile-Hero',
                      child: Material(
                        child: ListTile(
                          title: Text(title ?? ''),
                          trailing: const Icon(Icons.arrow_back_ios),
                          tileColor: kbackgroundColor,
                          onTap: () => Get.back(),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 150;
    for (int i = 0; i < context.childCount; i++) {
      double w = 150;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      x += w + 20; // espaçamento entre os widgets
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;
}
