import 'package:flutter/material.dart';

import '../core/constants.dart';

class NoteButton extends StatelessWidget {
  const NoteButton({
    super.key,
    required this.child,
    this.onPressed,
    this.isOutlined = false,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: isOutlined ? gray900 : const Color.fromARGB(255, 8, 8, 8),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? white : gray900,
          foregroundColor: isOutlined ? gray900 : white,
          disabledBackgroundColor: theme.primaryColor,
          disabledForegroundColor: black,
          side: BorderSide(color: isOutlined ? gray900 : black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: child,
      ),
    );
  }
}
