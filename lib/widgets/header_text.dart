import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Center(child: Text(text.toUpperCase(), style: TextStyles.text18Black)),
        Gap(10),
        Image.asset('assets/image/line.png', width: 160, color: Colors.black),
        Gap(20),
      ],
    );
  }
}
