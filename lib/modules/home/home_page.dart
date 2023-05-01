import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
        onPressed: () {},
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
