import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/modules/core/widgets/text_form_field_widget.dart';
import 'package:searchandstay/routes/app_routes.dart';
import 'package:searchandstay/theme/colors.dart';
import 'package:validatorless/validatorless.dart';

import '../account_controller.dart';

class FormLogin extends GetView<AccountController> {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeyLogin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              obscureText: controller.isVisible.isFalse ? true : false,
              suffixIcon: IconButton(
                  onPressed: () => controller.isVisible.toggle(),
                  icon: Icon(controller.isVisible.isTrue
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined)),
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
                onPressed: () => controller.login(),
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
          Center(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () => Get.toNamed(AppRoutes.REGISTERPAGE),
              child: Text('Primeiro acesso?',
                  style: Theme.of(context).textTheme.titleMedium!),
            ),
          ),
        ],
      ),
    );
  }
}
