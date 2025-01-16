import 'package:flutter/material.dart';
import 'package:mobile_seller_app/models/mobile_listing.dart';

class FeaturedListingCard extends StatelessWidget {
  final MobileListing listing;

  FeaturedListingCard({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,  // Increase elevation for a more pronounced 3D effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),  // Rounded corners for the card
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),  // Padding for content inside the card
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),  // Rounded corners for the image
          child: Image.network(
            listing.imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          '${listing.brand} ${listing.model}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,  // Dark text color for good readability
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            '\$${listing.price.toStringAsFixed(2)} • ${listing.condition}',
            style: TextStyle(
              color: Colors.grey[700],  // Lighter color for the subtitle text
              fontSize: 14,
            ),
          ),
        ),
        onTap: () {
          // Navigate to details page (if needed)
        },
      ),
    );
  }
}
