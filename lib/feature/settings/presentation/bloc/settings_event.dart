part of 'settings_bloc.dart';

sealed class SettingsEvent {}

final class OnGetSettingsEvent extends SettingsEvent {}

final class OnSwitchAppThemeSettingsEvent extends SettingsEvent {}

final class OnSwitchNotificationSettingsEvent extends SettingsEvent {}

final class OnContactToDeveloperSettingsEvent extends SettingsEvent {}
