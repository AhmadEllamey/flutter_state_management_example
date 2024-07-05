import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProviderSelectorExample extends StatelessWidget {
  const ProviderSelectorExample({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild all");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ChangeNotifierProvider(
        create: (_){
          return Counter();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Selector<Counter, int>(
                selector: (context, counter) => counter.count,
                builder: (context, count, child) {
                  debugPrint("rebuild Counter State");
                  return Text('Counter: $count');
                },
              ),
              const SizedBox(height: 20),
              Selector<Counter, int>(
                selector: (context, counter) => counter.anotherState,
                builder: (context, anotherState, child) {
                  debugPrint("rebuild Another State");
                  return Text('Another State: $anotherState');
                },
              ),
              const SizedBox(height: 20),
              Consumer<Counter>(
                builder: (context, counter, child) {
                  return ElevatedButton(
                    onPressed: counter.increment,
                    child: const Text('Increment Counter'),
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer<Counter>(
                builder: (context, counter, child) {
                  return ElevatedButton(
                    onPressed: counter.incrementAnotherState,
                    child: const Text('Increment Another State'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Counter with ChangeNotifier {
  int _count = 0;
  int _anotherState = 0; // Additional state to demonstrate Selector

  int get count => _count;
  int get anotherState => _anotherState;

  void increment() {
    _count++;
    notifyListeners();
  }

  void incrementAnotherState() {
    _anotherState++;
    notifyListeners();
  }
}