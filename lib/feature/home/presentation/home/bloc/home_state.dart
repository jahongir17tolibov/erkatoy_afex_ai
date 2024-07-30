part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.currentActivity = '',
    this.recordPath = '',
    this.cryReason = '',
    this.isRecording = false,
    this.isLoading = false,
  });

  final String currentActivity;
  final String cryReason;
  final String recordPath;
  final bool isRecording;
  final bool isLoading;

  HomeState copyWith({
    String? currentActivity,
    String? recordPath,
    String? cryReason,
    bool? isRecording,
    bool? isLoading,
  }) =>
      HomeState(
        currentActivity: currentActivity ?? this.currentActivity,
        recordPath: recordPath ?? this.recordPath,
        cryReason: cryReason ?? this.cryReason,
        isRecording: isRecording ?? this.isRecording,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [currentActivity, cryReason, recordPath, isRecording, isLoading];
}
