import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../controllers/tarjeta_controller.dart';
import '../routes/routes_names.dart';
import '../themes/color_palette.dart';
import 'tabs/tab_cards.dart';
import 'tabs/tab_compras.dart';
import 'tabs/tab_home.dart';
import 'tabs/tab_settings.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  IconData? _iconoTab;

  Widget _setTab() {
    switch (_selectedIndex) {
      case 1:
        _iconoTab = Icons.add_card_rounded;
        return const TabCards();
      case 2:
        _iconoTab = Icons.post_add_rounded;
        return const TabCompras();
      case 3:
        return const TabSettings();
      default:
    }
    return const TabHome();
  }

  Future<void> _irNuevaPantalla() async {
    switch (_selectedIndex) {
      case 1:
        final TarjetaController tarjetaController = Get.find<TarjetaController>();
        await tarjetaController.limpiarTarjetaActual();
        Get.toNamed(nameNuevaTarjetaScreen);
        break;
      case 2:
        Get.toNamed(nameNuevaCompraScreen);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: SingleChildScrollView(
                child: _setTab(),
              ),
            ),
            Visibility(
              visible: _selectedIndex == 1 || _selectedIndex == 2,
              child: Positioned(
                bottom: 10,
                right: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorPrimario,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(
                      _iconoTab,
                      color: colorOro,
                    ),
                    onPressed: () => _irNuevaPantalla(),
                  ),
                ),
              ),
            ),
          ],
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
