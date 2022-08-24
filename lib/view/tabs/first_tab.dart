import 'package:flutter/material.dart';
import 'package:reverpod_jm/view/class_one/future_provider_page.dart';
import 'package:reverpod_jm/view/class_one/provider_page.dart';
import 'package:reverpod_jm/view/class_one/state_provider.dart';
import 'package:reverpod_jm/view/class_one/stream_provider_page.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigationTo({required BuildContext context, required Widget page}) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => page)),
      );
    }

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
                page: const ProviderPage(),
              ),
              child: const Text('Page Provider'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(40, 50)),
              onPressed: () => navigationTo(
                  context: context, page: const StateProviderPage()),
              child: const Text('State Provider'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(40, 50)),
              onPressed: () => navigationTo(
                context: context,
                page: const FutureProviderPage(),
              ),
              child: const Text('Future Provider'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(40, 50)),
              onPressed: () => navigationTo(
                context: context,
                page: const StreamProviderPage(),
              ),
              child: const Text('Stream Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
