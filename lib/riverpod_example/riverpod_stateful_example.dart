import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class RiverpodStatefulExample extends ConsumerStatefulWidget {
  const RiverpodStatefulExample({super.key});

  @override
  ConsumerState<RiverpodStatefulExample> createState() =>
      _RiverpodStatefulExampleState();
}

class _RiverpodStatefulExampleState
    extends ConsumerState<RiverpodStatefulExample> {

  final counterProvider = StateNotifierProvider<CounterViewModel, int>(
    (ref) {
      return CounterViewModel(0);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverpodStatefulExample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${ref.watch(counterProvider)}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                ref.read(counterProvider.notifier).increment();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterViewModel extends StateNotifier<int> {
  CounterViewModel(super.state);

  void increment() {
    state = state + 1;
  }
}
