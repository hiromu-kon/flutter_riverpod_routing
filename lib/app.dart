import 'package:flutter/material.dart';
import 'package:flutter_riverpod_sample/pages/home_page.dart';
import 'package:flutter_riverpod_sample/pages/root_navigator.dart';
import 'package:flutter_riverpod_sample/services/scaffold_messenger_service.dart';
import 'package:flutter_riverpod_sample/utils/navigator_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: const HomePage(),
      scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
      navigatorKey: ref.watch(navigatorKeyProvider),
      builder: (BuildContext context, Widget? child) {
        return child == null ? const SizedBox() : RootNavigator(child: child);
      },
    );
  }
}
