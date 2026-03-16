import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garment_demo_1/layers/presentation/blocs/image_gen/image_gen_bloc.dart';
import 'package:garment_demo_1/layers/presentation/blocs/image_gen/image_gen_state.dart';
import 'package:garment_demo_1/layers/presentation/widgets/loom_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageGenPage extends StatefulWidget {
  const ImageGenPage({super.key});

  @override
  State<ImageGenPage> createState() => _ImageGenPageState();
}

class _ImageGenPageState extends State<ImageGenPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: BlocBuilder<ImageGenBloc, ImageGenState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoomHeader(),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.imageGenEntity?.images.length ?? 3,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) => Align(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Skeletonizer(
                          enabled: state.isLoading,
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: state.isLoading
                                ? Container(color: Colors.grey[300])
                                : Image.memory(
                                    state.imageGenEntity!.images[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).popUntil((r) => r.isFirst),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.tertiary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Start Over',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
