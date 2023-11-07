import 'package:connect_ummah/presentation/screens/views/homeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/constants/assets.dart';
import '../../providers/bottom_navigation_bar_provider.dart';
import 'moreView.dart';

class BottomNavigationBarView extends StatelessWidget {
  BottomNavigationBarView({super.key});

  final List<Widget> _screens = [
    HomeView(),
    MoreView(),

  ];

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = context.watch<BottomNavigationBarProvider>();
    return Scaffold(
          body: _screens.elementAt(bottomBarProvider.selectedIndex),
          bottomNavigationBar: NavigationBar(
              selectedIndex: bottomBarProvider.selectedIndex,
              onDestinationSelected: bottomBarProvider.setSelectedIndex,
              destinations: const [
                NavigationDestination(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesHome),
                  ),
                  selectedIcon: ImageIcon(
                    AssetImage(Assets.imagesHome),
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesMenu),
                  ),
                  selectedIcon: ImageIcon(
                    AssetImage(Assets.imagesMenu),
                  ),
                  label: 'More',
                ),
              ]),
        );
  }
}

