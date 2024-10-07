part of 'login_bloc.dart';

enum LoginStatus { pure, onSuccessful, onShowMessage, onShowDialog, onHideDialog }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.pure,
    this.phoneNumber = '',
    this.password = '',
    this.isValid = false,
    this.obscureState = true,
    this.message,
  });

  final LoginStatus status;
  final String phoneNumber;
  final String password;
  final bool isValid;
  final bool obscureState;
  final String? message;

  LoginState copyWith({
    LoginStatus? status,
    String? phoneNumber,
    String? password,
    bool? isValid,
    bool? obscureState,
    String? message,
  }) =>
      LoginState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid,
        obscureState: obscureState ?? this.obscureState,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [status, phoneNumber, password, isValid, obscureState, message];
}
