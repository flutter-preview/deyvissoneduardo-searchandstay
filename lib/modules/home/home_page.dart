import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:searchandstay/modules/core/widgets/text_form_field_widget.dart';
import 'package:searchandstay/modules/home/widgets/card_list.dart';
import 'package:searchandstay/theme/colors.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Cadastrar novo',
            backgroundColor: kbackgroundColor,
            content: const TextFormFieldWidget(),
            confirmTextColor: kPrimaryColor,
            buttonColor: Colors.white,
            cancelTextColor: Colors.red,
            textConfirm: 'Confirmar',
            textCancel: 'Cancelar',
            onCancel: () => Get.back(),
            onConfirm: () {},
          );
        },
        backgroundColor: kPrimaryColor,
        elevation: 5.0,
        child: const Icon(
          Icons.add,
          color: kSecondaryColor,
        ),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => const Card(
            child: CardList(
          title: 'title',
        )),
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
