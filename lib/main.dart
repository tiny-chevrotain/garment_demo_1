import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:garment_demo_1/core/service_locator.dart';
import 'package:garment_demo_1/core/theme.dart';
import 'package:garment_demo_1/layers/presentation/blocs/image_gen/image_gen_bloc.dart';
import 'package:garment_demo_1/layers/presentation/pages/image_gen/image_gen_page.dart';

void main() async {
  setUpServices();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ImageGenBloc(),
        child: const ImageGenPage(),
      ),
    );
  }
}
