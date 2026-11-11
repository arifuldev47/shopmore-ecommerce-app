import 'package:flutter/material.dart';
class EcomHomeScreen extends StatefulWidget {
  const EcomHomeScreen({super.key});

  @override
  State<EcomHomeScreen> createState() => _EcomHomeScreenState();
}
class _EcomHomeScreenState extends State<EcomHomeScreen> {
  int selectedIndex = 0;
  Set<int> wishlistItems = {};

  final List<String> categoryList = [
    "All", "Jeans", "T-Shirt", "Joggers", "Shoes", "Bags", "Watch"
  ];

  final List<Product> productList = [
    Product(
      title: "Classic T-Shirt",
      description: "Comfortable cotton T-Shirt",
      price: 2250,
      discount: 200,
      rating: 4.5,
      image: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500",
    ),
    Product(
      title: "Denim Jacket",
      description: "Stylish denim jacket",
      price: 3500,
      discount: 500,
      rating: 4.8,
      image: "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500",
    ),
    Product(
      title: "Casual Shoes",
      description: "Comfortable daily shoes",
      price: 4200,
      discount: 300,
      rating: 4.6,
      image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
    ),
    Product(
      title: "Ladies Bag",
      description: "Premium fashion bag",
      price: 2800,
      discount: 400,
      rating: 4.7,
      image: "https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=500",
    ),
    Product(
      title: "Smart Watch",
      description: "Modern smart watch",
      price: 5500,
      discount: 700,
      rating: 4.9,
      image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
    ),
    Product(
      title: "Headphone",
      description: "Wireless headphone",
      price: 3200,
      discount: 250,
      rating: 4.5,
      image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500",
    ),
  ];
  void toggleWishlist(int index) {
    setState(() {
      if (wishlistItems.contains(index)) {
        wishlistItems.remove(index);
      } else {
        wishlistItems.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      body: IndexedStack(
        index: selectedIndex,
        children: [
          homeScreen(),
          categoriesScreen(),
          wishlistScreen(),
          profileScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF176B52),
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // ================= HOME SCREEN =================

  Widget homeScreen() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 28),
                  const Text(
                    "Shopmore",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF176B52),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.notifications_none, size: 27),
                      const SizedBox(width: 15),
                      const Icon(Icons.shopping_cart_outlined, size: 27),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Search products...",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(Icons.tune, color: Color(0xFF176B52)),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Banner
              Container(
                height: 175,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF176B52),
                  borderRadius: BorderRadius.circular(18),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=900",
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.35,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "SUMMER COLLECTION",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Up to 50% OFF",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Shop Now",
                        style: TextStyle(
                          color: Color(0xFF176B52),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Categories Heading
              sectionHeading("Categories"),
              const SizedBox(height: 15),
              SizedBox(
                height: 42,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return categoryListItem(
                      categoryList[index],
                      index == 0,
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              sectionHeading("Deals of the Day"),
              const SizedBox(height: 15),
              SizedBox(
                height: 265,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return dealProductItem(productList[index], index);
                  },
                ),
              ),
              const SizedBox(height: 25),
              sectionHeading("Popular Products"),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productList.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  return popularProductItem(productList[index], index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget sectionHeading(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "View All",
          style: TextStyle(
            color: Color(0xFF176B52),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
  Widget categoryListItem(String title, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF176B52) : Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  Widget dealProductItem(Product product, int index) {
    bool isFavorite = wishlistItems.contains(index);

    return Container(
      width: 175,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.image,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 130,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported),
                    );
                  },
                ),
              ),

              Positioned(
                top: 5,
                right: 5,
                child: favoriteButton(index, isFavorite),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 16),
              const SizedBox(width: 4),
              Text("${product.rating}"),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              Text(
                "৳${product.price - product.discount}",
                style: const TextStyle(
                  color: Color(0xFF176B52),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "৳${product.price}",
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget popularProductItem(Product product, int index) {
    bool isFavorite = wishlistItems.contains(index);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),

                Positioned(
                  top: 5,
                  right: 5,
                  child: favoriteButton(index, isFavorite),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Text(
                "৳${product.price - product.discount}",
                style: const TextStyle(
                  color: Color(0xFF176B52),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.orange, size: 15),
              Text("${product.rating}"),
            ],
          ),
        ],
      ),
    );
  }
  Widget favoriteButton(int index, bool isFavorite) {
    return GestureDetector(
      onTap: () {
        toggleWishlist(index);
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.grey,
          size: 21,
        ),
      ),
    );
  }
  Widget categoriesScreen() {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categoryList.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              categoryList[index],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
  Widget wishlistScreen() {
    List<int> favoriteProducts = wishlistItems.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text("My Wishlist"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: favoriteProducts.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 15),
            Text(
              "Your Wishlist is Empty",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Add your favorite products here.",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteProducts.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          int productIndex = favoriteProducts[index];

          return popularProductItem(
            productList[productIndex],
            productIndex,
          );
        },
      ),
    );
  }
  Widget profileScreen() {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 35),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF176B52),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Welcome User!",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              profileMenuItem(
                Icons.person_outline,
                "Personal Information",
              ),

              profileMenuItem(
                Icons.shopping_bag_outlined,
                "My Orders",
              ),

              profileMenuItem(
                Icons.location_on_outlined,
                "My Address",
              ),
              profileMenuItem(
                Icons.settings_outlined,
                "Settings",
              ),
              profileMenuItem(
                Icons.logout,
                "Logout",
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  Widget profileMenuItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF176B52)),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
class Product {
  String title;
  String description;
  double price;
  double discount;
  double rating;
  String image;

  Product({
    required this.title,
    required this.description,
    required num price,
    required num discount,
    required this.rating,
    required this.image,
  })  : price = price.toDouble(),
        discount = discount.toDouble();
}