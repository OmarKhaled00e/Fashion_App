import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AddPromo extends StatelessWidget {
  const AddPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Gap(20),
            Divider(),
            Gap(20),
            Row(
              children: [
                SvgPicture.asset('assets/image/promo.svg', width: 28),
                Gap(20),
                Text('Add promo code', style: TextStyles.text14Black),
              ],
            ),
            Divider(),
            Gap(20),
            Row(
              children: [
                SvgPicture.asset('assets/image/Delivery.svg', width: 28),
                Gap(20),
                Text('Delivery', style: TextStyles.text14Black),
                Spacer(),
                Text('Free', style: TextStyles.text14Black),
                Gap(5),
              ],
            ),
            Gap(10),
            Divider(),
            Gap(10)
    ],);
  }
}