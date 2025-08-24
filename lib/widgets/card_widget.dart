import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/widgets/qty.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.descrption,
    required this.price,
    required this.onChange,
  });
  final String image, name, descrption;
  final int price;
  final Function(int) onChange;
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.image, width: 120),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            Text(widget.name.toUpperCase(), style: TextStyles.text14Black),
            Gap(10),
            SizedBox(
              width: size.width * 0.5,
              child: Text(
                widget.descrption,
                style: TextStyles.textTitle12.copyWith(
                  color: Color(0xff555555),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Gap(30),
            Row(
              children: [
                Qty(
                  svg: 'assets/image/mins.svg',
                  onTap: () {
                    setState(() {
                      if (number > 1) {
                        number--;
                        widget.onChange(number);
                      }
                    });
                  },
                ),

                Gap(12),
                Text(number.toString(), style: TextStyles.text14Black),
                Gap(12),
                Qty(
                  svg: 'assets/image/Plus.svg',
                  onTap: () {
                    setState(() {
                      number++;
                      widget.onChange(number);
                    });
                  },
                ),

                Gap(10),
              ],
            ),
            Gap(28),
            Text('\$ ${widget.price}', style: TextStyles.text15Orange),
          ],
        ),
      ],
    );
  }
}
