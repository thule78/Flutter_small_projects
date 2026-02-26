import 'package:flutter/material.dart';
import '../widgets/cards/product_card.dart';

class ProductItem {
  final String name;
  final String brand;
  final double price;
  final double rating;
  final String imageUrl;
  bool isFavorite;

  ProductItem({
    required this.name,
    required this.brand,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

class AppD32 extends StatefulWidget {
  const AppD32({super.key});

  @override
  State<AppD32> createState() => _AppD32State();
}

class _AppD32State extends State<AppD32> {
  late List<ProductItem> products;

  @override
  void initState() {
    super.initState();

    // data samples
    products = [
      ProductItem(
        name: "Chocolate",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=600&q=60",
      ),
      ProductItem(
        name: "Chocolate",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=600&q=60",
      ),
      ProductItem(
        name: "Chocolate",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=600&q=60",
      ),
      ProductItem(
        name: "Chocolate",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=600&q=60",
      ),
      ProductItem(
        name: "Chocolate",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=600&q=60",
      ),
      ProductItem(
        name: "Filled",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1527515862127-a4fc05baf7a5?auto=format&fit=crop&w=600&q=60",
      ),
      ProductItem(
        name: "Careemy",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1556910103-1c02745aae4d?auto=format&fit=crop&w=600&q=60",
      ),
      ProductItem(
        name: "Decadent",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1509440159598-8b9f0f3d3f46?auto=format&fit=crop&w=600&q=60",
      ),
      ProductItem(
        name: "Careemy",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1556910103-1c02745aae4d?auto=format&fit=crop&w=600&q=60",
      ),
      ProductItem(
        name: "Decadent",
        brand: "Dunkin's",
        price: 5,
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1509440159598-8b9f0f3d3f46?auto=format&fit=crop&w=600&q=60",
      ),
    ];
  }

  void toggleFavorite(int index) {
    setState(() {
      products[index].isFavorite = !products[index].isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
         
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // stroke border
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.black12,
                    width: 1.2,
                  ),
                ),
                child: GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final p = products[index];
                    return ProductCard(
                      name: p.name,
                      brand: p.brand,
                      price: p.price,
                      rating: p.rating,
                      imageUrl: p.imageUrl,
                      isFavorite: p.isFavorite,
                      onFavoriteTap: () => toggleFavorite(index),
                      onTap: () => debugPrint("Open: ${p.name}"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}