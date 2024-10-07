import 'package:erkatoy_afex_ai/core/service/connectivity/connectivity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension StringExtensions on String {
  bool get phoneNumbIsValid {
    final RegExp regex = RegExp(r'^\+998\d{9}$');
    return regex.hasMatch(this);
  }

  String get capitalize => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  TextSpan get parseMarkdown {
    List<TextSpan> children = [];

    // regexs
    final boldRegex = RegExp(r'\*\*(.*?)\*\*');
    final italicRegex = RegExp(r'\*(.*?)\*');

    splitMapJoin(boldRegex, onMatch: (match) {
      children.add(
        TextSpan(
          text: match.group(1),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
      return '';
    }, onNonMatch: (nonMatch) {
      nonMatch.splitMapJoin(
        italicRegex,
        onMatch: (Match match) {
          children.add(
            TextSpan(
              text: match.group(1),
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          );
          return '';
        },
        onNonMatch: (String nonItalic) {
          children.add(TextSpan(text: nonItalic));
          return '';
        },
      );
      return '';
    });

    return TextSpan(children: children);
  }
}

extension BuildContextExtensions on BuildContext {
  bool get getConnectivity =>
      read<ConnectivityCubit>().state.status != ConnectivityStatus.connectionFailed;

  void unFocusingKeyboard(VoidCallback callBack) {
    final FocusScopeNode focusScope = FocusScope.of(this);
    if (!focusScope.hasPrimaryFocus) focusScope.unfocus();
    callBack.call();
  }
}
