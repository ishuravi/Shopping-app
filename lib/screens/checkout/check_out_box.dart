import 'package:flutter/material.dart';
import 'package:shopping/Provider/add_to_cart_provider.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/screens/checkout/thank_you.dart';

import '../login_signup/login_screen.dart'; // Import the LoginScreen

class CheckOutBox1 extends StatelessWidget {
  const CheckOutBox1({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final isAuthenticated = false; // Replace with your actual authentication check

    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              filled: true,
              fillColor: kcontentColor,
              hintText: "Enter Discount Code",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              suffixIcon: TextButton(
                onPressed: () {
                  // Apply discount code functionality
                },
                child: const Text(
                  "Apply",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kprimaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "SubTotal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor,
              minimumSize: const Size(double.infinity, 55),
            ),
            onPressed: () {
              if (!isAuthenticated) {
                // Navigate to Login screen if not authenticated
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThankYouPage()),
                );
              } else {
                // If authenticated, proceed to thank you page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThankYouPage(),
                  ),
                );
              }
            },
            child: const Text(
              "Check Out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
