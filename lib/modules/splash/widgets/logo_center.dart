import 'package:flutter/material.dart';
import 'package:searchandstay/modules/core/widgets/linear_progress_global.dart';

import '../../core/widgets/constantes.dart';

class LogoCenter extends StatelessWidget {
  const LogoCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(logopath),
        const SizedBox(height: 10.0),
        const LinearProgressGlobal()
      ],
    );
  }
}
