import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/blocs/tasks/tasks_service.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:huoon/ui/Components/family_widget.dart';
import 'package:huoon/ui/Components/frequency_widget.dart';
import 'package:huoon/ui/pages/rol-admin/Task/selectDays/utils.dart';
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

  //**esto es para la localizacion */

  List<Taskperson> selectedTaskpersons = [];
  List<String>? selectedRoles; // Para almacenar los roles seleccionados

  void _onSelectionChanged(List<Taskperson> selected, List<String>? roles) {
    FocusScope.of(context).unfocus();
    /* setState(() {
      selectedTaskpersons = selected; // Guarda la lista de personas seleccionadas
      selectedRoles = roles; // Guarda la lista de roles seleccionados
    });*/
    // Función para convertir List<Taskperson> a List<Person>

    List<Person> persons = convertToPersonList(selectedTaskpersons);
    // aqui se agregan los familiares
    updateTaskFamily(persons);
    onFamilySelected(selected);
    // Aquí puedes hacer algo con los datos seleccionados
    // print("Estados seleccionados-Personas seleccionadas: ${selectedTaskpersons.length}");
    print("Estados seleccionados-Personas seleccionadas: ${selectedTaskpersons.map((p) => p.id)}");
    // print("Estados seleccionados-Roles seleccionados: $selectedRoles");
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
  DateTime _focusedDay = DateTime.now();
  DateTimeRange? _selectedDateRange;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
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
        if (taskPersonsCSP.watch(context) != null) {
          final taskpersons = taskPersonsCSP.value; //todas la spersonas que pertenencen al hogar
          return TaskpersonWidget(
            taskpersons: taskpersons!,
            titleWidget: 'Selecciona un Familiar',
            selectMultiple: true, // Permitir selección múltiple
            enableRoleSelection: true, // Habilitar selección de rol
            selectedPersonId: selectedPersonIdsCSP.value.first,
            rolesList: ['Responsable', 'Participante', 'Invitado'],
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

  _buildCalendarSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              headerStyle: const HeaderStyle(
                // titleTextFormatter: (date, locale) => '', // Oculta el título
                formatButtonVisible: false, // Oculta el botón de formato
                // titleCentered: true,
                // leftChevronVisible: false, // Oculta el botón de navegación izquierda
                // rightChevronVisible: false, // Oculta el botón de navegación derecha
              ),
              locale: 'es_ES',
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: RangeSelectionMode.toggledOn, // Activar selección de rango
              selectedDayPredicate: (day) {
                //FocusScope.of(context).unfocus();
                return _selectedDateRange != null &&
                    (isSameDay(_selectedDateRange!.start, day) || isSameDay(_selectedDateRange!.end, day));
              },
              rangeStartDay: _selectedDateRange?.start,
              rangeEndDay: _selectedDateRange?.end,
              onRangeSelected: (start, end, focusedDay) async {
                // Resetear horas cuando cambia el rango
                FocusScope.of(context).unfocus();
                setState(() {
                  _selectedDateRange = DateTimeRange(start: start!, end: end ?? start);
                  _focusedDay = focusedDay;
                  _startTime = null;
                  _endTime = null;
                });
                print('selcct dataHora-zzzzz-start:$start');
                print('selcct dataHora-zzzzz-end:$end');

                // Selecciona la hora de inicio
                if (start != null) {
                  await _selectTime(context, true); // Seleccionar hora para la fecha de fin
                }
                // Selecciona la hora de fin solo si hay una fecha final seleccionada
                if (end != null) {
                  await _selectTime(context, false); // Seleccionar hora para la fecha de fin
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            if (_selectedDateRange != null && _startTime != null && _endTime != null) ...[
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white, // Color de fondo del contenedor
                  borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
                  border: Border.all(
                    color: selectedLevel == 2
                        ? colorBotoomSel.withOpacity(0.8)
                        : colorBotoom.withOpacity(0.4), // Color del borde
                    width: 2.0, // Grosor del borde
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: selectedLevel == 2
                          ? colorBotoomSel.withOpacity(0.4)
                          : colorBotoom.withOpacity(0.4), // Sombra roja
                      spreadRadius: 0, // Asegura que la sombra esté en el borde
                      blurRadius: 10, // Difumina la sombra
                      offset: Offset(0, 0), // Posiciona la sombra en las 4 partes
                    ),
                  ],
                ),
                child: Center(child: Text('Inicial:${_formatDateTime(_selectedDateRange!.start, _startTime)}')),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white, // Color de fondo del contenedor
                  borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
                  border: Border.all(
                    color: selectedLevel == 2
                        ? colorBotoomSel.withOpacity(0.8)
                        : colorBotoom.withOpacity(0.4), // Color del borde
                    width: 2.0, // Grosor del borde
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: selectedLevel == 2
                          ? colorBotoomSel.withOpacity(0.4)
                          : colorBotoom.withOpacity(0.4), // Sombra roja
                      spreadRadius: 0, // Asegura que la sombra esté en el borde
                      blurRadius: 10, // Difumina la sombra
                      offset: Offset(0, 0), // Posiciona la sombra en las 4 partes
                    ),
                  ],
                ),
                child: Center(child: Text('Final:${_formatDateTime(_selectedDateRange!.end, _endTime)}')),
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

          List<Frequency> frequencies = frequenciesData!.map((item) {
            final title = item; // Asegúrate de que item sea un String
            if (title == frequencyTaskCSP.value) {
              frecuencyId = frequenciesData.indexOf(item) + 1;
            }
            return Frequency(
              id: frequenciesData.indexOf(item) +
                  1, // Asigna un id basado en el índice, puedes cambiar esto si tienes otra lógica
              title: title,
              description: '', // Si no tienes descripción, puedes dejarlo vacío o manejarlo de otra manera
            );
          }).toList();

          return FrequencyWidget(
            frequencies: frequencies,
            titleWidget: 'Frecuencia',
            selectMultiple: false, // Permite seleccionar solo una frecuencia
            selectedFrequencyId: frecuencyId, // Frecuencia preseleccionada (Opcional)
            onSelectionChanged: (List<Frequency> selectedFrequencies) {
              FocusScope.of(context).unfocus();
              // Aquí manejas las frecuencias seleccionadas
              print('Estados seleccionados-Frecuencias seleccionadas: ${selectedFrequencies.map((e) => e.title)}');
              print('Estados seleccionados-Frecuencias seleccionadas2: ${selectedFrequencies.first.title}');
              if (selectedFrequencies.isNotEmpty) {
                onFrequencyChanged(selectedFrequencies.first.title);
                updateTaskRecurrence(selectedFrequencies.first.title);
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
      //para mantener el estado
      onGeoLocationChanged(_locationController.text);
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

      if (tittle == 'Modificar Tarea') {
        await updateTasks();
      } else {
        //ENVIANDO A INSERTAR
        await storeTask();
      }
      clearCategoryStatusPrioritySignals();

      // Navegar a la siguiente página
      Future.delayed(const Duration(seconds: 2), () {
        GoRouter.of(context).go(
          '/HomePrincipal',
          extra: {
            'name': '',
            'email': '',
            'avatarUrl': '',
          },
        );
      });
    }
  }

  /* Widget cardSimpleSelectionFamily(CategoriesStatusPrioritySuccess state, Taskperson status) {
    bool isSelected = state.selectedPersonIds.contains(1);

    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10.0, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? colorBotoomSel.withOpacity(0.8) : colorBotoom.withOpacity(0.4),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected ? colorBotoomSel.withOpacity(0.4) : colorBotoom.withOpacity(0.4),
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(status.imagePerson),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    status.namePerson,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.red : Colors.black,
                    ),
                  ),
                  Text(
                    status.nameRole,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }*/

  /*cardSimpleSelectionFrecuncy(CategoriesStatusPrioritySuccess state, String status) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10.0, bottom: 10),
      child: Container(
        // height: 20,
        width: 120,
        // margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: state.frequencytask == status ? colorBotoomSel.withOpacity(0.8) : colorBotoom.withOpacity(0.4),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: state.frequencytask == status ? colorBotoomSel.withOpacity(0.4) : colorBotoom.withOpacity(0.4),
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              status,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: state.frequencytask == status ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }*/

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

      updateTaskDateTime(_formatDateTime(startDate, startTime), _formatDateTime(endDate, endTime));
    } else {
      updateTaskDateTime(
          _formatDateTime(_selectedDateRange!.start, _startTime), _formatDateTime(_selectedDateRange!.end, _endTime));
    }
  }
}
