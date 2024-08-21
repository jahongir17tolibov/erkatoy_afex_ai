part of 'login_bloc.dart';

enum LoginStatus { pure, onSuccessful, onShowMessage }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.pure,
    this.phoneNumber = '',
    this.password = '',
    this.isValid = false,
    this.obscureState = true,
    this.message,
    this.onLoading,
  });

  final LoginStatus status;
  final String phoneNumber;
  final String password;
  final bool isValid;
  final bool obscureState;
  final String? message;
  final bool? onLoading;

  LoginState copyWith({
    LoginStatus? status,
    String? phoneNumber,
    String? password,
    bool? isValid,
    bool? obscureState,
    String? message,
    bool? onLoading,
  }) =>
      LoginState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid,
        obscureState: obscureState ?? this.obscureState,
        message: message ?? this.message,
        onLoading: onLoading ?? this.onLoading,
      );

  @override
  List<Object?> get props =>
      [status, phoneNumber, password, isValid, obscureState, message, onLoading];
}
