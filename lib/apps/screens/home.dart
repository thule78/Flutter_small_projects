import 'package:flutter/material.dart';
import '../routers/router_name.dart';
import '../widgets/app_bottom_bar.dart';
import '../widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _goDetail(BuildContext context, String id, String name) {
    Navigator.pushNamed(
      context,
      RouterName.detail,
      arguments: {'id': id, 'name': name},
    );
  }

  void _goCategory(BuildContext context, String categoryName) {
    Navigator.pushNamed(context, RouterName.category, arguments: categoryName);
  }

  @override
  Widget build(BuildContext context) {
    // color scheme (same as splash)
    const bg = Color(0xFFD8D7C8);
    const textDark = Color(0xFF2B2B2B);
    const textSoft = Color(0xFF6B6B6B);
    const buttonFill = Color(0xFFB89362);
    const buttonText = Color(0xFFF8F6F2);

    final categories = ['Espresso', 'Latte', 'Cappuccino', 'Cafetière'];

    final items = [
      {
        'id': '1',
        'name': 'Cafetière',
        'subtitle': 'without Milk',
        'price': '\$4.20',
        'imageUrl':
            'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=900',
      },
      {
        'id': '2',
        'name': 'Cafetière',
        'subtitle': 'without Milk',
        'price': '\$4.20',
        'imageUrl':
            'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=900',
      },
      {
        'id': '3',
        'name': 'Cafetière',
        'subtitle': 'without Milk',
        'price': '\$4.20',
        'imageUrl':
            'https://images.unsplash.com/photo-1507133750040-4a8f57021571?w=900',
      },
    ];

    return Scaffold(
      backgroundColor: bg,
      bottomNavigationBar: const AppBottomBar(currentIndex: 0),

      // ===== AppBar like screenshot =====
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 66,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: _SquareIcon(
            icon: Icons.grid_view_rounded,
            fillColor: Colors.white,
            iconColor: buttonFill,
            borderColor: Colors.black12,
            onTap: () {},
          ),
        ),
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Find the best',
              style: TextStyle(
                color: textDark,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Coffee to your taste',
              style: TextStyle(
                color: textDark,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
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

      // ===== Body =====
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          children: [
            // Search row (static)
            Row(
              children: [
              Expanded(
                child: Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: textSoft),
                      SizedBox(width: 8),
                      Text('Search', style: TextStyle(color: textSoft)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _SquareIcon(
                icon: Icons.tune_rounded,
                fillColor: buttonFill,
                iconColor: buttonText,
                borderColor: Colors.transparent,
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Category tabs (scroll horizontal)
          SizedBox(
            height: 34,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 18),
              itemBuilder: (context, index) {
                final label = categories[index];
                final isSelected = index == 0; 

                return GestureDetector(
                  onTap: () => _goCategory(context, label),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          color: isSelected ? buttonFill : textDark,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 3,
                        width: isSelected ? 18 : 0,
                        decoration: BoxDecoration(
                          color: buttonFill,
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 14),

          // ===== Items: horizontal scroll =====
          SizedBox(
            height: 280, // controls the card display height
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final item = items[index];

                return AspectRatio(
                  aspectRatio: 0.6, // card width like screenshot
                  child: ItemCard(
                    id: item['id'] as String,
                    name: item['name'] as String,
                    subtitle: item['subtitle'] as String?,
                    price: item['price'] as String,
                    imageUrl: item['imageUrl'] as String?,
                    onTap: () => _goDetail(
                      context,
                      item['id'] as String,
                      item['name'] as String,
                    )
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 18),

          // ===== Special for you section =====
          const Text(
            'Special for you',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: textDark,
            ),
          ),
          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: buttonFill,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?w=900',
                    width: 120,
                    height: 86,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Specially mixed and\n'
                    'brewed within you\n'
                    'must try',
                    style: TextStyle(
                      color: buttonText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SquareIcon extends StatelessWidget {
  const _SquareIcon({
    required this.icon,
    required this.fillColor,
    required this.iconColor,
    required this.borderColor,
    required this.onTap,
  });

  final IconData icon;
  final Color fillColor;
  final Color iconColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}