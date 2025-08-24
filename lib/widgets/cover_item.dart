import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/models/cover_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CoverItem extends StatelessWidget {
  const CoverItem({
    super.key,
    required this.item,
  });

  final CoverModel item;

  @override
  Widget build(BuildContext context) {
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
  }
}

