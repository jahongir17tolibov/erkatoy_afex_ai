part of 'home_bloc.dart';

class HomeEvent {}

final class OnGetCurrentActivityHomeEvent extends HomeEvent {}

final class OnBottomNavChangedHomeEvent extends HomeEvent {
  OnBottomNavChangedHomeEvent(this.index);

  final int index;
}
