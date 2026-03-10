import 'package:flutter/material.dart';

class SquaredFlatButton extends StatelessWidget {
  const SquaredFlatButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  });

  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final tertiary = Theme.of(context).colorScheme.tertiary;
    final onTertiary = Theme.of(context).colorScheme.onTertiary;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: tertiary,
        foregroundColor: onTertiary,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide.none,
        ),
        padding: padding,
      ),
      child: child,
    );
  }
}

class SquaredFlatTextButton extends StatelessWidget {
  const SquaredFlatTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.fontSize,
  });

  final VoidCallback? onPressed;
  final String label;
  final EdgeInsetsGeometry padding;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SquaredFlatButton(
      onPressed: onPressed,
      padding: padding,
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize ?? 26),
      ),
    );
  }
}
