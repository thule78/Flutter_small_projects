import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    this.onCheckout,
  });

  final double subtotal;
  final double deliveryFee;
  final double total;
  final VoidCallback? onCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _row('Subtotal', _money(subtotal)),
          const SizedBox(height: 8),
          _row('Delivery', _money(deliveryFee)),
          const Divider(height: 20),
          _row('Total', _money(total), isBold: true),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onCheckout ?? () {},
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool isBold = false}) {
    final style = TextStyle(
      fontSize: 14,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }

  String _money(double v) => '\$${v.toStringAsFixed(2)}';
}