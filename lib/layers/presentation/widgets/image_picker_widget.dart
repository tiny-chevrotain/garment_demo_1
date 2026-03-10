import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:garment_demo_1/layers/presentation/widgets/squared_flat_button.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key, required this.onImageSelected});

  final void Function(Uint8List image) onImageSelected;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> get image => picker.pickImage(source: ImageSource.gallery);

  @override
  Widget build(BuildContext context) {
    return SquaredFlatTextButton(
      label: 'Select garment',
      onPressed: () async {
        final pickedImage = await image;
        if (pickedImage != null) {
          final bytes = await pickedImage.readAsBytes();
          widget.onImageSelected(bytes);
        }
      },
    );
  }
}
