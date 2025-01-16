import 'package:flutter/material.dart';

class SearchBaR extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearch;

  SearchBaR({
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        onSearch(value);  // Trigger the search when the user submits the query
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: TextStyle(color: Colors.grey[600]),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        filled: true,
        fillColor: Colors.grey[100],  // Light background color
        suffixIcon: IconButton(
          icon: Icon(Icons.search, color: Colors.teal),
          onPressed: () {
            onSearch(controller.text);  // Trigger the search callback when the icon is pressed
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),  // Rounded corners for the search bar
          borderSide: BorderSide.none,  // No border on the sides
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),  // Rounded corners when focused
          borderSide: BorderSide(color: Colors.teal, width: 2),  // Change border color when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1),  // Default border color
        ),
      ),
    );
  }
}
