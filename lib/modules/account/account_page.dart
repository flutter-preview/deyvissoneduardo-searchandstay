import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/widgets/constantes.dart';
import 'account_controller.dart';
import 'widgets/form_login.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: context.heightTransformer(reducedBy: 90)),
              child: Image.asset(logopath,
                  width: double.infinity,
                  height: context.heightTransformer(reducedBy: 60),
                  fit: BoxFit.fill),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: context.heightTransformer(reducedBy: 80),
                left: 10.0,
                right: 10.0,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height +
                    MediaQuery.of(context).viewInsets.bottom,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).size.height / 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FormLogin(),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 50),
                          height: MediaQuery.of(context).viewInsets.bottom / 6,
                        ),
                        AnimatedContainer(
                            duration: const Duration(milliseconds: 50),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 48.0),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height / 8),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 50),
                            height:
                                MediaQuery.of(context).viewInsets.bottom / 4,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
