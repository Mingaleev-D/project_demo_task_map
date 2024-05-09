import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  static const routeName = '/support';
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
    );
  }
}
