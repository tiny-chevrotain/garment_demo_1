import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garment_demo_1/layers/domain/adventure/adventure_entity.dart';
import 'package:garment_demo_1/layers/presentation/blocs/adventure/adventure_state.dart';

class AdventureCubit extends Cubit<AdventureState> {
  final List<AdventureMenu> menus;

  AdventureCubit({required this.menus})
      : assert(menus.isNotEmpty, 'At least one menu must be provided'),
        super(AdventureState(menuHistory: [menus.first.name]));

  AdventureMenu get currentMenu =>
      menus.firstWhere((m) => m.name == state.currentMenuName);

  void selectOption(AdventureOption option) {
    final newSelections = [...state.selectedOptions, option];
    final nextMenuExists =
        option.goTo.isNotEmpty && menus.any((m) => m.name == option.goTo);

    if (!nextMenuExists) {
      // Terminal selection — adventure complete
      emit(AdventureState(
        menuHistory: state.menuHistory,
        selectedOptions: newSelections,
        isComplete: true,
      ));
    } else {
      emit(AdventureState(
        menuHistory: [...state.menuHistory, option.goTo],
        selectedOptions: newSelections,
      ));
    }
  }

  void goBack() {
    if (state.isComplete) {
      // Undo the terminal selection, stay on the same menu
      emit(AdventureState(
        menuHistory: state.menuHistory,
        selectedOptions: state.selectedOptions
            .sublist(0, state.selectedOptions.length - 1),
      ));
    } else if (state.menuHistory.length > 1) {
      // Go back one menu level
      emit(AdventureState(
        menuHistory:
            state.menuHistory.sublist(0, state.menuHistory.length - 1),
        selectedOptions: state.selectedOptions
            .sublist(0, state.selectedOptions.length - 1),
      ));
    }
  }

  void reset() {
    emit(AdventureState(menuHistory: [menus.first.name]));
  }
}
