part of 'register_bloc.dart';

enum RegisterStatus { pure, onSuccessful, onShowMessage }

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.pure,
    this.phoneNumber = '',
    this.password = '',
    this.rePassword = '',
    this.obscureState = true,
    this.reObscureState = true,
    this.message,
    this.onLoading,
  });

  final RegisterStatus status;
  final String phoneNumber;
  final String password;
  final String rePassword;
  final bool obscureState;
  final bool reObscureState;
  final String? message;
  final bool? onLoading;

  RegisterState copyWith({
    RegisterStatus? status,
    String? phoneNumber,
    String? password,
    String? rePassword,
    bool? obscureState,
    bool? reObscureState,
    String? message,
    bool? onLoading,
  }) =>
      RegisterState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword,
        obscureState: obscureState ?? this.obscureState,
        reObscureState: reObscureState ?? this.reObscureState,
        message: message ?? this.message,
        onLoading: onLoading ?? this.onLoading,
      );

  @override
  List<Object?> get props =>
      [status, phoneNumber, password, rePassword, obscureState, reObscureState, message, onLoading];
}
