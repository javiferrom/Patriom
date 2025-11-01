import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patriom/core/patriom_const.dart';
import 'package:patriom/l10n/generated/l10n.dart';

class PatriomBottomNavigationBar extends StatefulWidget {
  const PatriomBottomNavigationBar({
    required this.stateLocation,
    required this.child,
    super.key,
  });

  final String stateLocation;
  final Widget child;

  @override
  State<PatriomBottomNavigationBar> createState() => _PatriomBottomNavigationBarState();
}

class _PatriomBottomNavigationBarState extends State<PatriomBottomNavigationBar> {
  int _indexFromLocation(String location, List<_TabInfo> tabs) {
    final idx = tabs.indexWhere(
          (t) => location == t.location || location.startsWith('${t.location}/'),
    );
    return idx == -1 ? 0 : idx;
  }

  List<_TabInfo> _buildTabs(BuildContext context) => [
    _TabInfo(
      location: PatriomConst.home,
      label: SharedStrings.of(context).navHome,
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    _TabInfo(
      location: PatriomConst.stats,
      label: SharedStrings.of(context).navStats,
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart,
    ),
    _TabInfo(
      location: PatriomConst.settings,
      label: SharedStrings.of(context).navSettings,
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tabs = _buildTabs(context);
    final currentIndex = _indexFromLocation(widget.stateLocation, tabs);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (newIndex) {
          final newLocation = tabs[newIndex].location;
          if (newLocation != widget.stateLocation) {
            context.go(newLocation);
          }
        },
        destinations: tabs.map((t) => NavigationDestination(
            icon: Icon(t.icon),
            selectedIcon: Icon(t.activeIcon),
            label: t.label,
          ),
        ).toList(),
      ),
    );
  }
}

class _TabInfo {
  const _TabInfo({
    required this.location,
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String location;
  final String label;
  final IconData icon;
  final IconData activeIcon;
}
