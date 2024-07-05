import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_examples/provider_example/provider_selector_example.dart';

import 'provider_example/provider_consumer_example.dart';
import 'riverpod_example/riverpod_stateful_example.dart';
import 'riverpod_example/riverpod_stateless_example.dart';
import 'set_state_example/set_state_example.dart';

void main() {
  /// while using the riverpod example surround MyApp with ProviderScope
  /// else remove it
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SetStateExample(title: 'Set State Example'),
      // home: const ProviderConsumerExample(title: 'Provider Consumer'),
      // home: const ProviderSelectorExample(title: 'Provider Selector'),
      // home: const RiverpodStatefulExample(),
      home: RiverpodStatelessExample(),
    );
  }
}
