import 'package:flutter/material.dart';

class BuyerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buyer Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Header
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_pic.png'),
            ),
            SizedBox(height: 10),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Email: johndoe@gmail.com'),
            SizedBox(height: 10),

            // Wishlist
            ListTile(
              title: Text('Wishlist'),
              subtitle: Text('View your saved items'),
              leading: Icon(Icons.favorite_border),
              onTap: () {
                // Navigate to Wishlist
              },
            ),

            // Purchase History
            ListTile(
              title: Text('Purchase History'),
              subtitle: Text('View past purchases'),
              leading: Icon(Icons.history),
              onTap: () {
                // Navigate to Purchase History
              },
            ),

            // Edit Personal Details
            ListTile(
              title: Text('Edit Personal Details'),
              leading: Icon(Icons.edit),
              onTap: () {
                // Navigate to Edit Profile Screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
