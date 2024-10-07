part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.currentTime = '',
    this.currentActivity = '',
    this.currentPageIndex = 0,
    this.isLoading = false,
  });

  final String currentTime;
  final String currentActivity;
  final int currentPageIndex;
  final bool isLoading;

  HomeState copyWith({
    String? currentTime,
    String? currentActivity,
    int? currentPageIndex,
    bool? isLoading,
  }) =>
      HomeState(
        currentTime: currentTime ?? this.currentTime,
        currentActivity: currentActivity ?? this.currentActivity,
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [currentTime, currentActivity, currentPageIndex, isLoading];
}
