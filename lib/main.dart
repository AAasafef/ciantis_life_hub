import 'package:flutter/material.dart';
import 'core/theme.dart';

void main() {
  runApp(const CiantisApp());
}

class CiantisApp extends StatelessWidget {
  const CiantisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ciantis Life Hub',
      theme: CiantisTheme.light,
      home: const _BaseScreen(),
    );
  }
}

class _BaseScreen extends StatelessWidget {
  const _BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Ciantis Life Hub'),
      ),
    );
  }
}
