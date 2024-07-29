part of 'health_bloc.dart';

sealed class HealthEvent {}

final class OnGetHealthTipsListEvent extends HealthEvent {}

final class OnExpandListItemHealthEvent extends HealthEvent {
  OnExpandListItemHealthEvent(this.item);

  final String item;
}
