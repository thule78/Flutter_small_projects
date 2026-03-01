import 'package:flutter/material.dart';
import '../routers/router_name.dart';
import '../widgets/app_bottom_bar.dart';
import '../widgets/item_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _goDetail(BuildContext context, String id, String name) {
    Navigator.pushNamed(
      context,
      RouterName.detail,
      arguments: {'id': id, 'name': name},
    );
  }

  @override
  Widget build(BuildContext context) {
    // color scheme (same as splash)
    const bg = Color(0xFFD8D7C8);
    const textDark = Color(0xFF2B2B2B);
  

    final categoryName =
        (ModalRoute.of(context)?.settings.arguments as String?) ?? 'Category';

    // Wireframe items
    final items = [
      {
        'id': '1',
        'name': '$categoryName #1',
        'subtitle': 'without Milk',
        'price': '\$3.80',
        'imageUrl': null, // test placeholder
      },
      {
        'id': '2',
        'name': '$categoryName #2',
        'subtitle': 'without Milk',
        'price': '\$4.50',
        'imageUrl': null,
      },
      {
        'id': '3',
        'name': '$categoryName #3',
        'subtitle': 'without Milk',
        'price': '\$4.20',
        'imageUrl': null,
      },
      {
        'id': '4',
        'name': '$categoryName #4',
        'subtitle': 'without Milk',
        'price': '\$4.20',
        'imageUrl': null,
      },
      {
        'id': '5',
        'name': '$categoryName #5',
        'subtitle': 'without Milk',
        'price': '\$4.20',
        'imageUrl': null,
      },
      {
        'id': '6',
        'name': '$categoryName #6',
        'subtitle': 'without Milk',
        'price': '\$4.20',
        'imageUrl': null,
      },
    ];

    return Scaffold(
      backgroundColor: bg,
      bottomNavigationBar: const AppBottomBar(currentIndex: 0),

      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Category: $categoryName',
          style: const TextStyle(
            color: textDark,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=200',
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            childAspectRatio: 0.62,
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return ItemCard(
              id: item['id'] as String,
              name: item['name'] as String,
              subtitle: item['subtitle'] as String?,
              price: item['price'] as String,
              imageUrl: item['imageUrl'] as String?, // can be null
              onTap: () => _goDetail(
                context,
                item['id'] as String,
                item['name'] as String,
              ),
            );
          },
        ),
      ),
    );
  }
}