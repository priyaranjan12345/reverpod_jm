
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_jm/widgets/text_widget.dart';

/// __state provider.__<br/>
/// ```
/// final counter = StateProvider<int>(((ref) => 0));
/// final counter = StateProvider.autoDispose<int>(((ref) => 0));
/// ```
/// <br/> *autoDispose* will dispose the state of the page.
/// <br/> otherwise state will be there.
final counterProvider = StateProvider<int>(((ref) => 0));

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider.state).state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inc Dec Number'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: TextWidget(number: counter.toString()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.state).state++;
                  },
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.state).state--;
                  },
                  child: const Text('Decrement'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


