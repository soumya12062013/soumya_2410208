import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'screens/splash_screen.dart';
import 'screens/wishlist_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      // Set the theme for the entire app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // Apply the Poppins font as the default app font
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const SplashScreen(),
    );
  }
}

// MainScreen will be a stateful widget to manage the bottom navigation bar index
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[
    WishlistScreen(),
    HomeScreen(),
    Center(child: Text('Cart Page')),
    Center(child: Text('Profile page')),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // === APP BAR ===
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.menu_1),
          onPressed: () {
            // Handle drawer open
          },
        ),
        title: Text(
          'Stylo', // Your app's name
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.notification),
            onPressed: () {
              // Handle notification tap
            },
          ),
          IconButton(
            icon: const Icon(Iconsax.shopping_bag),
            onPressed: () {
              // Handle shopping bag tap
            },
          ),
        ],
      ),

      // === BODY ===
      body: IndexedStack(index: _selectedIndex, children: _screens),

      // === BOTTOM NAVIGATION BAR ===
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // To show labels for all items
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home_2), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
    );
  }

  // --- WIDGETS BUILDER METHODS ---

  Widget _buildSearchBar() {
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

  Widget _buildPromoBanners() {
    return SizedBox(
      height: 200,
      child: PageView(
        children: [
          _buildPromoCard('assets/promo1.png', 'Up to 50% Off!'),
          _buildPromoCard('assets/promo2.png', 'New Arrivals'),
          _buildPromoCard('assets/promo3.png', 'Flash Sale!'),
        ],
      ),
    );
  }

  Widget _buildPromoCard(String imagePath, String text) {
    // Using a placeholder image since we don't have local assets
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

  Widget _buildCategoryList() {
    // Mock category data
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

  Widget _buildProductGrid() {
    // Mock product data
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
      // We use shrinkWrap and physics to make the GridView work inside a SingleChildScrollView
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8, // Adjust for item height
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
