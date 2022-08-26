import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Car {
  final int speed;
  final int doors;

  Car({
    this.speed = 120,
    this.doors = 4,
  });

  Car copy({
    int? speed,
    int? doors,
  }) =>
      Car(
        speed: speed ?? this.speed,
        doors: doors ?? this.doors,
      );
}

class CarNotifier extends StateNotifier<Car> {
  CarNotifier(super.state);

  void setDoors(int doors) {
    final newState = state.copy(doors: doors);
    state = newState;
  }

  void increaseSpeed() {
    final speed = state.speed + 10;
    final newState = state.copy(speed: speed);
    state = newState;
  }

  void decreaseSpeed() {
    final speed = max(0, state.speed - 10);
    final newState = state.copy(speed: speed);
    state = newState;
  }
}

/// __State Notifier provider.__<br/>
/// ```
/// final stateNotifierProvider =
///     StateNotifierProvider.autoDispose<CarNotifier, Car>(
///         ((ref) => CarNotifier(Car())));
///
/// final stateNotifierProvider =
///     StateNotifierProvider<CarNotifier, Car>(
///         ((ref) => CarNotifier(Car())));
/// ```
/// <br/> *autoDispose* will dispose the state of the page.
/// <br/> otherwise state will be there.
final stateNotifierProvider =
    StateNotifierProvider.autoDispose<CarNotifier, Car>(
  ((ref) => CarNotifier(Car())),
);

class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({Key? key}) : super(key: key);

  Widget pageButton(WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              ref.read(stateNotifierProvider.notifier).increaseSpeed();
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
              ref.read(stateNotifierProvider.notifier).decreaseSpeed();
            },
            child: const Text('Break (-10)'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final car = ref.watch(stateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Spped : ${car.speed.toString()}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              'Doors : ${car.doors.toString()}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          pageButton(ref),
          const SizedBox(
            height: 40,
          ),
          Slider(
            value: car.doors.toDouble(),
            max: 10,
            onChanged: (value) {
              ref.read(stateNotifierProvider.notifier).setDoors(value.toInt());
            },
          ),
        ],
      ),
    );
  }
}
