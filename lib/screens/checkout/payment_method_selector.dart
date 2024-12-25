import 'package:flutter/material.dart';

class PaymentMethodSelector extends StatefulWidget {
  const PaymentMethodSelector({Key? key}) : super(key: key);

  @override
  _PaymentMethodSelectorState createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  String selectedPaymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ListTile(
          leading: const Icon(Icons.credit_card),
          title: const Text('Credit Card'),
          trailing: Radio(
            value: 'Credit Card',
            groupValue: selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.account_balance_wallet),
          title: const Text('UPI'),
          trailing: Radio(
            value: 'UPI',
            groupValue: selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.money),
          title: const Text('Cash on Delivery'),
          trailing: Radio(
            value: 'Cash on Delivery',
            groupValue: selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
