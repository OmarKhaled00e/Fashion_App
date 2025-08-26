import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:fashion_app/pages/add_card.dart';
import 'package:fashion_app/widgets/address_info.dart';
import 'package:fashion_app/widgets/card_widget.dart';
import 'package:fashion_app/widgets/custom_add.dart';
import 'package:fashion_app/widgets/custom_appbar.dart';
import 'package:fashion_app/widgets/custom_button.dart';
import 'package:fashion_app/widgets/header_text.dart';
import 'package:fashion_app/widgets/payment_dialog.dart';
import 'package:fashion_app/widgets/shipping_method.dart';
import r'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'add_address.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.image,
    required this.name,
    required this.desp,
    required this.qty,
    required this.total,
    required this.price,
  });
  final String image;
  final String name;
  final int price;
  final String desp;
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

  /// address
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

  /// card
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackl: false),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(text: "Checkout"),
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : Text(
                      "Shipping address".toUpperCase(),
                      style: TextStyles.text14Black.copyWith(
                        color: Color(0xff888888),
                      ),
                    ),
              Gap(13),

              /// address Info
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _savedAddress != null
                        ? AddressInfo(
                            savedAddress: _savedAddress,
                            onTap: _editAddress,
                          )
                        : SizedBox.shrink(),
                    Gap(20),
                    _savedAddress == null
                        ? GestureDetector(
                            onTap: () {
                              _openAddress(context);
                            },
                            child: CustomAdd(
                              text: "Add shipping address",
                              icon: Icons.add,
                              isFree: false,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
              Gap(10),

              /// Shipping Method
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : ShippingMethod(),

              /// payment Method
              _savedCard == null
                  ? SizedBox.shrink()
                  : Text(
                      "Payment Method".toUpperCase(),
                      style: TextStyles.text14Black.copyWith(
                        color: Colors.black38,
                      ),
                    ),

              Gap(20),
              _savedCard != null
                  ? Column(
                      children: [
                        Divider(color: Colors.grey.shade300),
                        Gap(20),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/image/Mastercard.svg",
                              width: 40,
                            ),
                            Gap(10),
                            Text(
                              "Master Card ending",
                              style: TextStyles.text14Black,
                            ),
                            Gap(10),
                            Text(
                              "••••${_savedCard['number'].toString().substring(_savedCard['number'].length - 2)}",
                              style: TextStyles.text14Black,
                            ),
                            Spacer(),
                            SvgPicture.asset("assets/svgs/arrow.svg"),
                          ],
                        ),
                        Gap(20),
                        Divider(color: Colors.grey.shade300),
                      ],
                    )
                  : GestureDetector(
                      onTap: _openCard,
                      child: CustomAdd(
                        text: "Select Payment Method",
                        icon: Icons.keyboard_arrow_down_sharp,
                        isFree: false,
                      ),
                    ),

              Gap(20),

              _savedCard != null && _savedAddress != null
                  ? CardWidget(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price,
                      qty: widget.qty,
                      descrption: widget.desp,
                      onChange: (qty) => setState(() => selectedQty = qty),
                    )
                  : SizedBox.shrink(),

              Gap(80),

              /// Ending
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyles.text14Black),
                  Text(
                    "\$ ${widget.price * selectedQty}",
                    style: TextStyle(color: Colors.red.shade200),
                  ),
                ],
              ),
              Gap(20),
              CustomButton(
                isSvgg: true,
                text: "Place order",
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Dialog(child: PaymentDialog());
                    },
                  );
                },
              ),
              Gap(70),
            ],
          ),
        ),
      ),
    );
  }
}
