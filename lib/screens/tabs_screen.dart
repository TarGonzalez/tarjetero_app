import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../controllers/tarjeta_controller.dart';
import '../routes/routes_names.dart';
import '../themes/color_palette.dart';
import '../widgets/global/global_icon_button.dart';
import '../widgets/global/gradient_app_bar.dart';
import 'tabs/tab_cards.dart';
import 'tabs/tab_gastos.dart';
import 'tabs/tab_home.dart';
import 'tabs/tab_proyeccion.dart';
import 'tabs/tab_settings.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  IconData? _iconoTab;
  String titulo = 'Home';

  void _setTab(int index) {
    switch (index) {
      case 0:
        _iconoTab = Icons.home;
        titulo = 'Home';
        break;
      case 1:
        _iconoTab = Icons.add_card_rounded;
        titulo = 'Tarjetas';
        break;
      case 2:
        _iconoTab = Icons.post_add_rounded;
        titulo = 'Gastos';
        break;
      case 3:
        titulo = 'Proyección';
        break;
      case 4:
        titulo = 'Configuraciones';
        break;
      default:
    }
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Future<void> _irNuevaPantalla() async {
    switch (_selectedIndex) {
      case 1:
        final TarjetaController tarjetaController =
            Get.find<TarjetaController>();
        await tarjetaController.limpiarTarjetaActual();
        Get.toNamed(nameNuevaTarjetaScreen);
        break;
      case 2:
        Get.toNamed(nameNuevoGastoScreen);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: titulo,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                _setTab(index);
              },
              children: const <Widget>[
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  child: TabHome(),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  child: TabCards(),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  child: TabGastos(),
                ),
                SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: TabProyeccion()),
                SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    child: TabSettings()),
              ],
            ),
            Visibility(
              visible: _selectedIndex == 1 || _selectedIndex == 2,
              child: Positioned(
                bottom: 10,
                right: 30,
                child: GlobalIconButton(
                  icono: _iconoTab,
                  onPressed: () => _irNuevaPantalla(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: Theme.of(context).primaryColor,
        domeCircleColor: Theme.of(context).primaryColor,
        selectedIndex: _selectedIndex,
        onTabChange: (int clickedIndex) {
          _setTab(clickedIndex);
        },
        tabs: <MoltenTab>[
          MoltenTab(
            icon: const Icon(Icons.home),
            selectedColor: colorOro,
            // title: Text(
            //   'Home',
            //   style: TextStyle(
            //       color: _selectedIndex == 0 ? colorOro : Colors.white),
            // ),
            // unselectedColor: Colors.white,
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
            icon: const Icon(Icons.access_time_filled_rounded),
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
