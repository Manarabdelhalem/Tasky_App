import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 85),
        Image.asset('assets/image/undraw_push-notifications_5z1s 1.png'),
        const SizedBox(height: 10),
        Image.asset('assets/icone/What do you want to do today_.png'),
        const SizedBox(height: 15),
        Image.asset('assets/icone/Tap + to add your tasks.png'),
      ],
    );
  }
}
