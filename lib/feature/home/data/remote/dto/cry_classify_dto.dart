import 'package:equatable/equatable.dart';

class CryClassifyDto extends Equatable {
  const CryClassifyDto({this.message, this.result, this.detail});

  final String? message;
  final String? result;
  final String? detail;

  factory CryClassifyDto.fromJson(Map<String, dynamic> json) {
    return CryClassifyDto(
      result: json['result'] as String?,
      message: json['message'] as String?,
      detail: json['detail'] as String?,
    );
  }

  @override
  List<Object?> get props => [message, result, detail];
}
