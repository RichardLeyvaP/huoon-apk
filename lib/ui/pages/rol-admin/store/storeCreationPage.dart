import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol-admin/store/startStorePage.dart';

class StoreCreation extends StatefulWidget {
  const StoreCreation({super.key});

  @override
  _StoreCreationState createState() => _StoreCreationState();
}

class _StoreCreationState extends State<StoreCreation> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: [
          //1 Página
          StartStorePage(pageController: _pageController),
        ],
      ),
    );
  }
}
