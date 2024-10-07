part of 'cry_record_bloc.dart';

enum CryRecordStatus { pure, initial, onLoading, onSuccess, onError }

class CryRecordState extends Equatable {
  const CryRecordState({
    this.status = CryRecordStatus.pure,
    this.cryReason = '',
    this.recordPath = '',
    this.isRecording = false,
  });

  final CryRecordStatus status;
  final String cryReason;
  final String recordPath;
  final bool isRecording;

  CryRecordState copyWith({
    CryRecordStatus? status,
    String? cryReason,
    String? recordPath,
    bool? isRecording,
  }) =>
      CryRecordState(
        status: status ?? this.status,
        cryReason: cryReason ?? this.cryReason,
        recordPath: recordPath ?? this.recordPath,
        isRecording: isRecording ?? this.isRecording,
      );

  @override
  List<Object?> get props => [status, cryReason, recordPath, isRecording];
}
