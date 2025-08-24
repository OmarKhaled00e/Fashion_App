import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.item,
  });

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
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
  }
}
