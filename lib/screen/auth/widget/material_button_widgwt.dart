import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  MaterialButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });
  String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xff5F33E1),
      minWidth: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
