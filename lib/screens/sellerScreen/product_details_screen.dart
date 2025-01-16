import 'package:flutter/material.dart';

import 'sellerWidget/mobile_listing.dart';
// import '../models/mobile_listing.dart';

class ProductDetailsScreen extends StatelessWidget {
  final MobileListing listing;

  ProductDetailsScreen({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(listing.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(listing.images[0], height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(listing.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('${listing.brand} - \$${listing.price.toStringAsFixed(2)}'),
            SizedBox(height: 8),
            Text('Condition: ${listing.condition}'),
            SizedBox(height: 16),
            Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(listing.description),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement contact functionality (e.g., chat or call)
              },
              child: Text('Contact Seller'),
            ),
          ],
        ),
      ),
    );
  }
}
