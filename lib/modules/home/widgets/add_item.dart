import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/modules/core/widgets/text_form_field_widget.dart';
import 'package:searchandstay/theme/colors.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}
