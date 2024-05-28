import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/routes/routes_names.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  PageController _pageViewController = PageController();
  int _index = 0;
  final List<Widget> _pages = const <Widget>[
    Center(
      child: Text('Página 1'),
    ),
    Center(
      child: Text('Página 2'),
    ),
    Center(
      child: Text('Página 3'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  void _changeIndex(int val) {
    setState(() {
      _index = val;
    });
  }

  void _irLogin() {
    Get.offNamed(nameLoginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Stack(
              children: <Widget> [
                PageView.builder(
                  controller: _pageViewController,
                  onPageChanged: _changeIndex,
                  itemCount: _pages.length,
                  itemBuilder: (BuildContext context, int index) => _pages[_index],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedSmoothIndicator(
                    activeIndex: _index,
                    count: _pages.length,
                    onDotClicked: _changeIndex,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
                    onPressed: _irLogin,
                    child: const Text('SALTAR'),
                  ),
                ),
                Visibility(
                  visible: _index == 2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 36.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: OutlinedButton(
                        onPressed: _irLogin,
                        child: const Text('SIGUIENTE'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
