part of 'settings_bloc.dart';

enum SettingsStatus { pure, onUserLogOut }

class SettingsState extends Equatable {
  const SettingsState({
    this.darkModeEnabled = false,
    this.notificationEnabled = false,
    this.status = SettingsStatus.pure,
  });

  final SettingsStatus status;
  final bool darkModeEnabled;
  final bool notificationEnabled;

  SettingsState copyWith({
    bool? darkModeEnabled,
    bool? notificationEnabled,
    SettingsStatus? status,
  }) =>
      SettingsState(
        darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
        notificationEnabled: notificationEnabled ?? this.notificationEnabled,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [darkModeEnabled, notificationEnabled, status];
}
