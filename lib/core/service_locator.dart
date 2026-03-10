import 'package:garment_demo_1/layers/data/image_gen/image_gen_repository_impl.dart';
import 'package:garment_demo_1/layers/domain/image_gen/image_gen_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setUpServices() {
  sl.registerSingleton<ImageGenRepository>(ImageGenRepositoryImpl());
}
