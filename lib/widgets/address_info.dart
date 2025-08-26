import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({super.key, this.savedAddress, this.onTap});
  final dynamic savedAddress;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${savedAddress['first'] + savedAddress['last']}',
                style: TextStyles.text18Black.copyWith(
                  color: Color(0xff1A1A1A),
                ),
              ),
              Text(
                '${savedAddress['address']}',
                style: TextStyles.text14Black.copyWith(
                  color: Color(0xff555555),
                ),
              ),
              Gap(2),
              Text(
                '${savedAddress['city']}',
                style: TextStyles.text14Black.copyWith(
                  color: Color(0xff555555),
                ),
              ),
              Gap(2),
              Text(
                '${savedAddress['phone']}',
                style: TextStyles.text14Black.copyWith(
                  color: Color(0xff555555),
                ),
              ),
            ],
          ),
          SvgPicture.asset('assets/image/arrow.svg'),
        ],
      ),
    );
  }
}
