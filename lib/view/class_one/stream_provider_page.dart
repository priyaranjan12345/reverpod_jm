import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_jm/widgets/text_widget.dart';

/// __stream provider.__<br/>
/// ```
/// final StreamProvider = StreamProvider.autoDispose(((ref) => fetchData()));
/// final StreamProvider = StreamProvider(((ref) => fetchData()));
/// ```
/// <br/> *autoDispose* will dispose the state of the page.
/// <br/> otherwise state will be there.
final streamProvider = StreamProvider.autoDispose<int>(
  ((ref) => Stream.periodic(
        const Duration(seconds: 2),
        (counter) => counter,
      )),
);

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ```
    /// final futureData = ref.watch(streamProvider.stream);
    /// ```
    /// <br/> then use StreamBuilder
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Center(
        child: streamData.when(
          data: (int data) => TextWidget(number: data.toString()),
          error: (Object error, StackTrace? stackTrace) =>
              const TextWidget(number: 'Error data'),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
