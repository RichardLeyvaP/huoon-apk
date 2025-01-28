import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/domain/modelos/projectModels.dart';
import 'package:huoon/domain/signals/task_cat_state_prior_signals/task_cat_state_prior_service.dart';
import 'package:huoon/domain/signals/task_cat_state_prior_signals/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/signals/tasks_signals/tasks_service.dart';
import 'package:huoon/domain/signals/tasks_signals/tasks_signal.dart';
import 'package:huoon/ui/components/familyWidget.dart';
import 'package:huoon/ui/components/frequencyWidget.dart';
import 'package:huoon/ui/util/utilClass.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:signals/signals_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class SecondTaskPage extends StatefulWidget {
  final PageController pageController;
  final int? id; // ID opcional

  SecondTaskPage({required this.pageController, this.id});

  @override
  _SecondTaskPageState createState() => _SecondTaskPageState();
}

class _SecondTaskPageState extends State<SecondTaskPage> {
  final TextEditingController _locationController = TextEditingController();

  List<Person> convertToPersonList(List<Taskperson> taskpersons) {
    return taskpersons.map((taskperson) {
      return Person(
        id: taskperson.id,
        name: taskperson.namePerson!, // Mapear namePerson a name
        image: taskperson.imagePerson!, // Mapear imagePerson a image
        //roleId: taskperson.rolId!,
        //roleName: taskperson.nameRole!
      );
    }).toList();
  }

DateTime _focusedDay = DateTime.now();
DateTimeRange? _selectedDateRange;
TimeOfDay? _startTime;
TimeOfDay? _endTime;

 @override
  void initState() {
    super.initState();
    // Fechas predeterminadas
if (widget.id != 0) {
  DateTime initialStartDate = taskElementTA.value.startDate != null
      ? DateTime.parse(taskElementTA.value.startDate!)
      : DateTime.now();

  DateTime initialEndDate = taskElementTA.value.endDate != null
      ? DateTime.parse(taskElementTA.value.endDate!)
      : DateTime.now().add(Duration(days: 1)); // Un día más adelante

  // Verifica y corrige si el rango es inválido
  if (initialStartDate.isAfter(initialEndDate)) {
    DateTime temp = initialStartDate;
    initialStartDate = initialEndDate;
    initialEndDate = temp;
  }

  // Inicializa el rango seleccionado
  _selectedDateRange = DateTimeRange(start: initialStartDate, end: initialEndDate);

  // Fija el día enfocado en el calendario
  _focusedDay = initialStartDate;

  // Extrae la hora y los minutos directamente
  _startTime = TimeOfDay(hour: initialStartDate.hour, minute: initialStartDate.minute);
  _endTime = TimeOfDay(hour: initialEndDate.hour, minute: initialEndDate.minute);

  print('Rango inicial: ${_selectedDateRange!.start} - ${_selectedDateRange!.end}');
  print('Hora de inicio: $_startTime');
  print('Hora de fin: $_endTime');
}


    
  }


  //**esto es para la localizacion */

  List<Taskperson> selectedTaskpersons = [];
  List<String>? selectedRoles; // Para almacenar los roles seleccionados

  void _onSelectionChanged(List<Taskperson> selected, List<String>? roles) {
    FocusScope.of(context).unfocus();
    List<Person> persons = convertToPersonList(selected);
    // aqui se agregan los familiares
    updateTaskFamily(persons);
    onFamilySelected(selected);
    print('Primera pagina de tareas-seleccionando nuevas personas-$persons');

   
  }

  final _formKey = GlobalKey<FormState>();
  List<int> arrayCategory = [1]; // Inicializamos la cantidad seleccionada
  String selectedFrequency = ''; // Para seleccionar el nivel

  int selectedLevel = 0; // Para seleccionar el nivel
  Color colorBotoom = const Color.fromARGB(255, 61, 189, 93);
  Color colorBotoomSel = const Color.fromARGB(255, 199, 64, 59);

  String getRecurrence(int index) {
    String _recurrence = 'Diaria';
    if (selectedLevel == index) {
      _recurrence = 'Semanal';
    } else if (selectedLevel == index) {
      _recurrence = 'Mensual';
    } else if (selectedLevel == index) {
      _recurrence = 'Anual';
    }
    return _recurrence;
  }

  //**variables del dataTimer */
 
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;

  static final kFirstDay = DateTime(2020, 1, 1);
  static final kLastDay = DateTime(2030, 12, 31);

