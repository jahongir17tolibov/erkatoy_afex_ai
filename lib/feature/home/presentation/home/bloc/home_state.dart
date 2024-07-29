part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.currentActivity = '',
  });

  final String currentActivity;

  HomeState copyWith({
    String? currentActivity,
  }) =>
      HomeState(
        currentActivity: currentActivity ?? this.currentActivity,
      );

  @override
  List<Object?> get props => [currentActivity];
}
