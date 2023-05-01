import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class WidgetFlow extends GetView<HomeController> {
  const WidgetFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget flowMenuItem(IconData icon) {
      final double buttonDiameter =
          MediaQuery.of(context).size.width / controller.menuItems.length;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RawMaterialButton(
          fillColor: controller.lastTapped.value == icon
              ? Colors.amber[700]
              : Colors.blue,
          splashColor: Colors.amber[100],
          shape: const CircleBorder(),
          constraints:
              BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
          onPressed: () {
            controller.updateMenu(icon);
            controller.menuAnimation.status == AnimationStatus.completed
                ? controller.menuAnimation.reverse()
                : controller.menuAnimation.forward();
          },
          child: Icon(
            icon,
            color: Colors.white,
            size: 45.0,
          ),
        ),
      );
    }

    return Flow(
      delegate: FlowMenuDelegate(menuAnimation: controller.menuAnimation),
      // children:
      //     controller.menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx * menuAnimation.value,
          0,
          0,
        ),
      );
    }
  }
}
