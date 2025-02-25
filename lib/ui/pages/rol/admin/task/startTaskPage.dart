import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/domain/signals/task_cat_state_prior_signals/task_cat_state_prior_service.dart';
import 'package:huoon/domain/signals/task_cat_state_prior_signals/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/signals/tasks_signals/tasks_service.dart';
import 'package:huoon/domain/modelos/projectModels.dart';
import 'package:huoon/ui/components/noEditTextFormFieldWidget.dart';
import 'package:huoon/ui/components/timePickerModalWidget.dart';
import 'package:huoon/ui/components/categoryWidget.dart';
import 'package:huoon/ui/components/priorityWidget.dart';
import 'package:huoon/ui/components/stateWidget.dart';
import 'package:huoon/ui/components/typeFrequencyWidget.dart';
import 'package:huoon/ui/util/utilClass.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:signals/signals_flutter.dart';

class StartTaskPage extends StatefulWidget {
  final PageController pageController;
  final int? id; // ID opcional

  StartTaskPage({required this.pageController, this.id});

  @override
  _StartTaskPageState createState() => _StartTaskPageState();
}

class _StartTaskPageState extends State<StartTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<int> arrayCategory = [1];

  int selectedPriority = 0;
  int selectedStatus = 0;
  final Color colorBotoom = const Color.fromARGB(255, 61, 189, 93);
  final Color colorBotoomSel = const Color.fromARGB(255, 199, 64, 59);

  // Variable para manejar las prioridades seleccionadas
  List<Priority> selectedPriorities = [];
  String tittle = TranslationManager.translate('createTask');

  @override
  Widget build(BuildContext context) {
    if (widget.id != 0) {
      tittle = TranslationManager.translate('updateTask');
      updateTaskid(widget.id!);
      print('mostrar el id:${widget.id}');
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Column(
              children: [
                Text(tittle, style: TextStyle(fontSize: 18, color: Colors.black)),
                Text(TranslationManager.translate('createTaskStep1'),
                    style: TextStyle(fontSize: 10, color: Color.fromARGB(150, 0, 0, 0))),
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.close, color: Colors.black),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(50, 158, 158, 158)),
          ),
        ),
        floatingActionButton: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(MdiIcons.lightbulbQuestionOutline),
            ),
          ),
        ),
        body: isLoadingCSP.watch(context) == true
            ?
            //cargando
            const Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Cargando datos...')
                ],
              ))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Builder(
                            builder: (context) {
                              // Ejecuta la acción después de construir el widget
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                // Acción que quieres ejecutar
                                // Guardando el estado del titulo y la descripcion
                                if (tittleTaskCSP.watch(context) != null) {
                                  _titleController.text = tittleTaskCSP.value ?? '';
                                }
                                if (descriptionTaskCSP.watch(context) != null) {
                                  _descriptionController.text = descriptionTaskCSP.value ?? '';
                                }
                                 if (descriptionTaskCSP.watch(context) != null) {
                                  _descriptionController.text = descriptionTaskCSP.value ?? '';
                                }

                                // Puedes realizar otras acciones como llamadas a APIs, actualizaciones de estado, etc.
                              });
                              // Observa las señales
    final hourIni = hourIniSelectCSP.watch(context);
    final hourEnd = hourEndSelectCSP.watch(context);

    // Crea y actualiza el controlador dinámicamente
    final TextEditingController _hourController = TextEditingController();
    if(taskTypeSelectCSP.watch(context) == 'Evento')
    {
      _hourController.text = '$hourIni - $hourEnd';
    }
    else
    {
      _hourController.text = '$hourIni';
    }
    
    
                             

                              return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10),
        _buildTaskTypeSection(),
        SizedBox(height: 10),
        NonEditableTextField(
  controller: _hourController,
  labelText: 'Hora',
  onTap: () {
     showModalBottomSheet(
  context: context,
  isDismissible: false, // No permite cerrar tocando fuera
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  builder: (context) => TimePickerModal(
    onSelect: (startTime, endTime) {
      //verificar si va 1 hora o van las 2 dependiendo si es evento o tarea

      print('Hora inicial: $startTime');
      print('Hora final: $endTime');
       onHourIniChanged(startTime);
 onHourEndChanged(endTime);
      // Aquí puedes realizar cualquier acción adicional
    },
  ),
);
    // Aquí puedes mostrar un selector de tiempo, navegar a otra pantalla, etc.
  },
)
,
           SizedBox(height: 20),
                                  _buildTextFormField(
                                    controller: _titleController,
                                    labelText: TranslationManager.translate('tittleLabel'),
                                    maxLength: 30,
                                    validator: (value) => (value == null || value.isEmpty)
                                        ? TranslationManager.translate('requiredTittleLabel')
                                        : null,
                                  ),
                                  const SizedBox(height: 10),
                                  _buildCategorySection(),
                                  const SizedBox(height: 10),
                                  _buildPrioritySection(),
                                  const SizedBox(height: 10),
                                  _buildStatusSection(),
                                  const SizedBox(height: 20),
                                  _buildTextFormField(
                                    controller: _descriptionController,
                                    labelText: TranslationManager.translate('descriptionLabel'),
                                    maxLines: 2,
                                    onFieldSubmitted: (_) => _onSubmit(),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              clearCategoryStatusPrioritySignals();
                              GoRouter.of(context).go('/HomePrincipal');
                            },
                            child: Text(TranslationManager.translate('goBackButton')),
                          ),
                          ElevatedButton(
                            onPressed: _onSubmit,
                            child: Text(TranslationManager.translate('nextButton')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  TextFormField _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    int? maxLength,
    int? maxLines,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onFieldSubmitted,
  }) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      maxLength: maxLength,
      onChanged: (value) {
        print('onChange del text');
        onTittleChanged(_titleController.text);
        onDescriptionChanged(_descriptionController.text);
      },
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }

  Widget _buildCategorySection() {
    return Builder(
      builder: (context) {
        if (categoriesCSP.watch(context) != null) {
          bool selectMultiple = false;
          if (widget.id != 0) {
            //es modificar
          } else //es insertar que cargue el primero por defecto
          {
            if (categoriesCSP.value!.isNotEmpty) {
              onCategorySelected(categoriesCSP.value!.first.id);
            }
          }

          return CategoryWidget(
            eventDetails: false,
            fitTextContainer: false,
            categories: categoriesCSP.value!,
            titleWidget: 'Categoría',
            selectedCategoryId: selectedCategoryIdCSP.value,
            selectMultiple: selectMultiple,
            onSelectionChanged: (selectedCategories) async {
              FocusScope.of(context).unfocus();

              // print('kkkkkkkkkkk:${selectedCategories}');

              arrayCategory = selectedCategories.map((category) => category.id).toList();
              if (arrayCategory.isNotEmpty) {
                print('Estados seleccionados-elementos de la primera pagina:${arrayCategory.first}');
                onCategorySelected(arrayCategory.first);
              }
            },
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }

  Widget _buildPrioritySection() {
    return Builder(
      builder: (context) {
        if (prioritiesCSP.watch(context) != null) {
          bool selectMultiple = false;
          if (widget.id != 0) {
            //es modificar
          } else //es insertar que cargue el primero por defecto
          {
            if (prioritiesCSP.value!.isNotEmpty) {
              onPrioritySelected(prioritiesCSP.value!.first.id);
            }
          }
          return PriorityWidget(
            priorities: prioritiesCSP.value!,
            titleWidget: 'Prioridad',
            selectMultiple: selectMultiple, // Cambia a false si solo quieres una selección
            selectedPriorityId: selectedPriorityIdCSP.value,
            onSelectionChanged: _onSelectionChanged,
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }

  Widget _buildStatusSection() {
    return Builder(
      builder: (context) {
        if (statusCSP.watch(context) != null) {
          bool selectMultiple = false;
          if (widget.id != 0) {
            //es modificar
          } else //es insertar que cargue el primero por defecto
          {
            if (statusCSP.value!.isNotEmpty) {
              onTaskStateSelected(statusCSP.value!.first.id);
            }
          }
          return StatusWidget(
            status: statusCSP.value!,
            fitTextContainer: false,
            eventDetails: true,
            titleWidget: 'Estado',
            selectMultiple: selectMultiple, // Permite seleccionar solo un estado
            selectedStatusId: selectStateTaskCSP.value, // Estado preseleccionado
            onSelectionChanged: (List<Status> selectedStatuses) {
              FocusScope.of(context).unfocus();
              // Aquí manejas los estados seleccionados
              print('Estados seleccionados: ${selectedStatuses.map((e) => e.id).join(', ')}');
              selectedStatus = selectedStatuses.isNotEmpty ? selectedStatuses.first.id : 0;
              print('Estados seleccionados: $selectedStatus');

              //seleccionando el estado
              onTaskStateSelected(selectedStatus);
            },
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }
//
  _buildTaskTypeSection() {
    return Builder(
      builder: (context) {
        if (taskTypeCSP.watch(context) != null) {
          // Supongamos que 'frequencies' es una lista de nombres de frecuencias.[Diaria, Semanal, Mensual, Anual]
          final taskTypeData = taskTypeCSP.value; // Cambia según tu fuente de datos         

          

          return TaskTypeWidget(
  taskTypes: taskTypeData!, // Lista de TaskType
  titleWidget: '',
  selectMultiple: false,
  onSelectionChanged: (selectedTaskTypes) {
    // Maneja las tareas seleccionadas
    

      FocusScope.of(context).unfocus();
       showModalBottomSheet(
  context: context,
  isDismissible: false, // No permite cerrar tocando fuera
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  builder: (context) => TimePickerModal(
    onSelect: (startTime, endTime) {
      //verificar si va 1 hora o van las 2 dependiendo si es evento o tarea

      print('Hora inicial: $startTime');
      print('Hora final: $endTime');
       onHourIniChanged(startTime);
 onHourEndChanged(endTime);
      // Aquí puedes realizar cualquier acción adicional
    },
  ),
);
         

  onTaskTypeChanged(selectedTaskTypes.first.id);
  updateTaskType(selectedTaskTypes.first.id);
  },
  selectedTaskTypeId: taskTypeSelectCSP.value , // Opcional, ID de la tarea pre-seleccionada
)
;
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }


//   _buildTaskTypeSection() {
//     return Builder(
//       builder: (context) {
//         if (taskTypeCSP.watch(context) != null) {
//           // Supongamos que 'frequencies' es una lista de nombres de frecuencias.[Diaria, Semanal, Mensual, Anual]
//           final taskTypeData = taskTypeCSP.value; // Cambia según tu fuente de datos         

          

//           return TaskTypeWidget(
//   taskTypes: taskTypeData!, // Lista de TaskType
//   titleWidget: 'Tipo',
//   selectMultiple: false,
//   onSelectionChanged: (selectedTaskTypes) {
//     // Maneja las tareas seleccionadas
//       FocusScope.of(context).unfocus();

//   onTaskTypeChanged(selectedTaskTypes.first.id);
//   updateTaskType(selectedTaskTypes.first.id);
//   },
//   selectedTaskTypeId: taskTypeSelectCSP.value , // Opcional, ID de la tarea pre-seleccionada
// )
// ;
//         } else if (errorMessageCSP.watch(context) != null) {
//           return Center(child: Text('Error: ${errorMessageCSP.value}'));
//         }
//         return Container();
//       },
//     );
//   }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // Crea un nuevo TaskElement
      FocusScope.of(context).unfocus();

      //guardando el estado
      //  onTittleChanged(_titleController.text);
      // onDescriptionChanged(_descriptionController.text);
      // agregando al array para enviar a insertar
      updateTaskTitleDescription(_titleController.text, _descriptionController.text);
      updateTaskCategoryId(selectedCategoryIdCSP.value!);
      updateTaskPriority(selectedPriorityIdCSP.value!);
      updateTaskStatusId(selectStateTaskCSP.value!);
      print('Primera pagina de tareas-_titleController-${_titleController.text}'); 
      print('Primera pagina de tareas-_descriptionController-${_descriptionController.text}'); 
      print('Primera pagina de tareas-selectedCategoryIdCSP-${selectedCategoryIdCSP.value!}'); 
      print('Primera pagina de tareas-selectedPriorityIdCSP-${selectedPriorityIdCSP.value!}'); 
      print('Primera pagina de tareas-selectStateTaskCSP-${selectStateTaskCSP.value!}'); 



      // Navegar a la siguiente página
      widget.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

// Método que será llamado cuando se seleccionen o deseleccionen prioridades
  void _onSelectionChanged(List<Priority> selectedPrioritiesList) {
    FocusScope.of(context).unfocus();
    selectedPriorities = selectedPrioritiesList;

    // Aquí manejas los estados seleccionados
    print('Estados seleccionados: ${selectedPrioritiesList.map((e) => e.id).join(', ')}');
    selectedPriority = selectedPrioritiesList.isNotEmpty ? selectedPrioritiesList.first.id : 0;
    print('Estados seleccionados: $selectedStatus');
    //seleccionando la prioridad
    onPrioritySelected(selectedPriority);
    //este va actualizando el arreglo para mandar a insertar o eliminar
  }
}
