import 'package:flutter/material.dart';
import '../routers/router_name.dart';
import '../widgets/app_bottom_bar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  void _goHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouterName.home,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // We support both String and Map arguments (so your earlier tests won't break)
    final args = ModalRoute.of(context)?.settings.arguments;

    String name = 'Item';
    String id = '0';

    if (args is String) {
      name = args;
    } else if (args is Map) {
      name = (args['name']?.toString() ?? 'Item');
      id = (args['id']?.toString() ?? '0');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [
          IconButton(
            tooltip: 'Home',
            onPressed: () => _goHome(context),
            icon: const Icon(Icons.home_outlined),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomBar(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: 220,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('IMAGE PLACEHOLDER'),
            ),

            const SizedBox(height: 16),

            // Title + Price row
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  '\$0.00',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Quick info
            Text('Item ID: $id', style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 16),

            // Quantity wireframe
            Row(
              children: [
                const Text('Quantity:', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 12),
                OutlinedButton(onPressed: () {}, child: const Text('-')),
                const SizedBox(width: 8),
                const Text('1', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                OutlinedButton(onPressed: () {}, child: const Text('+')),
              ],
            ),

            const SizedBox(height: 16),

            // Add to cart button wireframe
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // For now: just go to cart to prove the flow
                  Navigator.pushNamed(context, RouterName.cart);
                },
                child: const Text('Add to Cart'),
              ),
            ),

            const SizedBox(height: 16),

            // Description wireframe
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Simple description text placeholder.\n'
                'Later: ingredients, size options, notes.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}