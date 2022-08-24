import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_jm/widgets/text_widget.dart';

// get data on basis of provider

final cityProvider = Provider<String>(((ref) => 'BBS'));

Future<int> fetchWeather(String city) async {
  await Future.delayed(const Duration(seconds: 2));
  return city == 'BBS' ? 40 : 20;
}

final futureCityProvider = FutureProvider(((ref) {
  final city = ref.watch(cityProvider);

  return fetchWeather(city);
}));

// get data on basis of state provider
final petProvider = StateProvider<String>(((ref) => 'Dog'));

Future<String> fetchAnimal(String name) async {
  await Future.delayed(const Duration(seconds: 2));
  switch (name) {
    case 'Dog':
      return 'Animals';

    case 'Parrot':
      return 'Birds';

    case 'Fighter Fish':
      return 'Fish';

    default:
      return 'Not found';
  }
}

final futurePetProvider = FutureProvider(((ref) {
  final name = ref.watch(petProvider);

  return fetchAnimal(name);
}));

/// [fetchData()] method can be return either exception or future data
///  <br/>__Example : __
/// ```
/// Future<int> fetchData() async {
///   await Future.delayed(const Duration(seconds: 2));
///   return throw Exception() or 100;
/// }
/// ```
Future<int> fetchData() async {
  await Future.delayed(const Duration(seconds: 2));
  return 100;
}

/// __future provider.__<br/>
/// ```
/// final futureProvider = FutureProvider.autoDispose(((ref) => fetchData()));
/// final futureProvider = FutureProvider(((ref) => fetchData()));
/// ```
/// <br/> *autoDispose* will dispose the state of the page.
/// <br/> otherwise state will be there.
final futureProvider = FutureProvider(((ref) => fetchData()));

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ```
    /// final futureData = ref.watch(futureProvider.future);
    /// ```
    /// <br/> then use FutureBuilder
    final futureData = ref.watch(futurePetProvider);
    // final futureData = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: futureData.when(
              data: (String data) => TextWidget(number: data.toString()),
              error: (Object error, StackTrace? stackTrace) =>
                  const TextWidget(number: 'Error data'),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                ref.read(petProvider.state).state = 'Fighter Fish';
              },
              child: const Text('Get Data'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                ref.read(petProvider.state).state = 'Dog';
              },
              child: const Text('Get Data Again'),
            ),
          ),
        ],
      ),
    );
  }
}
