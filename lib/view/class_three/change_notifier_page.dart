import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_jm/widgets/text_widget.dart';

class CarNotifier extends ChangeNotifier {
  int speed = 120;

  void increaseSpeed() {
    speed += 10;

    notifyListeners();
  }

  void decreaseSpeed() {
    speed = max(0, speed - 10);

    notifyListeners();
  }
}

/// __Change Notifier provider.__<br/>
/// ```
/// final carProvider = ChangeNotifierProvider.autoDispose<CarNotifier>(
///   ((ref) => CarNotifier()),
/// );
///
/// final carProvider = ChangeNotifierProvider<CarNotifier>(
///  ((ref) => CarNotifier()),
///);
/// ```
/// <br/> *autoDispose* will dispose the state of the page.
/// <br/> otherwise state will be there.
final carProvider = ChangeNotifierProvider.autoDispose<CarNotifier>(
  ((ref) => CarNotifier()),
);

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  Widget pageButton(WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              ref.read(carProvider).increaseSpeed();
            },
            child: const Text('Speed (+10)'),
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              ref.read(carProvider).decreaseSpeed();
            },
            child: const Text('Break (-10)'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final car = ref.watch(carProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: TextWidget(
              number: car.speed.toString(),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          pageButton(ref),
        ],
      ),
    );
  }
}
