import 'package:fashion_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.isBlackl});
  final bool isBlackl;
  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    bool isBlack = isBlackl;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppBar(
        centerTitle: true,
        leadingWidth: 25,
        backgroundColor: isBlack ? AppColor.primary : Colors.white,
        leading: SvgPicture.asset(
          'assets/image/Menu.svg',
          color: isBlack ? Colors.white : AppColor.primary,
        ),
        title: Image.asset(
          'assets/image/Logo.png',
          width: 80,
          color: isBlack ? Colors.white : AppColor.primary,
        ),
        actions: [
          SvgPicture.asset(
            'assets/image/Search.svg',
            color: isBlack ? Colors.white : AppColor.primary,
          ),
          Gap(20),
          SvgPicture.asset(
            'assets/image/shoppingbag.svg',
            color: isBlack ? Colors.white : AppColor.primary,
          ),
        ],
      ),
    );
  }
}
