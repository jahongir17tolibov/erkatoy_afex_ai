import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryReasonContainer extends StatelessWidget {
  const CryReasonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          width: 1.screenWidth(context),
          padding: getPaddingAll10,
          decoration: BoxDecoration(
            color: context.themeColors.surface.withOpacity(0.8),
            borderRadius: getBorderAll16,
          ),
          child: TextView(
            text: getReason(state),
            textColor: context.themeColors.onSurface,
            textSize: 14.textSize(context),
          ),
        );
      },
    );
  }

  String getReason(HomeState state) {
    if (!state.isLoading) {
      return state.cryReason.isEmpty
          ? 'Sababni bilish uchun ovozni yozib oling...'
          : 'Sabab: ${state.cryReason}';
    }
    return 'Eshitilmoqda...';
  }
}
