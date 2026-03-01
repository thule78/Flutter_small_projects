import 'package:flutter/material.dart';
import '../widgets/app_bottom_bar.dart';
import '../widgets/cart_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Wireframe numbers for now
    const subtotal = 8.70;
    const deliveryFee = 1.50;
    const total = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      bottomNavigationBar: const AppBottomBar(currentIndex: 1),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Simple placeholder list
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('Cafe Latte'),
                    subtitle: Text('Qty: 1'),
                    trailing: Text('\$4.20'),
                  ),
                  ListTile(
                    title: Text('Americano'),
                    subtitle: Text('Qty: 1'),
                    trailing: Text('\$3.50'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Reused widget
            CartSummary(
              subtotal: subtotal,
              deliveryFee: deliveryFee,
              total: total,
              onCheckout: () {
                // Later: go to checkout screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Checkout tapped (wireframe)')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}