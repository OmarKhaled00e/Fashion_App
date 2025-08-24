import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/widgets/custom_appbar.dart';
import 'package:fashion_app/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlaceOrder extends StatelessWidget {
  const PlaceOrder({
    super.key,
    required this.image,
    required this.name,
    required this.decrption,
    required this.qty,
    required this.total,
    required this.price,
  });
  final String image;
  final String name;
  final String decrption;
  final int price;

  final int qty;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackl: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(text: 'Checkout'),
          Text(
            'Shipping Address'.toUpperCase(),
            style: TextStyles.text14Black.copyWith(color: Color(0xff888888)),
          ),
          Gap(5),
          // address flow
        ],
      ),
    );
  }
}
