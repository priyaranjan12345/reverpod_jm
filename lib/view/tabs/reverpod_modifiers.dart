import 'package:flutter/material.dart';
import 'package:reverpod_jm/view/modifiers/autodispose_modifier.dart';
import 'package:reverpod_jm/view/modifiers/familyobject_modifier.dart';
import 'package:reverpod_jm/view/modifiers/familyprimitive_modifier.dart';

class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

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
                page: const FamiliPrimitiveModifierPage(),
              ),
              child: const Text('Family Primitives'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(40, 50)),
              onPressed: () => navigationTo(
                context: context,
                page: const FamiliObjectModifierPage(),
              ),
              child: const Text('Family Object'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(40, 50)),
              onPressed: () => navigationTo(
                context: context,
                page: const AutoDisposeModifierPage(),
              ),
              child: const Text('Auto-Dispose'),
            ),
          ],
        ),
      ),
    );
  }
}
