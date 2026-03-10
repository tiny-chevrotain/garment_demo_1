import 'dart:typed_data';

import 'package:garment_demo_1/layers/domain/image_gen/image_gen_entity.dart';

abstract class ImageGenRepository {
  Future<ImageGenEntity> getGeminiImage({
    Uint8List? bytes,
    required String prompt,
  });
}
