import 'package:erkatoy_afex_ai/app/provide_application.dart';
import 'package:erkatoy_afex_ai/core/localization/app_localizations.dart';
import 'package:erkatoy_afex_ai/core/navigation/app_router.dart';
import 'package:erkatoy_afex_ai/design_system/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProvideApplication(
      child: (darkModeEnabled) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
          theme: MaterialTheme.lightTheme,
          darkTheme: MaterialTheme.darkTheme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: AppLocalizations.uzLocale,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
