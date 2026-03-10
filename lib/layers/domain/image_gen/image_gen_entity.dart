import 'dart:typed_data';

abstract class ImageGenEntity {
  String get id;
  String? get text;
  List<Uint8List> get images;
}
