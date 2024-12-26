import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol-admin/Task/bootStoreTask.dart';
import 'package:huoon/ui/pages/rol-admin/store/startStorePage.dart';

class StoreUpdatePage extends StatefulWidget {
  const StoreUpdatePage({super.key});

  @override
  _StoreUpdatePageState createState() => _StoreUpdatePageState();
}

class _StoreUpdatePageState extends State<StoreUpdatePage> {
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
