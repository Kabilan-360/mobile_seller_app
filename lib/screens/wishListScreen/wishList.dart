import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Map<String, String>> wishlist = [
    {
      'name': 'iPhone 14 Pro',
      'price': '\$999',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Samsung Galaxy S23',
      'price': '\$799',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  void removeFromWishlist(int index) {
    setState(() {
      wishlist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: wishlist.isEmpty
          ? Center(
        child: Text(
          'Your wishlist is empty!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          final item = wishlist[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Image.network(
                item['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(item['name']!),
              subtitle: Text(item['price']!),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => removeFromWishlist(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
