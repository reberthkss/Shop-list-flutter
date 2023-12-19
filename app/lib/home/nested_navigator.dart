import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedNavigation extends StatelessWidget {
  const NestedNavigation({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Inicio"),
          NavigationDestination(icon: Icon(Icons.sell), label: "Produtos"),
          NavigationDestination(icon: Icon(Icons.view_list), label: "Listas"),
          NavigationDestination(icon: Icon(Icons.menu), label: "Mais"),
        ],
        onDestinationSelected: _onTap,
      ),
    );
  }
}
