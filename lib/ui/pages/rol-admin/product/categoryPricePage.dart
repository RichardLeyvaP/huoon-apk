import 'package:flutter/material.dart';
import 'package:huoon/data/models/products/product_model.dart';
import 'package:huoon/domain/blocs/product_cat_state/bloc/product_cat_state_service.dart';
import 'package:huoon/domain/blocs/product_cat_state/bloc/product_cat_state_signal.dart';
import 'package:huoon/domain/blocs/products_bloc/products_service.dart';
import 'package:huoon/domain/blocs/products_bloc/products_signal.dart';
import 'package:huoon/domain/blocs/store_bloc/store_signal.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:huoon/ui/Components/category_widget.dart';
import 'package:huoon/ui/pages/rol-admin/Task/selectDays/utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoryPricePage extends StatefulWidget {
  @override
  _CategoryPricePageState createState() => _CategoryPricePageState();
  final PageController pageController;

  CategoryPricePage({required this.pageController});
}

class _CategoryPricePageState extends State<CategoryPricePage> {
  int selectedLevel = 0; // Para seleccionar el nivel
  Color colorBotoom = const Color.fromARGB(255, 61, 189, 93);
  Color colorBotoomSel = const Color.fromARGB(255, 199, 64, 59);

  @override
  void initState() {
    super.initState();
    if(categoriesSignalPCS.value.isEmpty || statusSignalPCS.value == null )
{
  loadInit();

}
else
{
  arrayCategory = [categoriesSignalPCS.value.first.id];
 categoriesProductSelec = categoriesSignalPCS.value.first.id;

}
    
  }
loadInit()
async {
   await loadCategories();
arrayCategory = [categoriesSignalPCS.value.first.id];
 categoriesProductSelec = categoriesSignalPCS.value.first.id;
}
 
  List<int> arrayCategory = []; // Inicializamos la cantidad seleccionada

  final TextEditingController _priceController = TextEditingController();
  final int initialQuantity = 1;
  final TextEditingController _marcaController = TextEditingController();

  String tittle = 'Nuevo Producto';
  int categoriesProductSelec = 0;

  @override
  Widget build(BuildContext context) {
     if (isUpdateProductSignal.value == true) {
      tittle = 'Modificar Producto';
      print('aui imprimiendo seleccategory1-${productElementSignal.value}');
      if (productElementSignal.value != null) {
        print('aui imprimiendo seleccategory-${productElementSignal.value}');
        _marcaController.text = productElementSignal.value!.brand!;
        _priceController.text = productElementSignal.value!.unitPrice!;
        updateQuantity(productElementSignal.value!.quantity!);

selectCategory(productElementSignal.value!.categoryId!); 
            categoriesProductSelec = productElementSignal.value!.categoryId!;
            arrayCategory = [productElementSignal.value!.categoryId!];
        
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(tittle),
      ),
      floatingActionButton: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60.0), // Ajusta el valor a tu necesidad
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(MdiIcons.lightbulbQuestionOutline), // Aquí defines el ícono
          ),
        ),
      ),
      body: // Segunda Página
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(
          builder: (context) {
            
            return Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _marcaController,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Marca',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Borde redondeado
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300, // Borde gris claro cuando no tiene foco
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0), // Borde redondeado
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue, // Borde azul cuando toma foco
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0), // Borde redondeado
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El título es requerido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CategoryWidget(
                  categories: categoriesSignalPCS.value,
                  titleWidget: 'Categorías',
                  selectedCategoryId: selectedCategoryIdSignalPCS.value,
                  selectMultiple: false,
                  onSelectionChanged: (selectedCategories) {
                    // setState(() {
                      arrayCategory = selectedCategories
                          .asMap()
                          .entries
                          .map((entry) => selectedCategories[entry.key].id) // Mapea los IDs de las categorías
                          .toList();
                    // });
                    selectCategory(arrayCategory[0]);
                     final productElement = ProductElement(
      categoryId: arrayCategory[0],
    );
                    updateProductData(productElement);
                  },
                ),

                // Estado por defecto

                SizedBox(height: 20),
                Row(
                  children: [
                    // Usamos Expanded para que el TextField tome el espacio disponible
                    Expanded(
                      child: TextFormField(
                        controller: _priceController,
                        onChanged: (value) {
                          //print('value a pecio:${_priceController.text}');
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Precio',
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Espacio entre los dos widgets
                    QuantitySelector(
                      initialQuantity: quantitySignal.value,
                      onQuantityChanged: (newQuantity) {                        

                        updateQuantity(newQuantity);
                         final productElement = ProductElement(
                          quantity: newQuantity,
    );
                    updateProductData(productElement);
                        // context.read<CategoriesPrioritiesBloc>().add(QuantityProductEvent(newQuantity));
                      },
                    )
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text("Regresar"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _onSubmit();
                      },
                      child: Text("Siguiente"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onSubmit() {
    // Cierra el teclado si está abierto
    FocusScope.of(context).unfocus();
    // Enviar el evento al BLoC
    // print(
    //     'object-test-_marcaController.text:${emptyTextField(_marcaController.text) ? 'No hay Marca' : _marcaController.text}');
    // print('object-test-arrayCategory:${arrayCategory[0]}');
    // print('object-test-arrayCategory2:${arrayCategory.first}');
    // print('object-test-_priceController.text:${emptyTextField(_priceController.text) ? '0' : _priceController.text}');
    // print('object-test-selectedQuantity:${quantitySignal.value}');

    //todo ahora esta fijo
    final productElement = ProductElement(
      brand: emptyTextField(_marcaController.text) ? 'No hay Marca' : _marcaController.text,
      categoryId: selectedCategoryIdSignalPCS.value,
      unitPrice: emptyTextField(_priceController.text) ? '0' : _priceController.text,
      quantity: quantitySignal.value,
      image: 'products/1.jpg',
    );
    updateProductData(productElement);
// Dispara el evento para insertar el producto

    // Navegar a la siguiente página
    widget.pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
