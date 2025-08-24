import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/pages/place_order.dart';
import 'package:fashion_app/widgets/add_promo.dart';
import 'package:fashion_app/widgets/card_widget.dart';
import 'package:fashion_app/widgets/custom_appbar.dart';
import 'package:fashion_app/widgets/custom_button.dart';
import 'package:fashion_app/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Checkout extends StatefulWidget {
  const Checkout({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.decrption,
  });
  final String image;
  final String name;
  final int price;
  final String decrption;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedQty = 1;
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackl: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            HeaderText(text: 'Checkout'),

            ///
            CardWidget(
              image: widget.image,
              name: widget.name,
              descrption: widget.decrption,
              price: widget.price,
              onChange: (value) {
                setState(() {
                  selectedQty = value;
                });
              },
            ),
            // add promo
            AddPromo(),
            Gap(30),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Est. Total', style: TextStyles.text14Black),
                Text(
                  '\$ ${widget.price * selectedQty}',
                  style: TextStyles.text15Orange,
                ),
              ],
            ),
            Gap(70),
            CustomButton(
              isSvgg: true,
              text: 'Checkout',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return PlaceOrder(
                        image: widget.image,
                        name: widget.name,
                        decrption: widget.decrption,
                        qty: selectedQty,
                        price: widget.price,
                        total: widget.price * selectedQty,
                      );
                    },
                  ),
                );
              },
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
