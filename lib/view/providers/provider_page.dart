import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_jm/widgets/text_widget.dart';

// declaration of simple provider
final numberProvider = Provider<int>(((ref) => 40));

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Page'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final number = ref.watch(numberProvider);

            return TextWidget(number: number.toString());
          },
        ),
      ),
    );
  }
}
