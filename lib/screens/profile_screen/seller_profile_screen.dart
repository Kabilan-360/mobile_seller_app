import 'package:flutter/material.dart';

class SellerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seller Profile')),
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
              'Jane Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Email: janedoe@gmail.com'),
            SizedBox(height: 10),

            // Active Listings
            ListTile(
              title: Text('Active Listings'),
              subtitle: Text('View and manage your listings'),
              leading: Icon(Icons.list),
              onTap: () {
                // Navigate to Active Listings
              },
            ),

            // View Stats
            ListTile(
              title: Text('View Stats'),
              subtitle: Text('Views, Inquiries, and Sales'),
              leading: Icon(Icons.analytics),
              onTap: () {
                // Navigate to Stats Screen
              },
            ),

            // Edit Profile Details
            ListTile(
              title: Text('Edit Profile Details'),
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
