import 'package:flutter/material.dart';
import '../routers/router_name.dart';
import '../widgets/app_bottom_bar.dart';
import '../widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _goCategory(BuildContext context, String categoryName) {
    Navigator.pushNamed(
      context,
      RouterName.category,
      arguments: categoryName,
    );
  }

  void _goDetail(BuildContext context, String id, String name) {
    Navigator.pushNamed(
      context,
      RouterName.detail,
      arguments: {
        'id': id,
        'name': name,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const categories = ['Latte', 'Americano', 'Cappuccino', 'Espresso'];

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      bottomNavigationBar: const AppBottomBar(currentIndex: 0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Home Screen (Phase 1)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Categories
            Wrap(
              spacing: 8,
              children: [
                for (final c in categories)
                  OutlinedButton(
                    onPressed: () => _goCategory(context, c),
                    child: Text(c),
                  ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Items',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Items using new ItemCard
            ItemCard(
              id: '1',
              name: 'Cafe Latte',
              price: '\$4.20',
              imageUrl:
                  'https://images.unsplash.com/photo-1509042239860-f550ce710b93',
              subtitle: 'Smooth & creamy',
              onTap: () => _goDetail(context, '1', 'Cafe Latte'),
            ),

            ItemCard(
              id: '2',
              name: 'Americano Classic',
              price: '\$3.50',
              subtitle: 'Strong & bold',
              onTap: () => _goDetail(context, '2', 'Americano Classic'),
            ),
          ],
        ),
      ),
    );
  }
}