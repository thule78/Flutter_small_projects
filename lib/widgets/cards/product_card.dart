import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.brand,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.isFavorite,
    this.onFavoriteTap,
    this.onTap,
  });

  final String name;
  final String brand;
  final double price;
  final double rating;
  final String imageUrl;
  final bool isFavorite;

  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
         
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              // image area
              Expanded(
                child: Stack(
                  children: [
                   
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.network(
                            imageUrl,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.image_not_supported),
                          ),
                        ),
                      ),
                    ),

                    //price
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF3D7D7),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          '\$${price.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),

                    // Favorite heart ico
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: onFavoriteTap,
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              isFavorite ? Colors.red : Colors.black45,
                        ),
                      ),
                    ),

                    // Rating bottom-right
                    Positioned(
                      right: 8,
                      bottom: 10,
                      child: Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Name + Brand
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFF4D4D),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    brand,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}