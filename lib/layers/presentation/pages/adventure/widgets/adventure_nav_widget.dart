import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garment_demo_1/layers/presentation/blocs/adventure/adventure_cubit.dart';
import 'package:garment_demo_1/layers/presentation/blocs/adventure/adventure_state.dart';
import 'package:garment_demo_1/layers/presentation/pages/adventure/widgets/breadcrumb_bar.dart';
import 'package:garment_demo_1/layers/presentation/pages/adventure/widgets/menu_view.dart';
import 'package:garment_demo_1/layers/presentation/widgets/loom_header.dart';

class AdventureNavWidget extends StatelessWidget {
  const AdventureNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdventureCubit, AdventureState>(
      builder: (context, state) {
        if (state.isComplete) return const SizedBox.shrink();
        final theme = Theme.of(context);
        final cubit = context.read<AdventureCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoomHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  if (state.canGoBack)
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: theme.colorScheme.primary,
                      onPressed: cubit.goBack,
                    )
                  else
                    const SizedBox(width: 48),
                  Expanded(
                    child: Text(
                      state.currentMenuName,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BreadcrumbBar(selectedOptions: state.selectedOptions),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.05, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                ),
                child: MenuView(
                  key: ValueKey(state.currentMenuName),
                  menu: cubit.currentMenu,
                  onSelect: cubit.selectOption,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
