import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_jm/view/tabs/reverpod_provides.dart';
import 'package:reverpod_jm/view/tabs/reverpod_notifiers.dart';
import 'package:reverpod_jm/view/tabs/reverpod_modifiers.dart';

final indexProvider = StateProvider<int>(((ref) => 0));

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexData = ref.watch(indexProvider.state).state;

    PageController pageController = PageController(
      initialPage: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reverpod'),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          FirstTab(),
          SecondTab(),
          ThirdTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indexData,
        onDestinationSelected: (int index) {
          ref.read(indexProvider.state).state = index;
          pageController.jumpToPage(index);
        },
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.explore,
              color: Colors.indigo,
            ),
            icon: Icon(
              Icons.explore,
              color: Colors.indigo,
            ),
            label: 'Reverpod Providers',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.commute,
              color: Colors.indigo,
            ),
            icon: Icon(
              Icons.commute,
              color: Colors.indigo,
            ),
            label: 'Reverpod Notifiers',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.account_circle,
              color: Colors.indigo,
            ),
            icon: Icon(
              Icons.account_circle,
              color: Colors.indigo,
            ),
            label: 'Reverpod Modifiers',
          ),
        ],
      ),
    );
  }
}
