import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:searchandstay/modules/home/widgets/add_item.dart';
import 'package:searchandstay/modules/home/widgets/card_list.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@s');
    debugPrint('${controller.itemList}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      floatingActionButton: const AddItem(),
      body: ListView.builder(
        itemCount: controller.itemList?.length,
        itemBuilder: (context, index) => Card(
          child: CardList(
            title: 'controller.itemList $index',
          ),
        ),
      ),
    );
  }
}
