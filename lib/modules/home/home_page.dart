import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:searchandstay/modules/core/widgets/text_form_field_widget.dart';
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
        actions: [
          IconButton(
            onPressed: () => controller.signOut(),
            icon: const Icon(
              Icons.exit_to_app_sharp,
              size: 25.0,
            ),
            padding: const EdgeInsets.all(10.0),
          )
        ],
      ),
      floatingActionButton: const AddItem(),
      body: Obx(
        () => WillPopScope(
          onWillPop: () async {
            return controller.shouldPop.value;
          },
          child: ListView.builder(
            itemCount: controller.itemList.length,
            itemBuilder: (context, index) => Card(
              child: CardList(
                title: controller.itemList[index].name,
                edit: () => Get.defaultDialog(
                  title: 'Atualizar',
                  content: TextFormFieldWidget(
                    controller: controller.controllerName,
                    label: '${controller.itemList[index]}',
                  ),
                  backgroundColor: kbackgroundColor,
                  confirmTextColor: kPrimaryColor,
                  buttonColor: Colors.white,
                  cancelTextColor: Colors.red,
                  textConfirm:
                      controller.isLoading.isFalse ? 'Confirmar' : 'Salvando',
                  textCancel: 'Cancelar',
                  onCancel: () {
                    Get.back();
                  },
                  onConfirm: () =>
                      controller.updateHouseRule(controller.itemList[index].id),
                ),
                delete: () => Get.defaultDialog(
                  title: 'Excluir',
                  content: Text(
                      'Confirma a exlusão do ${controller.itemList[index]}?'),
                  backgroundColor: kbackgroundColor,
                  confirmTextColor: kPrimaryColor,
                  buttonColor: Colors.white,
                  cancelTextColor: Colors.red,
                  textConfirm:
                      controller.isLoading.isFalse ? 'Confirmar' : 'Deletando',
                  textCancel: 'Cancelar',
                  onCancel: () {
                    Get.back();
                  },
                  onConfirm: () =>
                      controller.deleteHouseRule(controller.itemList[index].id),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
