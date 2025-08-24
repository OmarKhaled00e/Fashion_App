import 'package:fashion_app/core/style/app_color.dart';
import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.isSvgg, required this.text, this.onTap});
  final bool isSvgg;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isSvg = isSvgg;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: AppColor.primary,
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg
                  ? SvgPicture.asset('assets/image/shoppingbag.svg', width: 22)
                  : SizedBox.shrink(),
              Gap(10),
              Text(text.toUpperCase(), style: TextStyles.text16White),
            ],
          ),
        ),
      ),
    );
  }
}
