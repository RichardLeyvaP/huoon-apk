import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/usserPage/Task/bootStoreTask.dart';
import 'package:huoon/ui/pages/usserPage/product/categoryPricePage.dart';
import 'package:huoon/ui/pages/usserPage/product/dateTimePage.dart';
import 'package:huoon/ui/pages/usserPage/product/startProductPage.dart';

class ProductUpdatePage extends StatefulWidget {
  @override
  _ProductUpdatePageState createState() => _ProductUpdatePageState();
}

class _ProductUpdatePageState extends State<ProductUpdatePage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children:  [
          //1 Página
          StartProductPage(pageController: _pageController),
          //2 Página
          CategoryPricePage(pageController: _pageController),
          //4 Página
          // StatusPage(pageController: _pageController),
          //7 Página
          //AdditionalDataPage(pageController: _pageController),
          //7 Página
          DateTimePage(pageController: _pageController),
        ],
      ),
    );
  }
}
