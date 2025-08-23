import 'package:fashion_app/core/style/app_color.dart';
import 'package:fashion_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: CustomAppbar(isBlackl: true),
      body: Stack(
        children: [
          // Text style 
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/image/10.svg'),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/image/October.svg'),
          ),
          Positioned(
            top: 85,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/image/Collection.svg'),
          ),
        
        Column(
          children: [
            Gap(120),
            Image.asset('assets/image/cover1.png'),
            Gap(20),
            
          ],
        )
        
        ],
      ),
    );
  }
}
