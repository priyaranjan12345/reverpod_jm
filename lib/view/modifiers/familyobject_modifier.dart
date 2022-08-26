import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reverpod_jm/view/modifiers/user_helper.dart';

final ageStateProvider = StateProvider.autoDispose<int>(
  ((ref) => 24),
);

final isMaleStateProvider = StateProvider.autoDispose<bool>(
  ((ref) => false),
);

final userFutureProvider = FutureProvider.autoDispose.family<User, UserRequest>(
  ((ref, userReq) async {
    return fetchUser(userReq);
  }),
);

class UserRequest {
  final bool isMale;
  final int age;

  const UserRequest({
    required this.isMale,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRequest &&
          runtimeType == other.runtimeType &&
          isMale == other.isMale &&
          age == other.age;

  @override
  int get hashCode => isMale.hashCode ^ age.hashCode;
}

Future<User> fetchUser(UserRequest userRequest) async {
  await Future.delayed(const Duration(seconds: 2));

  final gender = userRequest.isMale ? 'M' : 'F';

  return users.firstWhere(
    (user) => user.age == userRequest.age && user.gender == gender,
  );
}

class FamiliObjectModifierPage extends StatelessWidget {
  const FamiliObjectModifierPage({Key? key}) : super(key: key);

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
        title: const Text('Family Object'),
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
            Consumer(builder: (context, ref, child) {
              final ageState = ref.watch(ageStateProvider.state).state;
              final isMaleState = ref.watch(isMaleStateProvider.state).state;
              var userReq = UserRequest(
                isMale: isMaleState,
                age: ageState,
              );
              final future = ref.watch(userFutureProvider(userReq));

              return future.when(
                data: (user) => userWidget(user),
                error: (Object error, StackTrace? stackTrace) => Center(
                  child: Text(
                    'Error : ${error.toString()}',
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Is Male',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  final isMaleState =
                      ref.watch(isMaleStateProvider.state).state;
                  return Switch(
                    value: isMaleState,
                    onChanged: (isMale) {
                      ref.read(isMaleStateProvider.state).state = isMale;
                    },
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Age',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  final ageState = ref.watch(ageStateProvider.state).state;

                  return DropdownButton<int>(
                    value: ageState,
                    items: [24, 28, 32]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              '${e.toString()} years old',
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
                      ref.read(ageStateProvider.state).state = user!;
                    },
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