  // Selección de horas
  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      confirmText: 'Aceptar',
    );
    if (pickedTime != null) {
      setState(() {
        if (isStart) {
          print('selcct dataHora-$_startTime');
          _startTime = pickedTime;
        } else {
          _endTime = pickedTime;
          print('selcct dataHora-F$_endTime');
        }
      });
    }
  }

  // Formato completo con fecha y hora, imprime por separado
  String _formatDateTime(DateTime date, TimeOfDay? time) {
    if (time == null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      print('Fecha seleccionada: $formattedDate'); // Imprimir solo la fecha
      return DateFormat('yyyy-MM-dd').format(date);
    } else {
      final DateTime dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);

      // Formateamos por separado
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      String formattedTime = DateFormat('HH:mm:ss').format(dateTime);

      // Imprimimos fecha y hora por separado
      print('ffff-Fecha seleccionada: $formattedDate');
      print('ffff-Hora seleccionada: $formattedTime');

      return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    }
  }

  String tittle = 'Crear Tarea';

  //**variables del dataTimer */
  @override
  Widget build(BuildContext context) {
    print('mostrar el id:${widget.id}');
    if (widget.id != 0) {
      tittle = 'Modificar Tarea';
    }
    if (geoLocationTaskCSP.watch(context) != null) {
      _locationController.text = geoLocationTaskCSP.value!;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
          elevation: 0, // Asegúrate de que no tenga sombras adicionales
          title: Center(
            child: Column(
              children: [
                Text(
                  tittle,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  '(Paso 2 de 2)',
                  style: TextStyle(fontSize: 10, color: Color.fromARGB(150, 0, 0, 0)),
                ),
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0), // Altura de la línea
            child: Divider(
              height: 1.0, // Altura de la línea
              thickness: 2.0, // Grosor de la línea
              color: Color.fromARGB(50, 158, 158, 158), // Color de la línea
            ),
          ),
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildFamilySection(),
                        const SizedBox(height: 10),
                        _buildRecurrenceSection(),
                        const SizedBox(height: 10),
                        _buildTextFormField(
                          controller: _locationController,
                          labelText: 'Ubicación',
                          maxLength: 30,
                          // validator: (value) =>
                          //     (value == null || value.isEmpty) ? 'El título es requerido' : null,
                        ),
                        const SizedBox(height: 10),
                        FilePickerButton(),
                        _buildCalendarSection(context),
                      ],
                    ),
                  ),
                ),
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
                      onPressed: _onSubmit,
                      child: Text(tittle),
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

  _buildFamilySection() {
    return Builder(
      builder: (context) {
        if (taskPersonsCSP.value != null) {
          bool selectMultiple = true;
          List<Taskperson>? taskpersonsList;

          if (widget.id != 0) {
            //es modificar
            taskpersonsList = convertToTaskpersonList(taskElementTA.value.people!);
            updateTaskFamily(taskElementTA.value.people!);
            onFamilySelected(taskpersonsList);
            print('Primera pagina de tareas-updateTaskFamily-${taskElementTA.value.people!}'); 
          } else //es insertar que cargue el primero por defecto
          {
            if (taskPersonsCSP.value!.isNotEmpty) {
              onPersonSelected(taskPersonsCSP.value!.first.id);
            }
          }

// Luego, puedes usarla así:

          return TaskpersonWidget(
            taskpersons: taskPersonsCSP.value!,
            selectTaskpersons: taskpersonsList,
            titleWidget: 'Selecciona un Familiar',
            selectMultiple: selectMultiple, // Permitir selección múltiple
            enableRoleSelection: true, // Habilitar selección de rol
            selectedPersonId: null,
            rolesList: rolesCSP.value,
            onSelectionChanged: _onSelectionChanged, // Manejar cambios de selección
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
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
      onChanged: (value) {
        //para mantener el estado
        onGeoLocationChanged(controller.text);
        print('Primera pagina de tareas-onGeoLocationChanged-${controller.text}'); 
      },
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      maxLength: maxLength,
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

  DateTime? _startDate;
  DateTime? _endDate;

  // Actualiza el rango de fechas seleccionadas
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;

      if (taskTypeSelectCSP.value == 'Evento') {
        if (_startDate == null || _endDate != null) {
          // Si no hay fecha de inicio o ya se seleccionó un rango completo
          _startDate = selectedDay;
          _endDate = null;
        } else {
          // Si ya se seleccionó la fecha de inicio, seleccionamos la fecha final
          if (selectedDay.isBefore(_startDate!)) {
            _startDate = selectedDay;
            _endDate = null;
          } else if (selectedDay.isAfter(_startDate!)) {
            _endDate = selectedDay;
          }
        }


  if (_startDate != null && _endDate != null) {
     

  }
  updateTaskDateTime(
  _formatDateTimeProduct(_startDate ?? DateTime.now()),
  _formatDateTimeProduct(
    _endDate ?? (_startDate != null ? _startDate!.add(Duration(days: 1)) : DateTime.now()),
  ),
);
                         
      }
       else if (taskTypeSelectCSP.value == 'Tarea') {
        // Si es 'Tarea', solo selecciona un día
        _startDate = selectedDay;
        _endDate = null;
        
updateTaskDateTime(
  _formatDateTimeProduct(_startDate ?? DateTime.now()),
  _formatDateTimeProduct(_endDate ?? DateTime.now()),
);
      }
    });
  }

     // Formato completo con fecha y hora, imprime por separado
  String _formatDateTimeProduct(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
   // print('Fecha seleccionada: $formattedDate'); // Imprimir solo la fecha
    return formattedDate;
  }
  
 
_buildCalendarSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar(
            headerStyle: const HeaderStyle(
              formatButtonVisible: false, // Oculta el botón de formato
            ),
            locale: 'es_ES',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            onDaySelected: (selectedDay, focusedDay) async {
              FocusScope.of(context).unfocus();

              if (taskTypeSelectCSP.value == 'Evento') {
                // Si es evento, selecciona la primera fecha y activa el rango
                if (_selectedDateRange == null) {
                  setState(() {
                    _selectedDateRange = DateTimeRange(start: selectedDay, end: selectedDay);
                    _focusedDay = focusedDay;
                    _startTime = null;
                    _endTime = null;
                  });

                  // Seleccionar hora para la primera fecha
              //    await _selectTime(context, true);
                } else {
                  setState(() {
                    _selectedDateRange = DateTimeRange(
                      start: _selectedDateRange!.start,
                      end: selectedDay,
                    );
                    _focusedDay = focusedDay;
                  });

                  // Seleccionar hora para la segunda fecha
                  //await _selectTime(context, false);
                }
              } else {
                // Si no es evento, permite seleccionar solo una fecha
                setState(() {
                  _selectedDateRange = DateTimeRange(start: selectedDay, end: selectedDay);
                  _focusedDay = focusedDay;
                  _startTime = null;
                  _endTime = null;
                });

                // Seleccionar hora para la única fecha seleccionada
               // await _selectTime(context, true);
              }
            },
            onRangeSelected: taskTypeSelectCSP.value == 'Evento'
                ? (start, end, focusedDay) async {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      _selectedDateRange = DateTimeRange(start: start!, end: end ?? start);
                      _focusedDay = focusedDay;
                      _startTime = null;
                      _endTime = null;
                    });

                  }
                : null, // No habilita rango en otros casos
            rangeSelectionMode: taskTypeSelectCSP.value == 'Evento'
                ? RangeSelectionMode.toggledOn
                : RangeSelectionMode.disabled,
            selectedDayPredicate: (day) {
              return taskTypeSelectCSP.value == 'Evento'
                  ? _selectedDateRange != null &&
                      (isSameDay(_selectedDateRange!.start, day) ||
                          isSameDay(_selectedDateRange!.end, day))
                  : _selectedDateRange != null &&
                      isSameDay(_selectedDateRange!.start, day);
            },
            rangeStartDay: taskTypeSelectCSP.value == 'Evento' ? _selectedDateRange?.start : null,
            rangeEndDay: taskTypeSelectCSP.value == 'Evento' ? _selectedDateRange?.end : null,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          if (_selectedDateRange != null) ...[
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedLevel == 2
                      ? colorBotoomSel.withOpacity(0.8)
                      : colorBotoom.withOpacity(0.4),
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: selectedLevel == 2
                        ? colorBotoomSel.withOpacity(0.4)
                        : colorBotoom.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: Text('Inicial:${_formatDateTime(_selectedDateRange!.start, null)}'),
              ),
            ),
          ],
          if (taskTypeSelectCSP.value == 'Evento' &&
              _selectedDateRange != null ) ...[
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedLevel == 2
                      ? colorBotoomSel.withOpacity(0.8)
                      : colorBotoom.withOpacity(0.4),
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: selectedLevel == 2
                        ? colorBotoomSel.withOpacity(0.4)
                        : colorBotoom.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: Text('Final:${_formatDateTime(_selectedDateRange!.end, null)}'),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}

  _buildRecurrenceSection() {
    return Builder(
      builder: (context) {
        if (frequencyCSP.watch(context) != null) {
          // Supongamos que 'frequencies' es una lista de nombres de frecuencias.[Diaria, Semanal, Mensual, Anual]
          final frequenciesData = frequencyCSP.value; // Cambia según tu fuente de datos
          int frecuencyId = 1;

          

          return FrequencyWidget(
            frequencies: frequenciesData!,
            titleWidget: 'Frecuencia',
            selectMultiple: false, // Permite seleccionar solo una frecuencia
            selectedFrequencyId: frequencyTaskCSP.value, // Frecuencia preseleccionada (Opcional)
            onSelectionChanged: (List<Frequency> selectedFrequencies) {
              FocusScope.of(context).unfocus();
              // Aquí manejas las frecuencias seleccionadas
             // print('Estados seleccionados-Frecuencias seleccionadas: ${selectedFrequencies.map((e) => e.title)}');
              if (selectedFrequencies.isNotEmpty) {
                print('Primera pagina de tareas-Frecuencia-${selectedFrequencies.first.title}'); 
                onFrequencyChanged(selectedFrequencies.first.id);
                updateTaskRecurrence(selectedFrequencies.first.id);
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

  Future<void> _onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Cierra el teclado si está abierto
      FocusScope.of(context).unfocus();
      // para el array de mandar a insertar
      updateTaskGeoLocation(_locationController.text);
      eventDate(); //ACTUALIZA LA FECHA , SI NO LA ESCOJE LE PONE LA ACTUAL

      // Navegar a la siguiente página

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se está creando la tarea...'),

          duration: Duration(seconds: 2), // Duración del SnackBar
          action: SnackBarAction(
            label: 'Aceptar',
            onPressed: () {
              // Acción a realizar si se presiona el botón
            },
          ),
        ),
      );
      
     

      
        await updateTasks();  
        selecteFamilyCSP.value = null;
    selectedCategoryIdCSP.value = null;
    selecteFamilyCSP.value = null;
    selectedPriorityIdCSP.value = null;
    selectStateTaskCSP.value = null;
    //
    taskTypeSelectCSP.value = null;
    frequencyTaskCSP.value = '';    
      clearCategoryStatusPrioritySignals();
      clearPersonRoles();

      // Navegar a la siguiente página
      Future.delayed(const Duration(seconds: 1), () {
        GoRouter.of(context).go(
          '/HomePrincipal'
        );
      });
    }
  }

  List<Taskperson> convertToTaskpersonList(List<Person> personList) {
    return personList.map((person) {
      return Taskperson(
        id: person.id,
        namePerson: person.name,
        imagePerson: person.image,
        rolId: person.roleId,
        nameRole: person.roleName,
      );
    }).toList();
  }

  void _onSubmitIncomple() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Escoja la fecha y hora por favor'),

        duration: Duration(seconds: 2), // Duración del SnackBar
        action: SnackBarAction(
          label: 'Aceptar',
          onPressed: () {
            // Acción a realizar si se presiona el botón
          },
        ),
      ),
    );
  }

//*****LLAMADAS A EVENTOS BLOC***/
  void eventDate() {
    //mandar la fecha
    if (_selectedDateRange == null) //si el rango es null que coja la fecha actual
    {
      // Si _selectedDateRange es null, asignamos la fecha actual como inicio y fin.
      final DateTime startDate = _selectedDateRange?.start ?? DateTime.now();
      final DateTime endDate = _selectedDateRange?.end ?? DateTime.now();

      // Si _startTime es null, asignamos las 7:00 AM como hora predeterminada.
      final TimeOfDay startTime = _startTime ?? TimeOfDay(hour: 7, minute: 0);

// Si _endTime es null, asignamos las 6:00 PM como hora predeterminada.
      final TimeOfDay endTime = _endTime ?? TimeOfDay(hour: 18, minute: 0);

      updateTaskDateTime(_formatDateTime(startDate, null), _formatDateTime(endDate, null));
    } else {
      updateTaskDateTime(
          _formatDateTime(_selectedDateRange!.start, null), _formatDateTime(_selectedDateRange!.end, null));
    }
  }
}
