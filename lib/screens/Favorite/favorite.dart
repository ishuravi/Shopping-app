import 'package:flutter/material.dart';
import 'package:shopping/Provider/favorite_provider.dart';
import '../../constants.dart';
import '../../models/product_model.dart';
import 'item_detail_view.dart'; // Import the new file

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;

    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        title: const Text(
          "Favorite",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: finalList.isEmpty
          ? Center(
        child: Text(
          "No favorites added yet!",
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: finalList.length,
        itemBuilder: (context, index) {
          final favoriteItems = finalList[index];

          return Dismissible(
            key: Key(favoriteItems.id.toString()), // Ensure a unique key
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              setState(() {
                finalList.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${favoriteItems.title} removed from favorites"),
                ),
              );
            },
            child: GestureDetector(
              onTap: () {
                // Navigate to detail view
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ItemDetailView(), // Pass the actual item
                //   ),
                // );
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: kcontentColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(favoriteItems.image),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favoriteItems.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  favoriteItems.category,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade400,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "\$${favoriteItems.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {
                              // Share logic here
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
