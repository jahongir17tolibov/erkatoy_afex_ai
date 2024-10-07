import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/app_constants.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/blur_outer_container.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/chat_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/cry_record/cry_record_screen.dart';
import 'package:erkatoy_afex_ai/feature/zen/zen_mode_screen.dart';
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
      _getBottomNavBarItem(name: 'Asosiy', svgAsset: ImagesConstants.homeIcon),
      _getBottomNavBarItem(name: 'Uyqu rejimi', svgAsset: ImagesConstants.zenModeIcon),
      const BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
      _getBottomNavBarItem(name: 'Chat bot', svgAsset: ImagesConstants.chatIcon),
      _getBottomNavBarItem(name: 'Sozlamalar', svgAsset: ImagesConstants.settingsIcon),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: IconButton(
        onPressed: () {
          CryRecordScreen.open(context);
        },
        icon: const SvgImageView(ImagesConstants.cryRecordIcon, width: 75, height: 75),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: BlurOuterContainer(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              splashFactory: InkSparkle.splashFactory,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: widget.navigationShell.currentIndex,
              items: _bottomNavBarItems,
              showSelectedLabels: true,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: context.themeColors.primary,
              unselectedLabelStyle: _getLabelTextStyle(),
              selectedLabelStyle: _getLabelTextStyle(selected: true),
              enableFeedback: false,
              onTap: _onTap,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(int index) {
    if (index == 1) {
      ZenModeScreen.open(context);
    } else if (index == 3) {
      ChatScreen.open(context);
    } else if (index != 2) {
      widget.navigationShell
          .goBranch(index, initialLocation: index == widget.navigationShell.currentIndex);
    }
  }

  BottomNavigationBarItem _getBottomNavBarItem({required String name, required String svgAsset}) =>
      BottomNavigationBarItem(
        icon: SvgImageView(
          svgAsset,
          color: context.themeColors.onSurface.withOpacity(0.2),
        ),
        activeIcon: SvgImageView(
          svgAsset,
          color: context.themeColors.primary,
        ),
        tooltip: name,
        label: name,
      );

  TextStyle _getLabelTextStyle({bool selected = false}) => TextStyle(
        fontFamily: AppConstants.appFontStyle,
        fontSize: 12,
        color:
            selected ? context.themeColors.primary : context.themeColors.onSurface.withOpacity(0.2),
      );
}
