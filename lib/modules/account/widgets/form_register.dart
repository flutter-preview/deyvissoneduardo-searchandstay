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
            validator: Validatorless.multiple([
              Validatorless.min(6, 'minimo de 3 caracteres'),
              Validatorless.required('nome e obrigatório.'),
            ]),
          ),
          TextFormFieldWidget(
            hint: 'E-mail',
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            controller: controller.controllerEmail,
            suffixIcon: const Icon(Icons.email_outlined),
            validator: Validatorless.multiple([
              Validatorless.email('e-mail inválido'),
              Validatorless.required('e-mail e obrigatório.')
            ]),
          ),
          Obx(() {
            return TextFormFieldWidget(
              hint: 'Senha',
              controller: controller.controllerPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.isVisible.isFalse ? true : false,
              suffixIcon: IconButton(
                  onPressed: () => controller.isVisible.toggle(),
                  icon: Icon(controller.isVisible.isTrue
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye)),
              validator: Validatorless.multiple([
                Validatorless.min(6, 'minimo de 3 caracteres'),
                Validatorless.required('nome e obrigatório.'),
              ]),
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
                onPressed: () {
                  final isForm =
                      controller.formKeyRegister.currentState?.validate();
                  if (isForm == true) {
                    controller.register();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: controller.isLoading.isFalse
                      ? Text(
                          'Cadastrar',
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
