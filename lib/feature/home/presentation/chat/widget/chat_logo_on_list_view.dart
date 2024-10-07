import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:flutter/material.dart';

class ChatLogoOnListView extends StatelessWidget {
  const ChatLogoOnListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Image.asset(
        ImagesConstants.chatAiImg,
        width: 120,
        height: 120,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
