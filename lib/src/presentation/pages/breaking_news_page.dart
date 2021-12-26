import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BreakingNewsPage extends HookWidget {
  const BreakingNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('breakingNewsPage'),
        ],
      ),
    );
  }
}
