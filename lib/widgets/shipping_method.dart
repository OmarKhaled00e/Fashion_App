import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/widgets/custom_add.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Method'.toUpperCase(),
          style: TextStyles.text14Black.copyWith(color: Color(0xff888888)),
        ),
        CustomAdd(
          text: 'Pickup at store',
          icon: Icons.keyboard_arrow_down_sharp,
          isFree: true,
        ),
        Gap(20),
      ],
    );
  }
}
