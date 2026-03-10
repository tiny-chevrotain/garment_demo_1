import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garment_demo_1/layers/presentation/blocs/image_gen/image_gen_bloc.dart';
import 'package:garment_demo_1/layers/presentation/blocs/image_gen/image_gen_state.dart';
import 'package:garment_demo_1/layers/presentation/widgets/image_picker_widget.dart';

class ImageGenPage extends StatelessWidget {
  const ImageGenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset('assets/loom.webp', height: 50),
              ],
            ),

            // add changes to this column:
            Expanded(
              child: BlocBuilder<ImageGenBloc, ImageGenState>(
                  builder: (context, state) {
                return Column(
                  children: [
                    if (state.isLoading)
                      const Expanded(
                          child: Center(child: CircularProgressIndicator()))
                    else if (state.imageGenEntity != null &&
                        state.imageGenEntity!.images.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(16),
                          itemCount: state.imageGenEntity!.images.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                                state.imageGenEntity!.images[index]),
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          fontWeight: FontWeight.w900,
                                        ),
                                    children: const [
                                      TextSpan(
                                          text: 'REIMAGINE THE CLOTHES YOU '),
                                      TextSpan(
                                        text: "CAN'T",
                                        style: TextStyle(
                                          color: Color(0xFFF0FF78),
                                        ),
                                      ),
                                      TextSpan(text: ' GET RID OF.'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Tap select garment to re-discover what your clothes could be',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImagePickerWidget(
                  onImageSelected: (image) =>
                      BlocProvider.of<ImageGenBloc>(context)
                          .generateImage(image: image),
                ),
                const SizedBox(height: 30),
              ],
            )
          ],
        ),
      ),
    );
  }
}
