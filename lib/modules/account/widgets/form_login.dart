import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/modules/core/widgets/text_form_field_widget.dart';
import 'package:searchandstay/theme/colors.dart';

import '../account_controller.dart';

class FormLogin extends GetView<AccountController> {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldWidget(
            hint: 'E-mail',
            autofocus: true,
            controller: controller.controllerEmail,
            suffixIcon: const Icon(Icons.email_outlined),
          ),
          TextFormFieldWidget(
            hint: 'Senha',
            controller: controller.controllerPassword,
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye_outlined)),
          ),
          Obx(() {
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                  elevation: MaterialStateProperty.all<double>(5.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: controller.isLoading.isFalse
                      ? Text(
                          'ENTRAR',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      : const CircularProgressIndicator(
                          backgroundColor: kPrimaryColor,
                          color: kSecondaryColor,
                        ),
                ),
              ),
            );
          }),
          TextButton(
            onPressed: () {},
            child: Text('Primeiro acesso?',
                style: Theme.of(context).textTheme.titleMedium!.merge(
                    const TextStyle(decoration: TextDecoration.underline))),
          ),
        ],
      ),
    );
  }
}
