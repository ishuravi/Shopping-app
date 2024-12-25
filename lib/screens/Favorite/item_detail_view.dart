import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ItemDetailView extends StatelessWidget {
  final Product item; // Assuming FavoriteItem is the model class

  const ItemDetailView({super.key, required this.item}); // Use required to ensure item is passed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.blue, // You can customize the color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying the item image
            Center(
              child: Image.asset(
                item.image,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Displaying the item title
            Text(
              item.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            // Displaying the item category
            Text(
              item.category,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            // Displaying the item price
            Text(
              "\$${item.price}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            // Add a description or additional details if needed
            Text(
              "Description: \n${item.description}", // Assuming description is a field in your model
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Add any additional buttons or actions you want
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart logic here
                },
                child: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
