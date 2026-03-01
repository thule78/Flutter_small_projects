import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    this.subtitle,
    this.rating = 4.5,
    this.onTap,
    this.onAdd,
  });

  final String id;
  final String name;
  final String price;
  final String? imageUrl;
  final String? subtitle;
  final double rating;
  final VoidCallback? onTap;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    const coffee = Color(0xFFB89362);
    const textDark = Color(0xFF2B2B2B);
    const textSoft = Color(0xFF6B6B6B);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [

            /// IMAGE + RATING
            Padding(
              padding: const EdgeInsets.all(14),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: AspectRatio(
                      aspectRatio: 1, // square image
                      child: imageUrl != null
                          ? Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              color: Colors.black,
                              child: const Icon(
                                Icons.local_cafe,
                                color: Colors.white54,
                                size: 40,
                              ),
                            ),
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: Row(
                      children: [
                        const Icon(Icons.star,
                            size: 14, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// NAME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: textDark,
                ),
              ),
            ),

            /// SUBTITLE
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: textSoft,
                  ),
                ),
              ),

            const SizedBox(height: 8),

            /// PRICE + BUTTON
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),
                  const Spacer(),

                  InkWell(
                    onTap: onAdd,
                    child: Container(
                      width: 60,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: coffee,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(28),
                        ),
                      ),
                      child: const Icon(Icons.add,
                          color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}