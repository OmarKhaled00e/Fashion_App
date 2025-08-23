import 'package:fashion_app/core/style/app_color.dart';
import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/models/cover_model.dart';
import 'package:fashion_app/models/product_model.dart';
import 'package:fashion_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

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

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Gap(120),
                  Image.asset('assets/image/cover1.png'),
                  Gap(20),

                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ProductModel.product.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.53,
                    ),
                    itemBuilder: (context, index) {
                      final item = ProductModel.product[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(item.image),
                          Gap(10),
                          Text(item.name, style: TextStyles.textTitle12),
                          Text(item.description, style: TextStyles.text12White),
                          Gap(9),
                          Text(
                            "\$${item.price.toString()}",
                            style: TextStyles.text15Orange,
                          ),
                        ],
                      );
                    },
                  ),
                  Gap(20),
                  Text(
                    'You may also like'.toUpperCase(),
                    style: TextStyles.text18,
                  ),
                  Gap(10),
                  Image.asset('assets/image/line.png', width: 190),
                  Gap(40),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: CoverModel.covers.length,
                      itemBuilder: (context, index) {
                        final item = CoverModel.covers[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                              height: 350,
                            ),
                            Gap(10),
                            Text(item.name, style: TextStyles.textTitle12),
                          ],
                        );
                      },
                    ),
                  ),
                  // about us
                  Container(
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
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xffC4C4C4),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, top: 10),
                      child: Center(
                        child: Text(
                          'Copyright© OpenUI All Rights Reserved.',
                          maxLines: 3,

                          style: TextStyles.textTitle12.copyWith(
                            height: 2.5,
                            color: Color(0xff555555),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
