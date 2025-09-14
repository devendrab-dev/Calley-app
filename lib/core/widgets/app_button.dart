import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.onPressed, required this.title});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(6),
          width: double.infinity,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
