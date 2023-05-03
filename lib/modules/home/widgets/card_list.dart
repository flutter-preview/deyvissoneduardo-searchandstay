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
      tag: 'ListTile',
      child: Material(
        child: ListTile(
          title: Text(title ?? ''),
          subtitle: const Text(
              'Clique para ver detalhes, ou arraste para os lados para atualizar ou excluir.'),
          tileColor: kbackgroundColor,
          leading: const Icon(
            Icons.edit,
            color: kPrimaryColor,
          ),
          trailing: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<Widget>(builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(title: Text(title ?? '')),
                  body: Center(
                    child: Hero(
                      tag: 'details-hero',
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