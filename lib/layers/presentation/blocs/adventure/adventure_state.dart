import 'package:garment_demo_1/layers/domain/adventure/adventure_entity.dart';

class AdventureState {
  /// Stack of menu names visited, starting from the root menu.
  final List<String> menuHistory;

  /// One entry per forward navigation step (including the terminal selection).
  final List<AdventureOption> selectedOptions;

  final bool isComplete;

  const AdventureState({
    required this.menuHistory,
    this.selectedOptions = const [],
    this.isComplete = false,
  });

  String get currentMenuName => menuHistory.last;

  /// True when there is a previous menu to return to, or when the adventure
  /// is complete (so the user can un-select the terminal choice).
  bool get canGoBack => menuHistory.length > 1 || isComplete;
}
