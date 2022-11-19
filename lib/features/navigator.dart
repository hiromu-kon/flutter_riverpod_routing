import 'package:flutter/material.dart';
import 'package:flutter_riverpod_sample/features/loading.dart';
import 'package:flutter_riverpod_sample/pages/about_page.dart';
import 'package:flutter_riverpod_sample/services/scaffold_messenger_service.dart';
import 'package:flutter_riverpod_sample/utils/navigator_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationMockProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    ref.read(overlayLoadingProvider.notifier).update((state) => true);

    await Future.delayed(const Duration(seconds: 2));

    ref.watch(overlayLoadingProvider.notifier).update((state) => false);

    ref.read(scaffoldMessengerServiceProvider).showSnackBar('遷移に成功しました。');

    ref.read(navigatorKeyProvider).currentState!.push(
          MaterialPageRoute(
            builder: (context) => const AboutPage(),
          ),
        );
  },
);
