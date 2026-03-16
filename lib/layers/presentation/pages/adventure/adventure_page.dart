import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garment_demo_1/layers/domain/adventure/adventure_entity.dart';
import 'package:garment_demo_1/layers/presentation/blocs/adventure/adventure_cubit.dart';
import 'package:garment_demo_1/layers/presentation/blocs/adventure/adventure_state.dart';
import 'package:garment_demo_1/layers/presentation/blocs/image_gen/image_gen_bloc.dart';
import 'package:garment_demo_1/layers/presentation/pages/adventure/widgets/adventure_nav_widget.dart';
import 'package:garment_demo_1/layers/presentation/pages/adventure/widgets/results_view.dart';
import 'package:garment_demo_1/layers/presentation/pages/image_gen/image_gen_page.dart';

enum _Phase { adventure, results }

class AdventurePage extends StatelessWidget {
  final List<AdventureMenu> menus;

  const AdventurePage({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AdventureCubit(menus: menus)),
        BlocProvider(create: (_) => ImageGenBloc()),
      ],
      child: const _AdventurePageView(),
    );
  }
}

class _AdventurePageView extends StatefulWidget {
  const _AdventurePageView();

  @override
  State<_AdventurePageView> createState() => _AdventurePageViewState();
}

class _AdventurePageViewState extends State<_AdventurePageView> {
  _Phase _phase = _Phase.adventure;
  List<AdventureOption> _choices = [];

  String _buildPrompt(List<AdventureOption> choices) {
    final parts = choices.map((o) => o.name).join(', ');
    return 'Generate 3 photorealistic variations of this garment reimagined as: $parts.';
  }

  void _onPickGarment(Uint8List bytes) {
    final bloc = context.read<ImageGenBloc>();
    bloc.generateImage(image: bytes, prompt: _buildPrompt(_choices));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: bloc,
          child: const ImageGenPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<AdventureCubit, AdventureState>(
      listenWhen: (prev, curr) => curr.isComplete && !prev.isComplete,
      listener: (_, state) => setState(() {
        _choices = state.selectedOptions;
        _phase = _Phase.results;
      }),
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: switch (_phase) {
              _Phase.adventure => const AdventureNavWidget(
                  key: ValueKey('adventure'),
                ),
              _Phase.results => ResultsView(
                  key: const ValueKey('results'),
                  choices: _choices,
                  onPickGarment: _onPickGarment,
                ),
            },
          ),
        ),
      ),
    );
  }
}
