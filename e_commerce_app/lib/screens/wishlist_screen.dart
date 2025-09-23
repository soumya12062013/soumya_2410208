import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-commerce Wishlist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black, // Set the color of the title and icons
          elevation: 0.5,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const WishlistScreen(),
    );
  }
}

// Model for a Wishlist Item
class WishlistItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String color;
  final String size;

  WishlistItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.color = 'N/A',
    this.size = 'N/A',
  });
}

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // Sample data for wishlist items
  final List<WishlistItem> _wishlistItems = [
    WishlistItem(
      id: '1',
      name: 'Elegant Summer Dress',
      imageUrl: 'https://via.placeholder.com/150/FF6347/FFFFFF?text=Dress', // Tomato color
      price: 49.99,
      color: 'Red',
      size: 'M',
    ),
    WishlistItem(
      id: '2',
      name: 'Premium Leather Wallet',
      imageUrl: 'https://via.placeholder.com/150/4682B4/FFFFFF?text=Wallet', // SteelBlue color
      price: 29.50,
      color: 'Brown',
      size: 'One Size',
    ),
    WishlistItem(
      id: '3',
      name: 'Stylish Running Shoes',
      imageUrl: 'https://via.placeholder.com/150/3CB371/FFFFFF?text=Shoes', // MediumSeaGreen color
      price: 75.00,
      color: 'Blue',
      size: 'US 9',
    ),
    WishlistItem(
      id: '4',
      name: 'Classic Denim Jacket',
      imageUrl: 'https://via.placeholder.com/150/FFD700/FFFFFF?text=Jacket', // Gold color
      price: 89.00,
      color: 'Indigo',
      size: 'L',
    ),
  ];

  void _removeItem(String id) {
    setState(() {
      _wishlistItems.removeWhere((item) => item.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item removed from wishlist!')),
    );
  }

  void _moveToCart(WishlistItem item) {
    // In a real app, you would add logic here to move the item to the cart
    // and then potentially remove it from the wishlist.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item.name} moved to cart!')),
    );
    _removeItem(item.id); // Optionally remove from wishlist after moving to cart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
      ),
      body: _wishlistItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your wishlist is empty!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add items you love to your wishlist.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to product browsing or home
                      print('Start shopping tapped!');
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                    label: const Text('Start Shopping'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _wishlistItems.length,
              itemBuilder: (context, index) {
                final item = _wishlistItems[index];
                return _buildWishlistItemCard(item);
              },
            ),
    );
  }

  Widget _buildWishlistItemCard(WishlistItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.imageUrl,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                // Optional: add a placeholder for network image loading
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: 90,
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey.shade200,
                    child: Icon(Icons.broken_image, color: Colors.grey.shade400),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (item.color != 'N/A') ...[
                        Text('Color: ${item.color}', style: TextStyle(color: Colors.grey.shade600)),
                        const SizedBox(width: 10),
                      ],
                      if (item.size != 'N/A')
                        Text('Size: ${item.size}', style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                ],
              ),
            ),
            // Action Buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.redAccent),
                  onPressed: () => _removeItem(item.id),
                  tooltip: 'Remove from wishlist',
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined, color: Colors.blueAccent),
                  onPressed: () => _moveToCart(item),
                  tooltip: 'Move to cart',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
