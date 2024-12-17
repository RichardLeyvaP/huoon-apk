import 'package:flutter/material.dart';
import 'package:huoon/ui/pages/rol-admin/Task/bootStoreTask.dart';
import 'package:huoon/ui/pages/rol-admin/product/categoryPricePage.dart';
import 'package:huoon/ui/pages/rol-admin/product/dateTimePage.dart';
import 'package:huoon/ui/pages/rol-admin/product/startProductPage.dart';

class ProductCreation extends StatefulWidget {
  @override
  _ProductCreationState createState() => _ProductCreationState();
}

class _ProductCreationState extends State<ProductCreation> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: const [
          TaskChatPage(conversationSteps: [
    
  {'key': 'title_product', 'message': 'Empecemos, ¿me puedes dar el título del Producto? ', 'hint': 'Título del Producto'},
  {'key': 'description_product', 'message': 'Perfecto. Ahora, ¿puedes darme una breve descripción? ', 'hint': 'Descripción del Producto'},
  {'key': 'price_product', 'message': '¿Qué precio tiene?', 'hint': ''},
  {'key': 'status_product', 'message': '¿Que seccion le darias?', 'hint': ''},
  {'key': 'location_product', 'message': 'Direccion', 'hint': ''},

  {'key': 'quantity_product', 'message': '¿Me puedes decir la cantidad?', 'hint': ''},

    

    {'key': 'done', 'message': '¡Genial! He registrado todos los datos. ¿Quieres guardar el nuevo Producto?', 'hint': 'Confirmar Producto'}
    //ENVIANDO A INSERTAR
        // await storeTask();
  ],title: 'Crear Producto',module: 'storeProduct',),
          //1 Página
          // StartProductPage(pageController: _pageController),
          // //2 Página
          // CategoryPricePage(pageController: _pageController),
          // //4 Página
          // // StatusPage(pageController: _pageController),
          // //7 Página
          // //AdditionalDataPage(pageController: _pageController),
          // //7 Página
          // DateTimePage(pageController: _pageController),
        ],
      ),
    );
  }
}
