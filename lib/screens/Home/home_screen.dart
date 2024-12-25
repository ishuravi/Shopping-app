import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/product_model.dart';
import 'package:shopping/screens/Home/Widget/product_cart.dart';
import 'package:shopping/screens/Home/Widget/search_bar.dart';
import 'package:shopping/screens/Home/Widget/home_app_bar.dart';
import 'package:shopping/screens/Home/Widget/image_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Provider/Id_provider.dart';


class Category {
  final String id;
  final String title;
  final String imageUrl;
  final List<Subcategory> subcategories;
  List<Product> products; // Add a list of products for each category

  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.subcategories,
    this.products = const [],
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var subcategoriesList = json['subcategories'] as List;
    List<Subcategory> subcategories =
        subcategoriesList.map((item) => Subcategory.fromJson(item)).toList();

    return Category(
      id: json['_id'],
      title: json['title'],
      imageUrl: 'http://103.61.224.178:8022${json['image']}',
      subcategories: subcategories,
    );
  }
}

class Subcategory {
  final String id;
  final String title;

  Subcategory({required this.id, required this.title});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'],
      title: json['title'],
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  List<Category> categoriesList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchCategories(context);
    });
  }


  Future<void> fetchCategories(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse('http://103.61.224.178:8022/pcategory'));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        setState(() {
          categoriesList = data.map((item) => Category.fromJson(item)).toList();
          isLoading = false;
        });

        // Set categories in the provider if needed
        Provider.of<CategoryProvider>(context, listen: false).setCategories(categoriesList);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }
  Future<void> fetchProducts(String categoryId, String subcategoryId) async {
    try {
      final response = await http.get(Uri.parse('http://103.61.224.178:8022/Products/products/$categoryId/$subcategoryId'));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        List<Product> products = data.map((item) => Product.fromJson(item)).toList();

        setState(() {
          categoriesList[selectedIndex].products = products;
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              // Custom app bar
              const CustomAppBar(),
              const SizedBox(height: 20),
              // Search bar
              const MySearchBAR(),
              const SizedBox(height: 20),
              // Image slider
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Category selection
              categoryItems(),
              const SizedBox(height: 20),
              // Special For You section
              if (categoriesList[selectedIndex].products.isNotEmpty)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 10),
              // Product grid

            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItems() {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
      children: [
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  // Fetch products for the selected category and first subcategory
                  if (categoriesList[index].subcategories.isNotEmpty) {
                    fetchProducts(categoriesList[index].id, categoriesList[index].subcategories[0].id);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: selectedIndex == index
                        ? Colors.blue[200]
                        : Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(categoriesList[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        categoriesList[index].title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        if (categoriesList.isNotEmpty)
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList[selectedIndex].subcategories.length,
              itemBuilder: (context, subIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      fetchProducts(
                        categoriesList[selectedIndex].id,
                        categoriesList[selectedIndex].subcategories[subIndex].id,
                      );
                    },
                    child: Chip(
                      label: Text(
                        categoriesList[selectedIndex].subcategories[subIndex].title,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

}
