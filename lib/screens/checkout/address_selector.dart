import 'package:flutter/material.dart';

class AddressSelector extends StatelessWidget {
  const AddressSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate fetching the address data
    final String? address = '123, Main Street, City, Zip Code'; // Replace with provider data if needed
    final String name = 'John Doe'; // Replace with provider data if needed

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Delivery Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

        // Check if address is available
        if (address != null && address.isNotEmpty)
          ListTile(
            title: Text(name),
            subtitle: Text(address),
            trailing: TextButton(
              onPressed: () {
                // Change address functionality
              },
              child: const Text('Change', style: TextStyle(color: Colors.blue)),
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'No delivery address selected. Please add an address.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
