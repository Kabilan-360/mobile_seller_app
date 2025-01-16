import 'package:flutter/material.dart';
import 'package:mobile_seller_app/models/mobile_listing.dart';
import 'package:mobile_seller_app/screens/chatScreen/chat_screen.dart';
import 'package:mobile_seller_app/screens/homeScreen/widget/category_filter.dart';
import 'package:mobile_seller_app/screens/homeScreen/widget/featured_listing_card.dart';
import 'package:mobile_seller_app/screens/homeScreen/widget/search_bar.dart';
import 'package:mobile_seller_app/screens/notification/notifications_screen.dart';
import 'package:mobile_seller_app/screens/payment/payment_integration_screen.dart';
import 'package:mobile_seller_app/screens/profile_screen/profile_dashboard.dart';
import 'package:mobile_seller_app/screens/sellerScreen/seller_dashboard.dart';
import 'package:mobile_seller_app/screens/wishListScreen/wishList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  String selectedBrand = 'All';
  RangeValues selectedPriceRange = RangeValues(100, 1000);
  String selectedCondition = 'All';

  List<MobileListing> listings = [
    MobileListing(
      brand: 'Apple',
      model: 'iPhone 13',
      price: 799,
      condition: 'New',
      imageUrl: 'assets/images/mobile_photo.jpg',
    ),
    MobileListing(
      brand: 'Samsung',
      model: 'Galaxy S22',
      price: 699,
      condition: 'Like New',
      imageUrl: 'assets/images/mobile_photo.jpg',
    ),
  ];

  List<MobileListing> filteredListings = [];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredListings = listings;
  }

  void filterListings() {
    setState(() {
      filteredListings = listings.where((listing) {
        final matchesBrand = selectedBrand == 'All' || listing.brand == selectedBrand;
        final matchesPrice = listing.price >= selectedPriceRange.start &&
            listing.price <= selectedPriceRange.end;
        final matchesCondition = selectedCondition == 'All' || listing.condition == selectedCondition;
        return matchesBrand && matchesPrice && matchesCondition;
      }).toList();
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to respective screens
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen(chatTitle: 'Chat Screen')),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WishlistScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationsScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileDashboard()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentIntegrationScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchBaR(
              controller: searchController,
              onSearch: (query) {
                // Implement search logic
              },
            ),
            SizedBox(height: 16),
            CategoryFilter(
              brands: ['All', 'Apple', 'Samsung', 'Xiaomi'],
              priceRange: RangeValues(100, 2000),
              conditions: ['All', 'New', 'Like New', 'Good'],
              selectedBrand: selectedBrand,
              selectedPriceRange: selectedPriceRange,
              selectedCondition: selectedCondition,
              onBrandSelected: (brand) {
                setState(() {
                  selectedBrand = brand;
                  filterListings();
                });
              },
              onPriceRangeChanged: (range) {
                setState(() {
                  selectedPriceRange = range;
                  filterListings();
                });
              },
              onConditionSelected: (condition) {
                setState(() {
                  selectedCondition = condition;
                  filterListings();
                });
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredListings.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: FeaturedListingCard(listing: filteredListings[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SellerDashboard()),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: 'Payments'),
        ],
      ),
    );
  }
}
