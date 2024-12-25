import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final double price;
  final List<Color> colors;
  final String category;
  final double rate;
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.seller,
    required this.colors,
    required this.category,
    required this.review,
    required this.rate,
    required this.quantity,
  });

  // Factory constructor to create Product from API response JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['_id'].hashCode.toString()), // Generate an integer ID from _id
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['images'] != null && json['images'].isNotEmpty
          ? json['images'][0]['url']
          : 'images/placeholder.png', // Default image if not provided
      price: json['CurrentPrice']?.toDouble() ?? 0.0,
      seller: 'Unknown', // Default as the API does not provide the seller field
      colors: [Colors.grey], // Default color as API does not provide colors
      category: json['Category'] ?? 'Uncategorized',
      review: "(${json['ratings']?.length ?? 0} Reviews)",
      rate: json['totalrating'] != null ? double.parse(json['totalrating']) : 0.0,
      quantity: json['quantity'] ?? 0,
    );
  }
}

// Example usage: convert API response to List<Product>
List<Product> parseProductsFromApiResponse(Map<String, dynamic> response) {
  if (response['success'] == true && response['products'] != null) {
    return List<Product>.from(
      response['products'].map((productJson) => Product.fromJson(productJson)),
    );
  } else {
    return [];
  }
}
