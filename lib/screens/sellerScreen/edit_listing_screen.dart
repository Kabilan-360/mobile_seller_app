import 'package:flutter/material.dart';
import 'package:mobile_seller_app/screens/sellerScreen/sellerWidget/image_picker.dart';

import 'sellerWidget/mobile_listing.dart';
// import '../models/mobile_listing.dart';
// import '../widgets/image_picker.dart';

class EditListingScreen extends StatefulWidget {
  final MobileListing listing;

  EditListingScreen({required this.listing});

  @override
  _EditListingScreenState createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _conditionController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.listing.name;
    _priceController.text = widget.listing.price.toString();
    _conditionController.text = widget.listing.condition;
    _descriptionController.text = widget.listing.description;
    images = widget.listing.images;
  }

  void saveListing() {
    // Save the listing, probably update the database or state
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Listing')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Mobile Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _conditionController,
              decoration: InputDecoration(labelText: 'Condition'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ImagePickerWidget(
              onPickImages: (pickedImages) {
                setState(() {
                  images = pickedImages;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveListing,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
