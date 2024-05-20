import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../themes/color_palette.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const SafeArea(
        child: Center(
          child: Text('Soy el home'),
        ),
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: colorPrimario,
        domeCircleColor: colorPrimario,
        selectedIndex: _selectedIndex,
        onTabChange: (int clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: <MoltenTab>[
          MoltenTab(
            icon: const Icon(Icons.home),
            selectedColor: colorOro,
            title: Text(
              'Home',
              style: TextStyle(
                  color: _selectedIndex == 0 ? colorOro : Colors.white),
            ),
            unselectedColor: Colors.white,
          ),
          MoltenTab(
            icon: const Icon(Icons.credit_card),
            selectedColor: colorOro,
          ),
          MoltenTab(
            icon: const Icon(Icons.attach_money_outlined),
            selectedColor: colorOro,
          ),
          MoltenTab(
            icon: const Icon(Icons.settings),
            selectedColor: colorOro,
          ),
        ],
      ),
    );
  }
}
