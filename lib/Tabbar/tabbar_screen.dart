import 'package:flutter/material.dart';
import 'package:gratefull_panda/Affirmation/affirmation_screen.dart';
import 'package:gratefull_panda/Gratitude/gratitude_screen.dart';
import 'package:gratefull_panda/Home/home_screen.dart';
import 'package:gratefull_panda/Vision/vision_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const GratitudeScreen(),
    const AffirmationScreen(),
    const VisionScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final tabBarHeight = screenHeight * 0.1;
    final iconSize = screenHeight * 0.035;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _screens[_selectedIndex],

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: tabBarHeight,
              decoration: BoxDecoration(color: const Color(0xFFB09679)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTabItem(
                    index: 0,
                    iconPath: 'assets/home.png',
                    label: 'Home',
                    iconSize: iconSize,
                    tabBarHeight: tabBarHeight,
                  ),

                  _buildTabItem(
                    index: 1,
                    iconPath: 'assets/gratitude.png',
                    label: 'Gratitude',
                    iconSize: iconSize,
                    tabBarHeight: tabBarHeight,
                  ),

                  _buildTabItem(
                    index: 2,
                    iconPath: 'assets/Affirmation.png',
                    label: 'Affirmation',
                    iconSize: iconSize,
                    tabBarHeight: tabBarHeight,
                  ),

                  _buildTabItem(
                    index: 3,
                    iconPath: 'assets/vision.png',
                    label: 'Vision',
                    iconSize: iconSize,
                    tabBarHeight: tabBarHeight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required int index,
    required String iconPath,
    required String label,
    required double iconSize,
    required double tabBarHeight,
  }) {
    bool isSelected = _selectedIndex == index;
    final containerHeight = tabBarHeight * 0.85;
    final selectedContainerHeight = containerHeight * 0.85;
    final unselectedContainerHeight = containerHeight * 0.85;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isSelected ? containerHeight * 1.1 : containerHeight * 1.1,
        height: isSelected
            ? selectedContainerHeight
            : unselectedContainerHeight,
        margin: EdgeInsets.symmetric(
          vertical: (tabBarHeight - containerHeight) / 2,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.50)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(containerHeight * 0.2),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 0,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: iconSize, height: iconSize),
            SizedBox(height: containerHeight * 0.04),
            Text(
              label,
              style: TextStyle(
                fontSize: tabBarHeight * 0.14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? const Color(0xFFBE752B) : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
