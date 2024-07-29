import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/image_asset_icon.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/creating_account_screen.dart';
import 'package:erkatoy_afex_ai/feature/zen/presentation/zen_mode_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  List<BottomNavigationBarItem> _bottomNavBarItems = [];

  @override
  void didChangeDependencies() {
    _bottomNavBarItems = [
      BottomNavigationBarItem(
        icon: ImageAssetIcon(
          asset: ImagesConstants.zendModeIconPng,
          color: context.themeColors.onPrimary,
          iconSize: 24,
        ),
        activeIcon: ImageAssetIcon(
          asset: ImagesConstants.zendModeIconPng,
          color: context.themeColors.onPrimary,
        ),
        tooltip: 'Zen mode',
        label: 'Zen mode',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined, color: context.themeColors.onPrimary),
        activeIcon: Icon(Icons.home_rounded, color: context.themeColors.onPrimary),
        tooltip: 'Home',
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined, color: context.themeColors.onPrimary),
        activeIcon: Icon(Icons.settings_rounded, color: context.themeColors.onPrimary),
        tooltip: 'Settings',
        label: 'Settings',
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Card(
        shape: RoundedRectangleBorder(borderRadius: getBorderAll16),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: context.themeColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
            ),
            child: BottomNavigationBar(
              selectedIconTheme: const IconThemeData(size: 32),
              currentIndex: widget.navigationShell.currentIndex,
              items: _bottomNavBarItems,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: context.themeColors.onPrimary,
              onTap: _onTap,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(int index) {
    if (index == 0) {
      ZenModeScreen.open(context);
    } else {
      widget.navigationShell
          .goBranch(index, initialLocation: index == widget.navigationShell.currentIndex);
    }
  }
}
