import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:garment_demo_1/layers/data/image_gen/image_gen_model.dart';
import 'package:garment_demo_1/layers/domain/image_gen/image_gen_entity.dart';
import 'package:garment_demo_1/layers/domain/image_gen/image_gen_repository.dart';
import 'package:image/image.dart' as img;

final _apiKey = dotenv.env['API_KEY']!;
const _baseUrl = 'https://api.openai.com/v1/images';
const model = "gpt-image-1";

class ImageGenRepositoryImpl implements ImageGenRepository {
  final Dio _dio;

  ImageGenRepositoryImpl({Dio? dio}) : _dio = dio ?? Dio();

  Uint8List _toSquarePng(Uint8List bytes) {
    final decoded = img.decodeImage(bytes)!;
    final size =
        decoded.width < decoded.height ? decoded.width : decoded.height;
    final cropped = img.copyCrop(
      decoded,
      x: (decoded.width - size) ~/ 2,
      y: (decoded.height - size) ~/ 2,
      width: size,
      height: size,
    );
    final rgba = cropped.convert(numChannels: 4);
    return Uint8List.fromList(img.encodePng(rgba));
  }

  @override
  Future<ImageGenEntity> getGeminiImage({
    Uint8List? bytes,
    required String prompt,
  }) async {
    final headers = {
      'Authorization': 'Bearer $_apiKey',
    };

    final Response<Map<String, dynamic>> response;

    if (bytes == null) {
      response = await _dio.post<Map<String, dynamic>>(
        '$_baseUrl/generations',
        options: Options(headers: headers),
        data: {
          'model': model,
          'prompt': prompt,
          'n': 3,
          'size': '1024x1024',
        },
      );
    } else {
      final formData = FormData.fromMap({
        'model': model,
        'image': MultipartFile.fromBytes(
          _toSquarePng(bytes),
          filename: 'image.png',
          contentType: DioMediaType('image', 'png'),
        ),
        'prompt': prompt,
        'n': 3,
        'size': '1024x1024',
      });

      response = await _dio.post<Map<String, dynamic>>(
        '$_baseUrl/edits',
        options: Options(headers: headers),
        data: formData,
      );
    }

    return ImageGenModel.fromJson(response.data!);
  }
}
