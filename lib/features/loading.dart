import 'package:hooks_riverpod/hooks_riverpod.dart';

final overlayLoadingProvider = StateProvider<bool>((ref) => false);

final asyncFuncOverlayLoadingProvider =
    Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    ref.read(overlayLoadingProvider.notifier).update((state) => true);

    await Future.delayed(const Duration(seconds: 1));

    ref.watch(overlayLoadingProvider.notifier).update((state) => false);
  },
);
