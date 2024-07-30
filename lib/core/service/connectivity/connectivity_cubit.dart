import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(const ConnectivityState());

  late final StreamSubscription _connectivitySubscription;

  Connectivity get _connectivity => Connectivity();

  void observeConnectivity() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      emit(state.copyWith(
          status: result.last == ConnectivityResult.none
              ? ConnectivityStatus.connectionFailed
              : ConnectivityStatus.connectionRestored));
      _connectivityDialogStatus(result.last == ConnectivityResult.none);
    });
  }

  void _connectivityDialogStatus(bool noConnection) {
    if (noConnection) {
      emit(state.copyWith(isDialogShows: true));
    } else if (state.isDialogShows != null) {
      if (!noConnection && state.isDialogShows! == true) {
        emit(state.copyWith(isDialogShows: false));
        emit(state.copyWith(isDialogShows: null));
      }
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
