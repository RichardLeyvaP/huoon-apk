import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/products/product_model.dart';
import 'package:huoon/domain/blocs/product_cat_state/bloc/product_cat_state_service.dart';
import 'package:huoon/domain/blocs/product_cat_state/bloc/product_cat_state_signal.dart';
import 'package:huoon/domain/blocs/products_bloc/products_service.dart';
import 'package:huoon/domain/blocs/products_bloc/products_signal.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:huoon/ui/Components/state_widget.dart';
import 'package:huoon/ui/pages/rol-admin/Task/selectDays/utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:signals/signals_flutter.dart';

class StartProductPage extends StatefulWidget {
  final PageController pageController;

  const StartProductPage({super.key, required this.pageController});

  @override
  _StartProductPageState createState() => _StartProductPageState();
}

int selectedStatus = 0;
final TextEditingController _directionController = TextEditingController();

class _StartProductPageState extends State<StartProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController priceController = TextEditingController();
  final int initialQuantity = 1;
   String tittle = 'Nuevo Producto';

  @override
  Widget build(BuildContext context) {
     if (isUpdateProductSignal.value == true) {
      tittle = 'Modificar Producto';
      if (productElementSignal.value != null) {
        _titleController.text = productElementSignal.value!.productName!;
        _descriptionController.text = productElementSignal.value!.additionalNotes!;
         _directionController.text = productElementSignal.value!.purchasePlace!;
      }
    }
    
    return Scaffold(
      resizeToAvoidBottomInset: true, // Esto permite que el teclado empuje el contenido
      appBar: AppBar(
        toolbarHeight: 70,
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
      body: Builder(
        builder: (context) {
          String titleState = '';

          return SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _titleController,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Título',
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
                        TextFormField(
                          controller: _descriptionController,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.send,
                          onFieldSubmitted: (_) {
                            _onSubmit();
                          },
                          decoration: InputDecoration(
                            labelText: 'Descripción',
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
                              borderSide: BorderSide(
                                color: Colors.blue, // Borde azul cuando toma foco
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0), // Borde redondeado
                            ),
                          ),
                          maxLines: 5,
                        ),
                        SizedBox(height: 20),
                        _buildStatusSection(),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _directionController,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.send,
                          onFieldSubmitted: (_) {
                            _onSubmit();
                          },
                          decoration: InputDecoration(
                            labelText: 'Dirección',
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
                              borderSide: BorderSide(
                                color: Colors.blue, // Borde azul cuando toma foco
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0), // Borde redondeado
                            ),
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(height: 20),
                        FilePickerButton(),
                        SizedBox(height: 80),
                        Container()
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            GoRouter.of(context).go('/HomePrincipal');
                          },
                          child: Text("Regresar"),
                        ),
                        ElevatedButton(
                          onPressed: _onSubmit,
                          child: Text("Siguiente"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() == true && !emptyTextField(_titleController.text)) {
      // Cierra el teclado si está abierto
      FocusScope.of(context).unfocus();
      // Enviar el evento al BLoC 
      int? idProd;
      int? elementId;
      if(isUpdateProductSignal.value == true){
idProd = productElementSignal.value!.productId!;
elementId = productElementSignal.value!.id!;
      }

      final productElement = ProductElement(        
        productId: idProd,
        id: elementId,

          productName: _titleController.text, //si emptyTextField = true es que esta vacio
          additionalNotes:
              emptyTextField(_descriptionController.text) ? 'No hay comentario' : _descriptionController.text,
          statusId: selectedStatusIdSignalPCS.value,
          purchasePlace: _directionController.text,
          image: 'image/default.jpg'
          // image: 'products/1.jpg',
          );
      updateProductData(productElement);

// Dispara el evento para insertar el producto

      // Navegar a la siguiente página
      widget.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    if (emptyTextField(_titleController.text)) {
      _titleController.text = '';
    }
  }

  Widget _buildStatusSection() {
    return Builder(
      builder: (context) {
        if (statusSignalPCS.watch(context) != null) {
          bool selectMultiple = false;
              if (isUpdateProductSignal.value == true) { //es modificar           
            selectStatus(productElementSignal.value!.statusId!);
          } 
          return StatusWidget(
            status: statusSignalPCS.value!,
            fitTextContainer: false,
            eventDetails: true,
            titleWidget: 'Estado',
            selectMultiple: selectMultiple, // Permite seleccionar solo un estado
            selectedStatusId: selectedStatusIdSignalPCS.value, // Estado preseleccionado
            onSelectionChanged: (List<Status> selectedStatuses) {
              FocusScope.of(context).unfocus();
              // Aquí manejas los estados seleccionados
           //   print('Estados seleccionados: ${selectedStatuses.map((e) => e.id).join(', ')}');
              selectedStatus = selectedStatuses.isNotEmpty ? selectedStatuses.first.id : 0;
              print('Estados seleccionados: $selectedStatus');

              //seleccionando el estado
              selectStatus(selectedStatus);
            },
          );
        }
        return Container();
      },
    );
  }
}
