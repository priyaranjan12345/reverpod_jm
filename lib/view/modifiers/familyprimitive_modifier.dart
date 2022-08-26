import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_jm/view/modifiers/user_helper.dart';

final userStateProvider = StateProvider.autoDispose<User>(
  ((ref) => users.first),
);

final userFutureProvider = FutureProvider.autoDispose.family<User, String>(
  ((ref, username) async {
    return fetchUser(username);
  }),
);

Future<List<User>> fetchAllUsers() async {
  return [];
}

Future<User> fetchUser(String username) async {
  await Future.delayed(const Duration(seconds: 2));

  return users.firstWhere((user) => user.name == username);
}

class FamiliPrimitiveModifierPage extends StatelessWidget {
  const FamiliPrimitiveModifierPage({Key? key}) : super(key: key);

  Widget userWidget(User user) => Column(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(user.urlAvatar),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Name ${user.name}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
          Center(
            child: Text(
              'Age : ${user.age}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
          Center(
            child: Text(
              'Gender : ${user.gender}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Primitives'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Search',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Consumer(
              builder: (context, ref, child) {
                final userState = ref.watch(userStateProvider.state).state;
                final futureData =
                    ref.watch(userFutureProvider(userState.name));

                return futureData.when(
                  data: (user) => userWidget(user),
                  error: (Object error, StackTrace? stackTrace) =>
                      Text('Error : ${error.toString()}'),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final userState = ref.watch(userStateProvider.state).state;

                    return DropdownButton<User>(
                      value: userState,
                      items: users
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (user) {
                        ref.read(userStateProvider.state).state = user!;
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
