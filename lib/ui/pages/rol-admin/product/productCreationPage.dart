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
        children:  [
        const  TaskChatPage(conversationSteps: [
    
  {'key': 'title_product', 'message': 'Empecemos, ¿me puedes dar el título del Producto? ', 'hint': 'Título del Producto'},
  {'key': 'description_product', 'message': 'Perfecto. Ahora, ¿puedes darme una breve descripción? ', 'hint': 'Descripción del Producto'},
  {'key': 'location_product', 'message': 'Direccion', 'hint': 'Lugar de compra'},
  {'key': 'status_product', 'message': '¿Que estado le darias al producto?', 'hint': ''},
  
  // {'key': 'image_product', 'message': 'Direccion', 'hint': ''},

  {'key': 'brand_product', 'message': 'Ahora... Me puedes decir la Marca', 'hint': ''},
  {'key': 'category_product', 'message': '¿De que categoria seria este producto?', 'hint': ''},
  {'key': 'price_product', 'message': '¿Qué precio tiene?', 'hint': ''},
  {'key': 'quantity_product', 'message': '¿Me puedes decir la cantidad?', 'hint': ''},


  {'key': 'date_product', 'message': 'Esoja la fecha por favor...', 'hint': ''},


  
  

  

    

    {'key': 'done', 'message': '¡Genial! He registrado todos los datos. ¿Quieres guardar el nuevo Producto?', 'hint': 'Confirmar Producto'}
    //ENVIANDO A INSERTAR
        // await storeTask();
  ],title: 'Crear Producto',module: 'storeProduct',),
        
        ],
      ),
    );
  }
}
