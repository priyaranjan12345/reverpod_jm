import 'package:flutter/material.dart';

class AutoDisposeModifierPage extends StatelessWidget {
  const AutoDisposeModifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto-Dispose'),
      ),
      body: const Center(
        child:
            Text('For dispose the state add \'.autoDispose\' to the provider'),
      ),
    );
  }
}
