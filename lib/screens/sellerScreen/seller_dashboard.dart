import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_seller_app/screens/sellerScreen/sellerWidget/listing_card.dart';
import 'package:mobile_seller_app/screens/sellerScreen/sellerWidget/mobile_listing.dart';
// import 'package:mobile_seller_app/models/mobile_listing.dart';
// import 'package:mobile_seller_app/models/mobile_listing.dart';
// import '../models/mobile_listing.dart';
import 'edit_listing_screen.dart';
import 'product_details_screen.dart';
// import '../widgets/listing_card.dart';

class SellerDashboard extends StatefulWidget {
  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  List<MobileListing> listings = [
    MobileListing(
      id: '1',
      name: 'iPhone 13',
      brand: 'Apple',
      price: 799.99,
      condition: 'New',
      description: 'Brand new iPhone 13 in box.',
      images: ['https://api.thechennaimobiles.com/1719121334790.webp'],
      sellerContact: '9876543210',
    ),
    // More listings can be added
  ];

  void deleteListing(String id) {
    setState(() {
      listings.removeWhere((listing) => listing.id == id);
      Fluttertoast.showToast(msg: 'Listing deleted');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seller Dashboard')),
      body: ListView.builder(
        itemCount: listings.length,
        itemBuilder: (context, index) {
          return ListingCard(
            listing: listings[index],
            onEdit: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditListingScreen(listing: listings[index]),
                ),
              );
            },
            onDelete: () {
              deleteListing(listings[index].id);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add new listing screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
