import 'package:erkatoy_afex_ai/core/service/connectivity/connectivity_cubit.dart';
import 'package:erkatoy_afex_ai/di.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvideApplication extends StatelessWidget {
  const ProvideApplication({super.key, required this.child});

  final Widget Function(bool darkModeEnabled) child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>(create: (_) => getIt<ConnectivityCubit>()),
        BlocProvider<SettingsBloc>(create: (_) => getIt<SettingsBloc>()..add(OnGetSettingsEvent())),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return child.call(state.darkModeEnabled);
        }
        // MediaQuery(
        // data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
        // child: child.call(state.darkModeEnabled),
        // )
        ,
      ),
    );
  }
}
