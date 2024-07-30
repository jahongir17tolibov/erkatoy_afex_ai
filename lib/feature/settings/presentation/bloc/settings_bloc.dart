import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/hive_constants.dart';
import 'package:erkatoy_afex_ai/core/provider/local/hive_local_storage.dart';
import 'package:url_launcher/url_launcher.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required this.localStorage}) : super(const SettingsState()) {
    on<OnGetSettingsEvent>(_onGetSettingsEvent);
    on<OnSwitchAppThemeSettingsEvent>(_onSwitchAppThemeSettingsEvent);
    on<OnSwitchNotificationSettingsEvent>(_onSwitchNotificationSettingsEvent);
    on<OnContactToDeveloperSettingsEvent>(_onContactToDeveloperSettingsEvent);
  }

  final HiveLocalStorage localStorage;

  FutureOr<void> _onGetSettingsEvent(
    OnGetSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _getAppThemeState().then((value) async {
      if (value == null) {
        await _saveAppTheme(false);
      } else {
        emit(state.copyWith(darkModeEnabled: value));
      }
    });

    await _getNotificationState().then((value) async {
      if (value == null) {
        await _saveNotificationEnabled(false);
      } else {
        emit(state.copyWith(darkModeEnabled: value));
      }
    });
  }

  FutureOr<void> _onSwitchAppThemeSettingsEvent(
    OnSwitchAppThemeSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final theme = await _getAppThemeState();
    printOnDebug(theme);
    await _saveAppTheme(!state.darkModeEnabled).whenComplete(() {
      emit(state.copyWith(darkModeEnabled: !state.darkModeEnabled));
    });
  }

  FutureOr<void> _onSwitchNotificationSettingsEvent(
    OnSwitchNotificationSettingsEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(notificationEnabled: !state.notificationEnabled));
  }

  FutureOr<void> _onContactToDeveloperSettingsEvent(
    OnContactToDeveloperSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _openTelegram('jamshidds');
  }

  /// repo
  Future<bool?> _getAppThemeState() => localStorage.getBool(
        boxName: HiveConstants.settingsBoxName,
        key: HiveConstants.appThemeKey,
      );

  Future<void> _saveAppTheme(bool value) => localStorage.saveBool(
        boxName: HiveConstants.settingsBoxName,
        key: HiveConstants.appThemeKey,
        value: value,
      );

  Future<bool?> _getNotificationState() => localStorage.getBool(
        boxName: HiveConstants.settingsBoxName,
        key: HiveConstants.notificationKey,
      );

  Future<void> _saveNotificationEnabled(bool value) => localStorage.saveBool(
        boxName: HiveConstants.settingsBoxName,
        key: HiveConstants.notificationKey,
        value: value,
      );

  FutureOr<void> _openTelegram(String userName) async {
    final Uri telegramUrl = Uri.parse('https://t.me/$userName');
    if (await canLaunchUrl(telegramUrl)) {
      await launchUrl(telegramUrl);
    } else {
      throw 'Could not launch $telegramUrl';
    }
  }
}
