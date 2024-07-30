part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({this.darkModeEnabled = false, this.notificationEnabled = false});

  final bool darkModeEnabled;
  final bool notificationEnabled;

  SettingsState copyWith({
    bool? darkModeEnabled,
    bool? notificationEnabled,
  }) =>
      SettingsState(
        darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
        notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      );

  @override
  List<Object?> get props => [darkModeEnabled, notificationEnabled];
}
