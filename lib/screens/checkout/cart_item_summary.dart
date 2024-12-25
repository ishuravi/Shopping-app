import 'package:flutter/material.dart';
import 'package:shopping/Provider/add_to_cart_provider.dart';
import 'package:shopping/constants.dart';

class CartItemSummary extends StatelessWidget {
  const CartItemSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final cartItems = provider?.cartItems ?? []; // Use an empty list if cartItems is null

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Cart Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),

        // Display a message if the cart is empty
        if (cartItems.isEmpty)
          const Center(
            child: Text(
              'Your cart is empty.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return ListTile(
                leading: Icon(Icons.shopping_bag, color: kprimaryColor),
                title: Text(item.name),
                subtitle: Text('Quantity: ${item.quantity}'),
                trailing: Text('\$${item.price * item.quantity}'),
              );
            },
          ),
      ],
    );
  }
}
