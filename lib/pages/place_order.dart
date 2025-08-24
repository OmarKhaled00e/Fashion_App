import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/pages/add_address.dart';
import 'package:fashion_app/widgets/custom_add.dart';
import 'package:fashion_app/widgets/custom_appbar.dart';
import 'package:fashion_app/widgets/custom_button.dart';
import 'package:fashion_app/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlaceOrder extends StatefulWidget {
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
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic _savedAddress;

  void _openAddress(context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAddress()),
    );
    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
    {}
  }

  void _editAddress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAddress(editData: _savedAddress)),
    );
    setState(() {
      _savedAddress = newAddress;
    });
  }

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
          Gap(2),

          // address flow
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _savedAddress != null
                    ? GestureDetector(
                        onTap: () => _openAddress(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_savedAddress['first'] + _savedAddress['last']}',
                                  style: TextStyles.text18Black.copyWith(
                                    color: Color(0xff1A1A1A),
                                  ),
                                ),
                                Text(
                                  '${_savedAddress['address']}',
                                  style: TextStyles.text14Black.copyWith(
                                    color: Color(0xff555555),
                                  ),
                                ),
                                Gap(2),
                                Text(
                                  '${_savedAddress['city']}',
                                  style: TextStyles.text14Black.copyWith(
                                    color: Color(0xff555555),
                                  ),
                                ),
                                Gap(2),
                                Text(
                                  '${_savedAddress['phone']}',
                                  style: TextStyles.text14Black.copyWith(
                                    color: Color(0xff555555),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
                Gap(20),
                // add address
                _savedAddress == null
                    ? GestureDetector(
                        onTap: () {
                          _openAddress(context);
                        },
                        child: CustomAdd(
                          text: 'Add shipping adress',
                          icon: Icons.add,
                          isFree: false,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),

          Gap(40),

          // Shipping Method
          Text(
            'Shipping Method'.toUpperCase(),
            style: TextStyles.text14Black.copyWith(color: Color(0xff888888)),
          ),
          CustomAdd(
            text: 'Pickup at store',
            icon: Icons.keyboard_arrow_down_sharp,
            isFree: true,
          ),
          Gap(20),
          // payment Metod
          Text(
            'Payment method'.toUpperCase(),
            style: TextStyles.text14Black.copyWith(color: Color(0xff888888)),
          ),
          CustomAdd(
            text: 'select payment method',
            icon: Icons.keyboard_arrow_down_sharp,
            isFree: false,
          ),
          // Spacer(),
          Gap(55),
          // total and button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyles.text14Black),
              Text('\$ ${widget.total}', style: TextStyles.text15Orange),
            ],
          ),
          Gap(60),
          CustomButton(isSvgg: true, text: 'Place oredr', onTap: () {}),
          Gap(10),
        ],
      ),
    );
  }
}
