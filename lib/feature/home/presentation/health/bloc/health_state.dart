part of 'health_bloc.dart';

enum HealthStatus { pure, onLoading, onSuccess, onError, onShowMessage }

class HealthState extends Equatable {
  const HealthState({
    this.status = HealthStatus.pure,
    this.healthTipsList = const [],
    this.message = '',
  });

  final HealthStatus status;
  final List<Health> healthTipsList;
  final String message;

  HealthState copyWith({
    HealthStatus? status,
    List<Health>? healthTipsList,
    String? message,
  }) =>
      HealthState(
        status: status ?? this.status,
        healthTipsList: healthTipsList ?? this.healthTipsList,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [status, healthTipsList, message];
}
