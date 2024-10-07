part of 'cry_record_bloc.dart';

sealed class CryRecordEvent {}

final class OnInitialCryRecordEvent extends CryRecordEvent {}

final class OnPressRecordVoiceEvent extends CryRecordEvent {}
