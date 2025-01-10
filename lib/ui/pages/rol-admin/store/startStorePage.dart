import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/store/store_model.dart';
import 'package:huoon/domain/blocs/store_bloc/store_service.dart';
import 'package:huoon/domain/blocs/store_bloc/store_signal.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:huoon/ui/Components/state_widget.dart';
import 'package:huoon/ui/pages/rol-admin/Task/selectDays/utils.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:signals/signals_flutter.dart';

class StartStorePage extends StatefulWidget {
  final PageController pageController;

  const StartStorePage({super.key, required this.pageController});

  @override
  _StartStorePageState createState() => _StartStorePageState();
}

class _StartStorePageState extends State<StartStorePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  final TextEditingController priceController = TextEditingController();
  final int initialQuantity = 1;
  String tittle = 'Nuevo Almacén';
  @override
  Widget build(BuildContext context) {
    if (isUpdateST.value == true) {
      tittle = 'Modificar Almacén';
      if (currentStoreElementST.value != null) {
        _titleController.text = currentStoreElementST.value!.title!;
        _descriptionController.text = currentStoreElementST.value!.description!;
        _placeController.text = currentStoreElementST.value!.location ?? '';
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
      body:
          // Text('estaba el codigo de abajo'),

          Builder(
        builder: (
          context,
        ) {
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
                            labelText: TranslationManager.translate('tittleLabel'),
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
                          validator: (value) => (value == null || value.isEmpty)
                              ? TranslationManager.translate('requiredTittleLabel')
                              : null,
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
                            labelText: TranslationManager.translate('descriptionLabel'),
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
                        TextFormField(
                          controller: _placeController,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.send,
                          onFieldSubmitted: (_) {
                            _onSubmit();
                          },
                          decoration: InputDecoration(
                            labelText: TranslationManager.translate('placeLabel'),
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
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        _buildStatusSection(),
                        SizedBox(height: 100),
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
                            //GoRouter.of(context).pop();
                          },
                          child: Text(TranslationManager.translate('goBackButton')),
                        ),
                        ElevatedButton(
                          onPressed: _onSubmit,
                          child: isUpdateST.value == true
                              ? //SI ES TRUE ES PARA MODIFICAR
                              Text(TranslationManager.translate('updateTask'))
                              : Text(TranslationManager.translate('createTask')), //SINO ES PARA CREAR
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

      print('object-test-_titleController.text:${_titleController.text}');
      print(
          'object-test-_descriptionController.text:${emptyTextField(_descriptionController.text) ? 'No hay comentario' : _descriptionController.text}');
      
      //mandar a insertar almacen
      if (isUpdateST.value == true) {
        
        //ES QUE ES PARA MODIFICAR
        final storeElement = StoreElement(
            warehouse_id: currentStoreElementST.value!.warehouse_id,
            id: currentStoreElementST.value!.id,            
            status: selectedStatus,
            title: _titleController.text, //si emptyTextField = true es que esta vacio
            description:
                emptyTextField(_descriptionController.text) ? 'No hay comentario' : _descriptionController.text,
            location: _placeController.text.isEmpty ? 'No hay localización' : _placeController.text
            // image: 'products/1.jpg',
            );
       updateStoreData(storeElement); 
        updateStore(storeElement, 1);
      } 


      // Navegar a la siguiente página
      // Navegar a la siguiente página
      Future.delayed(const Duration(seconds: 2), () {
        GoRouter.of(context).go(
          '/HomePrincipal'
        );
      });
    }
    if (emptyTextField(_titleController.text)) {
      _titleController.text = '';
    }
  }

  int selectedStatus = 0;
  Widget _buildStatusSection() {
    return Builder(
      builder: (context) {
        if (statusStoreCSP.value != null) {
          bool selectMultiple = false;
          int permisSelect = 0;
          if (isUpdateST.value == true) //SI ES TRUE ES PARA MODIFICAR
          {
            permisSelect = currentStoreElementST.value!.status!;
          } else {
            permisSelect = statusStoreCSP.value!.first.id;
          }

          return StatusWidget(
            status: statusStoreCSP.value!,
            fitTextContainer: false,
            eventDetails: true,
            titleWidget: 'Permisos ',
            selectMultiple: selectMultiple, // Permite seleccionar solo un estado
            selectedStatusId: permisSelect, // Estado preseleccionado
            onSelectionChanged: (List<Status> selectedStatuses) {
              FocusScope.of(context).unfocus();
              // Aquí manejas los estados seleccionados
              print('Estados del almacen seleccionados-1: ${selectedStatuses.map((e) => e.id).join(', ')}');
              selectedStatus = selectedStatuses.isNotEmpty ? selectedStatuses.first.id : 0;
              print('Estados del almacen seleccionados-2: $selectedStatus');

              //seleccionando el estado
              // onTaskStateSelected(selectedStatus);
            },
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }
}
