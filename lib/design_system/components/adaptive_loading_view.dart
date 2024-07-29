import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class AdaptiveLoadingView extends StatelessWidget {
  const AdaptiveLoadingView({super.key, this.color});

  final Color? color;

  static void showLoadingDialog(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      useSafeArea: true,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (_) => AlertDialog.adaptive(
        shape: RoundedRectangleBorder(borderRadius: getBorderAll12),
        title: const AdaptiveLoadingView(),
      ),
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.pop(context);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        // backgroundColor: color ?? context.themeColors.primary,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
