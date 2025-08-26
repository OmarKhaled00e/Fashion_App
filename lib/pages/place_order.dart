import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/pages/add_address.dart';
import 'package:fashion_app/pages/add_card.dart';
import 'package:fashion_app/widgets/address_info.dart';
import 'package:fashion_app/widgets/card_widget.dart';
import 'package:fashion_app/widgets/custom_add.dart';
import 'package:fashion_app/widgets/custom_appbar.dart';
import 'package:fashion_app/widgets/custom_button.dart';
import 'package:fashion_app/widgets/header_text.dart';
import 'package:fashion_app/widgets/qty.dart';
import 'package:fashion_app/widgets/shipping_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  dynamic _savedCard;
  late int selectedQty;
  @override
  void initState() {
    selectedQty = widget.qty;
    super.initState();
  }

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

  void _openCard() async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddCard()),
    );
    if (cardData != null) {
      setState(() {
        _savedCard = cardData;
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(text: 'Checkout'),
            //
            _savedAddress != null && _savedCard != null
                ? SizedBox.shrink()
                : Text(
                    'Shipping Address'.toUpperCase(),
                    style: TextStyles.text14Black.copyWith(
                      color: Color(0xff888888),
                    ),
                  ),

            Gap(2),

            // address flow
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _savedAddress != null
                      ? AddressInfo(
                          savedAddress: _savedAddress,
                          onTap: _editAddress,
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

            Gap(30),

            // Shipping Method
            _savedAddress != null && _savedCard != null
                ? SizedBox.shrink()
                : ShippingMethod(),

            // payment Metod
            _savedAddress != null && _savedCard != null
                ? SizedBox.shrink()
                : Text(
                    'Payment method'.toUpperCase(),
                    style: TextStyles.text14Black.copyWith(
                      color: Color(0xff888888),
                    ),
                  ),

            Gap(20),

            // about card
            _savedCard != null
                ? Column(
                    children: [
                      Divider(color: Colors.grey.shade300),
                      Gap(10),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/image/Mastercard.svg',
                            width: 40,
                          ),
                          Gap(10),
                          Text(
                            'Master Card ending',
                            style: TextStyle(color: Colors.black),
                          ),
                          Gap(10),
                          Text(
                            "••••${_savedCard['number'].toString().substring(_savedCard['number'].length - 2)}",
                            style: TextStyle(color: Colors.black),
                          ),
                          Spacer(),
                          SvgPicture.asset('assets/image/arrow.svg'),
                        ],
                      ),
                      Gap(10),
                      Divider(color: Colors.grey.shade300),
                    ],
                  )
                : GestureDetector(
                    onTap: _openCard,
                    child: CustomAdd(
                      text: 'select payment method',
                      icon: Icons.keyboard_arrow_down_sharp,
                      isFree: false,
                    ),
                  ),
            // Spacer(),
            _savedCard != null
                ? CardWidget(
                    image: widget.image,
                    name: widget.name,
                    descrption: widget.decrption,
                    price: widget.price,
                    qty: widget.qty,
                    onChange: (qty) {
                      setState(() {
                        selectedQty = qty;
                      });
                    },
                  )
                : SizedBox.shrink(),

            Gap(55),
            // total and button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyles.text14Black),
                Text(
                  '\$ ${widget.price * selectedQty}',
                  style: TextStyles.text15Orange,
                ),
              ],
            ),
            Gap(60),
            CustomButton(
              isSvgg: true,
              text: 'Place oredr',
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Dialog(child: Dialog());
                  },
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
