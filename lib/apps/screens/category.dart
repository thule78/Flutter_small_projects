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
    final categoryName =
        (ModalRoute.of(context)?.settings.arguments as String?) ?? 'Category';

    // Wireframe item list (later: filter by category)
    final items = [
      {'id': '10', 'name': '$categoryName #1', 'price': '\$4.00', 'imageUrl': null},
      {'id': '11', 'name': '$categoryName #2', 'price': '\$4.20', 'imageUrl': null},
      {'id': '12', 'name': '$categoryName #3', 'price': '\$3.80', 'imageUrl': null},
      {'id': '13', 'name': '$categoryName #4', 'price': '\$4.50', 'imageUrl': null},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Category: $categoryName')),
      bottomNavigationBar: const AppBottomBar(currentIndex: 0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return ItemCard(
              id: item['id'] as String,
              name: item['name'] as String,
              price: item['price'] as String,
              imageUrl: item['imageUrl'] as String?, // optional
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