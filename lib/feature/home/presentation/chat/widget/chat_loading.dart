import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/bloc/chat_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/widget/three_dots_animated_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatLoading extends StatelessWidget {
  const ChatLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatBloc, ChatState, bool>(
      selector: (state) => state.isLoading,
      builder: (context, loading) {
        return loading
            ? Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 16, bottom: 16),
                    padding: getPaddingAll10,
                    decoration: BoxDecoration(
                      color: context.themeColors.secondary,
                      borderRadius: getBorderAll16,
                    ),
                    child: const ThreeDotsAnimatedLoading(),
                  ),
                  const Spacer(),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
