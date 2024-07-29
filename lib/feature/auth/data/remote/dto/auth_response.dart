import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  const AuthResponse({this.phone, this.message, this.accessToken, this.detail});

  final String? phone;
  final String? message;
  final String? accessToken;
  final String? detail;

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      phone: json['phone'] as String?,
      accessToken: json['access_token'] as String?,
      message: json['message'] as String?,
      detail: json['detail'] as String?,
    );
  }

  @override
  List<Object?> get props => [phone, accessToken, message, detail];
}
