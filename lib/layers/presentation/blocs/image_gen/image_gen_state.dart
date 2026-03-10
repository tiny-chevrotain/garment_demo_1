import 'package:garment_demo_1/layers/domain/image_gen/image_gen_entity.dart';

class ImageGenState {
  final ImageGenEntity? imageGenEntity;
  final bool isLoading;

  ImageGenState({
    this.imageGenEntity,
    this.isLoading = false,
  });
}
