import 'package:flutter/material.dart';
import 'package:mobile_seller_app/screens/sellerScreen/product_details_screen.dart';

import 'mobile_listing.dart';
// import '../models/mobile_listing.dart';

class ListingCard extends StatelessWidget {
  final MobileListing listing;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  ListingCard({required this.listing, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(listing.images[0], width: 50, height: 50),
        title: Text(listing.name),
        subtitle: Text('${listing.brand} - \$${listing.price.toStringAsFixed(2)}'),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') onEdit();
            if (value == 'delete') onDelete();
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'edit',
              child: Text('Edit'),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Text('Delete'),
            ),
          ],
        ),
        onTap: () {
          // Navigate to product details screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(listing: listing),
            ),
          );
        },
      ),
    );
  }
}
