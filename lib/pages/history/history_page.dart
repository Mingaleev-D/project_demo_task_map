import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  static const routeName = '/history';
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
    );
  }
}
