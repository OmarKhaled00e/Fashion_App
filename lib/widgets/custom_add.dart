import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomAdd extends StatelessWidget {
  const CustomAdd({
    super.key,
    required this.text,
    required this.icon,
    required this.isFree,
  });
  final String text;
  final IconData icon;
  final bool isFree;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,

        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyles.text16White.copyWith(color: Color(0xff555555)),
          ),
          Spacer(),
          isFree
              ? Text(
                  'Free',
                  style: TextStyles.text16White.copyWith(
                    color: Color(0xff555555),
                  ),
                )
              : SizedBox.shrink(),
          Gap(15),
          Icon(icon),
        ],
      ),
    );
  }
}
