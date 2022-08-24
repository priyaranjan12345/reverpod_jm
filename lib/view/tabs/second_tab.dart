import 'package:flutter/material.dart';
import 'package:reverpod_jm/view/class_three/change_notifier_page.dart';
import 'package:reverpod_jm/view/class_three/state_notifier_provider.dart';

class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  void navigationTo({required BuildContext context, required Widget page}) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: ((context) => page)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(40, 50)),
              onPressed: () => navigationTo(
                context: context,
                page: const ChangeNotifierPage(),
              ),
              child: const Text('Change Notifier Provider'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(40, 50)),
              onPressed: () => navigationTo(
                context: context,
                page: const StateNotifierPage(),
              ),
              child: const Text('State Notifier Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
