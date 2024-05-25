import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../themes/color_palette.dart';
import '../utils/loader.dart';
import '../widgets/global/global_button.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  Future<void> _mostrarLoader() async {
    Loader.mostrar();
    await Future<void>.delayed(const Duration(seconds: 2));
    Get.back();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlobalButton(
                  texto: 'Mostrar loader',
                  onPressed: _mostrarLoader,
                ),
              ]),
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
