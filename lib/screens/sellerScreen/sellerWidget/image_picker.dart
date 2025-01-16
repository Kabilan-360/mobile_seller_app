import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final Function(List<String>) onPickImages;

  ImagePickerWidget({required this.onPickImages});

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      List<String> images = pickedFiles.map((file) => file.path).toList();
      onPickImages(images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pickImages,
      child: Text('Pick Images'),
    );
  }
}
