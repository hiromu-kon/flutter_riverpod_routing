import 'package:flutter/material.dart';
import 'package:flutter_riverpod_sample/features/loading.dart';
import 'package:flutter_riverpod_sample/widgets/overlay_loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootNavigator extends HookConsumerWidget {
  const RootNavigator({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            child,
            if (ref.watch(overlayLoadingProvider)) const OverlayLoadingWidget(),
          ],
        ),
      ),
    );
  }
}
