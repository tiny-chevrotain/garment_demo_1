import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garment_demo_1/core/service_locator.dart';
import 'package:garment_demo_1/layers/domain/image_gen/image_gen_repository.dart';
import 'package:garment_demo_1/layers/presentation/blocs/image_gen/image_gen_state.dart';

class ImageGenBloc extends Cubit<ImageGenState> {
  final ImageGenRepository repository = sl<ImageGenRepository>();

  ImageGenBloc() : super(ImageGenState());

  Future<void> generateImage({
    Uint8List? image,
  }) async {
    try {
      emit(ImageGenState(isLoading: true));
      final result = await repository.getGeminiImage(
        bytes: image,
        prompt:
            'Generate creative variations of this garment, as real life photos.',
      );
      emit(ImageGenState(imageGenEntity: result));
    } catch (e) {
      // Handle error, e.g., emit an error state or log the error
      print('Error generating image: $e');
      emit(ImageGenState());
    }
  }
}
