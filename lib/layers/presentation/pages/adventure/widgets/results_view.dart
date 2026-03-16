import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:garment_demo_1/layers/domain/adventure/adventure_entity.dart';
import 'package:garment_demo_1/layers/presentation/widgets/loom_header.dart';
import 'package:image_picker/image_picker.dart';

class ResultsView extends StatefulWidget {
  final List<AdventureOption> choices;
  final void Function(Uint8List) onPickGarment;

  const ResultsView({
    super.key,
    required this.choices,
    required this.onPickGarment,
  });

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  final _picker = ImagePicker();
  bool _picking = false;

  Future<void> _pick() async {
    setState(() => _picking = true);
    final xfile = await _picker.pickImage(source: ImageSource.gallery);
    if (!mounted) return;
    setState(() => _picking = false);
    if (xfile == null) return;
    final bytes = await xfile.readAsBytes();
    widget.onPickGarment(bytes);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LoomHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Your Choices',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${widget.choices.length} choices made',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.primary.withValues(alpha: 0.6),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: widget.choices.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final option = widget.choices[index];
              return Container(
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        colorScheme.secondary.withValues(alpha: 0.3),
                    child: Icon(option.icon, color: colorScheme.primary, size: 20),
                  ),
                  title: Text(
                    option.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    'Step ${index + 1}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.primary.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Now choose a photo of the item you want to see transformed',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _picking ? null : _pick,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.tertiary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  'Pick garment',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
