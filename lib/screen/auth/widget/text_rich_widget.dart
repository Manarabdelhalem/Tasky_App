import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextRichWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const TextRichWidget({
    super.key,
    required this.subTitle,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: title),
            TextSpan(
              text: subTitle,
              style: const TextStyle(fontSize: 16, color: Color(0xff5F33E1)),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
