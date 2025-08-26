import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Dialog extends StatelessWidget {
  const Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 475,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(CupertinoIcons.clear),
              ),
            ),
            Gap(30),
            Text(
              'Payment success'.toUpperCase(),
              style: TextStyles.text18Black,
            ),
            Gap(30),
            SvgPicture.asset('assets/image/done.svg'),
            Gap(20),
            Text(
              'Your payment was success',
              style: TextStyles.text18Black.copyWith(color: Color(0xff333333)),
            ),
            Gap(20),
            Text(
              'Payment ID 15263541',
              style: TextStyles.hintText15.copyWith(color: Color(0xff555555)),
            ),
            Gap(20),
            SvgPicture.asset(
              'assets/image/line.svg',
              color: Colors.black,
              width: 30,
            ),
            Gap(20),
            Text('Rate your purchase', style: TextStyles.text18Black),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/pop/emogi1.svg"),
                Gap(20),
                SvgPicture.asset("assets/pop/emogi3.svg"),
                Gap(20),
                SvgPicture.asset("assets/pop/emogi2.svg"),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    isSvgg: false,
                    text: 'Submit',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Gap(20),
                Expanded(
                  child: CustomButton(
                    isSvgg: false,
                    text: "Cancel",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
