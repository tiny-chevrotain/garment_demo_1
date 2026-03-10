import 'dart:convert';
import 'dart:typed_data';

import 'package:garment_demo_1/layers/domain/image_gen/image_gen_entity.dart';

class ImageGenModel implements ImageGenEntity {
  @override
  final String id;
  @override
  final String? text;
  @override
  final List<Uint8List> images;

  const ImageGenModel({
    required this.id,
    this.text,
    required this.images,
  });

  factory ImageGenModel.fromJson(Map<String, dynamic> json) {
    final created = json['created'] as int;
    final data = json['data'] as List;

    return ImageGenModel(
      id: created.toString(),
      images: data.map((e) => base64Decode(e['b64_json'] as String)).toList(),
    );
  }
}
