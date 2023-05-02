import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:searchandstay/modules/home/widgets/add_item.dart';
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
      floatingActionButton: const AddItem(),
      body: ListView.builder(
        itemCount: controller.itemList.length,
        itemBuilder: (context, index) => Card(
          child: Dismissible(
            key: ValueKey<int>(index),
            background: Container(color: kPrimaryColor),
            onDismissed: (DismissDirection direction) {
              switch (direction) {
                case DismissDirection.endToStart:
                  print('deletar');
                  break;
                case DismissDirection.startToEnd:
                  print('atualizar');
                  break;
                default:
              }
            },
            child: CardList(title: '${controller.itemList[index]}'),
          ),
        ),
      ),
    );
  }
}
