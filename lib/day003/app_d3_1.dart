import 'package:flutter/material.dart';
import '../widgets/cards/item_card.dart';

class CategoryItem {
  final String title;
  final int itemsCount;
  final IconData icon;
  final Color color;

  const CategoryItem({
    required this.title,
    required this.itemsCount,
    required this.icon,
    required this.color,
  });
}

class AppD31 extends StatelessWidget {
  const AppD31({super.key});

  // date samples
  static const List<CategoryItem> categories = [
    CategoryItem(
      title: 'Fruits',
      itemsCount: 45,
      icon: Icons.grain,
      color: Color(0xFF48BBD7),
    ),
    CategoryItem(
      title: 'Vegetables',
      itemsCount: 45,
      icon: Icons.eco_outlined,
      color: Color(0xFF2E63D3),
    ),
    CategoryItem(
      title: 'Bakery',
      itemsCount: 45,
      icon: Icons.bakery_dining_outlined,
      color: Color(0xFF1DB954),
    ),
    CategoryItem(
      title: 'Dairy',
      itemsCount: 45,
      icon: Icons.icecream_outlined,
      color: Color(0xFFE55273),
    ),
    CategoryItem(
      title: 'Mushroom',
      itemsCount: 45,
      icon: Icons.emoji_nature_outlined,
      color: Color(0xFFF09A2A),
    ),
    CategoryItem(
      title: 'Fish',
      itemsCount: 45,
      icon: Icons.set_meal_outlined,
      color: Color(0xFF17A989),
    ),
    CategoryItem(
      title: 'Pizzas',
      itemsCount: 45,
      icon: Icons.local_pizza_outlined,
      color: Color(0xFFA8745E),
    ),
    CategoryItem(
      title: 'Chicken',
      itemsCount: 45,
      icon: Icons.restaurant_menu_outlined,
      color: Color(0xFF9C35C8),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // card grid
              GridView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];

                  return ItemCard(
                    title: item.title,
                    itemsCount: item.itemsCount,
                    icon: item.icon,
                    color: item.color,
                    onTap: () {
                      debugPrint('Tapped: ${item.title}');
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}