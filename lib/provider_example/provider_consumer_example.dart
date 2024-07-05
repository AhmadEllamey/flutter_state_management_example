import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderConsumerExample extends StatelessWidget {
  const ProviderConsumerExample({super.key, required this.title});

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
              Consumer<Counter>(
                builder: (context, counter, child) {
                  debugPrint("rebuild Counter");
                  return Text('Counter: ${counter.count}');
                },
              ),
              const SizedBox(height: 20),
              Consumer<Counter>(
                builder: (context, counter, child) {
                  debugPrint("rebuild Increase Button");
                  return ElevatedButton(
                    onPressed: counter.increment,
                    child: const Text('Increment'),
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

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}


