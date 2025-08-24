import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Ionicons.logo_twitter, color: Colors.white),
              Gap(30),
              Icon(Ionicons.logo_instagram, color: Colors.white),
              Gap(30),
              Icon(Ionicons.logo_facebook, color: Colors.white),
            ],
          ),
          Gap(20),
          Image.asset('assets/image/line.png'),
          Gap(20),
          Text(
            'support@openui.design \n +60 825 876\n08:00 - 22:00 - Everyday',
            style: TextStyles.text16Black,
          ),
          Gap(20),
          Image.asset('assets/image/line.png'),
          Gap(20),
          Text('About  Contact  Blog'),
          Gap(20),
        ],
      ),
    );
  }
}
