import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/theme/colors.dart';

class LinearProgressGlobal extends StatelessWidget {
  final double? reducedBy;
  const LinearProgressGlobal({super.key, this.reducedBy});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.heightTransformer(reducedBy: reducedBy ?? 82)),
      child: const LinearProgressIndicator(
        minHeight: 4.0,
        backgroundColor: kPrimaryColor,
        color: kSecondaryColor,
      ),
    );
  }
}
