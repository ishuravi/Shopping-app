import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import '../Cart/check_out.dart';
import 'cart_item_summary.dart';
import 'address_selector.dart';
import 'check_out_box.dart';
import 'payment_method_selector.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout',style: TextStyle(color: Colors.white),),
        backgroundColor: kprimaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CartItemSummary(),
            SizedBox(height: 20),
            AddressSelector(),
            SizedBox(height: 20),
            PaymentMethodSelector(),
            SizedBox(height: 20),
            CheckOutBox1(),
          ],
        ),
      ),
    );
  }
}
