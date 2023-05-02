import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/theme/colors.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/widgets/text_form_field_widget.dart';
import '../account_controller.dart';

class FormRegiter extends GetView<AccountController> {
  const FormRegiter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeyRegister,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldWidget(
            hint: 'Nome',
            autofocus: true,
            controller: controller.controllerName,
            suffixIcon: const Icon(Icons.person),
          ),
          TextFormFieldWidget(
            hint: 'CPF',
            autofocus: true,
            keyboardType: TextInputType.number,
            controller: controller.controllerName,
            suffixIcon: const Icon(Icons.person_2),
            validator: Validatorless.cpf('cpf invalido.'),
          ),
          TextFormFieldWidget(
            hint: 'E-mail',
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            controller: controller.controllerEmail,
            suffixIcon: const Icon(Icons.email_outlined),
            validator: Validatorless.email('e-mail invalido'),
          ),
          Obx(() {
            return TextFormFieldWidget(
              hint: 'Senha',
              controller: controller.controllerPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.isVisible.isTrue ? true : false,
              suffixIcon: IconButton(
                  onPressed: () => controller.isVisible.toggle(),
                  icon: Icon(controller.isVisible.isTrue
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye)),
              validator: Validatorless.min(6, 'minimo de 6 caracteres'),
            );
          }),
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
                onPressed: () => controller.register(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: controller.isLoading.isFalse
                      ? Text(
                          'SALVAR',
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      : const CircularProgressIndicator(
                          backgroundColor: kSecondaryColor,
                          color: kbackgroundColor,
                        ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
