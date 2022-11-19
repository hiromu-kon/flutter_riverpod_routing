import 'package:flutter/material.dart';
import 'package:flutter_riverpod_sample/features/loading.dart';
import 'package:flutter_riverpod_sample/features/navigator.dart';
import 'package:flutter_riverpod_sample/services/navigator_service.dart';
import 'package:flutter_riverpod_sample/services/scaffold_messenger_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ThirdPage
class ThirdPage extends HookConsumerWidget {
  const ThirdPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ThirdPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => ref
                  .read(scaffoldMessengerServiceProvider)
                  .showSnackBar('Third Page'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('Snackbarを表示'),
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(navigatorServiceProvider).showDialogByBuilder(
                        builder: (context) => const AlertDialog(
                          title: Text('Third Page'),
                          content: Text('ダイアログです。'),
                        ),
                      ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('Dialogを表示'),
            ),
            ElevatedButton(
              onPressed: () => ref
                  .read(navigatorServiceProvider)
                  .showModalBottomSheetByBuilder(
                    builder: (context) => Container(),
                  ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text('BottomSheetを表示'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(asyncFuncOverlayLoadingProvider).call(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: const Text('Loadingを表示'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(navigationMockProvider).call(),
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}
