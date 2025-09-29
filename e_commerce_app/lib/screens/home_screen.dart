// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The main layout for the home screen
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Search Bar ---
            _SearchBar(),
            SizedBox(height: 24),

            // --- Promotional Banners ---
            _PromoBanners(),
            SizedBox(height: 24),

            // --- Categories ---
            _CategoryHeader(),
            SizedBox(height: 16),
            _CategoryList(),
            SizedBox(height: 24),

            // --- Featured Products ---
            _FeaturedProductsHeader(),
            SizedBox(height: 16),
            _ProductGrid(),
          ],
        ),
      ),
    );
  }
}

// --- PRIVATE WIDGETS FOR HOME SCREEN COMPONENTS ---

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for products...',
        prefixIcon: const Icon(Iconsax.search_normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

class _PromoBanners extends StatelessWidget {
  const _PromoBanners();

  Widget _buildPromoCard(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: NetworkImage(
            'https://placehold.co/600x300/818cf8/ffffff?text=${Uri.encodeComponent(text)}&font=poppins',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView(
        children: [
          _buildPromoCard('Up to 50% Off!'),
          _buildPromoCard('New Arrivals'),
          _buildPromoCard('Flash Sale!'),
        ],
      ),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader();

  @override
  Widget build(BuildContext context) {
    return Text('Categories', style: Theme.of(context).textTheme.titleLarge);
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Iconsax.category, 'name': 'All'},
      {'icon': Iconsax.mobile, 'name': 'Phones'},
      {'icon': Iconsax.monitor, 'name': 'Laptops'},
      {'icon': Iconsax.headphone, 'name': 'Audio'},
      {'icon': Iconsax.watch, 'name': 'Watches'},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple.withOpacity(0.1),
                  ),
                  child: Icon(
                    category['icon'] as IconData,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 8),
                Text(category['name'] as String),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FeaturedProductsHeader extends StatelessWidget {
  const _FeaturedProductsHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Special for You',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class _ProductGrid extends StatelessWidget {
  const _ProductGrid();

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'name': 'Smart Watch',
        'price': '120.00',
        'image':
            'https://placehold.co/400x400/c084fc/ffffff?text=Watch&font=poppins',
      },
      {
        'name': 'Wireless Headphones',
        'price': '89.99',
        'image':
            'https://placehold.co/400x400/60a5fa/ffffff?text=Headphones&font=poppins',
      },
      {
        'name': 'Modern Laptop',
        'price': '899.00',
        'image':
            'https://placehold.co/400x400/f87171/ffffff?text=Laptop&font=poppins',
      },
      {
        'name': 'T-Shirt',
        'price': '25.50',
        'image':
            'https://placehold.co/400x400/fb923c/ffffff?text=T-Shirt&font=poppins',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          name: product['name']!,
          price: product['price']!,
          imageUrl: product['image']!,
        );
      },
    );
  }
}

// A separate widget for the product card to keep the code clean
class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Iconsax.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
