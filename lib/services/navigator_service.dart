import 'package:flutter/material.dart';
import 'package:flutter_riverpod_sample/utils/navigator_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigatorServiceProvider =
    Provider<NavigatorService>(NavigatorService.new);

class NavigatorService {
  NavigatorService(this._ref);

  final Ref _ref;

  GlobalKey<NavigatorState> get navigatorKey => _ref.read(navigatorKeyProvider);

  /// showDialog で指定したビルダー関数を返す。
  Future<T?> showDialogByBuilder<T>({
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: navigatorKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  /// showModalBottomSheet で指定したビルダー関数を返す。
  Future<T?> showModalBottomSheetByBuilder<T>({
    required Widget Function(BuildContext) builder,
  }) async {
    return showModalBottomSheet<T>(
      context: navigatorKey.currentContext!,
      builder: builder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    );
  }
}
