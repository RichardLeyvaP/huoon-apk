import 'package:flutter/material.dart';
import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_signal.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_service.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';
import 'package:huoon/domain/blocs/tasks/tasks_service.dart';
import 'package:huoon/domain/blocs/tasks/tasks_signal.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';
import 'package:huoon/ui/pages/pageMenu/task/widget/cardTasksW.dart';
import 'package:huoon/ui/pages/rol-admin/Task/selectDays/utils.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  int selectedDay = DateTime.now().day;
  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();

    // Obtén la fecha seleccionada inicial desde getSelectedDate
    String initialDateString = getSelectedDate();
    DateTime initialDate = DateFormat('yyyy-MM-dd').parse(initialDateString);
    // Configura _selectedDay y _focusedDay con la fecha inicial
    _selectedDay = initialDate;
    _focusedDay = initialDate;
    // carga las tareas
    loadTasks(initialDateString);
    updateTaskScreen('screen_Home_Tasks', initialDateString); //screen_Home_Tasks

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    // });
  }
  loadTasks(String initialDateString)
  async {
    //siempre verifico si tiene hogar sino ni lo mando a la api
    print('aqui mostrando a homeSelectHH:${homeSelectHH.value}');
    if(homeSelectHH.value != null)
    {
      await fetchTasks(initialDateString);
    }
else{
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text('No tiene hogar asignado'),
//     duration: const Duration(seconds: 2),
//   ));
 }
  }

  @override
  Widget build(BuildContext context) {
    if (taskDeleteTA.watch(context) == true) {
      setState(() {});
    }
    String languageCode = 'es'; // Valor por defecto
    if (updateConfigurationCF.watch(context) == true) {
      languageCode = configurationCF.value!.language.toString();
    }
    return Column(
      children: [
        // El calendario permanece fijo en la parte superior
        TableCalendar(
          locale: languageCode,
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) async {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // print('calendario seleccion:${DateFormat('yyyy-MM-dd').format(selectedDay)}');
              setState(()  {
                
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                //actualizo el estado la fecha en que dio para ver la tarea
               
              });
              String date = DateFormat('yyyy-MM-dd').format(selectedDay);
               updateTaskScreen('screen_Home_Tasks', date); //screen_Home_Tasks
                //mando a buscar las tareas de esa fecha
               if(getHomeSelectHH() != null)
    {
      await fetchTasks(date);
    }
else{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('No tiene hogar asignado'),
    duration: const Duration(seconds: 2),
  ));
}
            }
          },
          headerStyle: const HeaderStyle(
            //estilo de texto de Septiembre del 2024
            formatButtonVisible: true, // Ocultar el botón de formato si no lo necesitas

            formatButtonTextStyle: TextStyle(
              fontSize: 11.0,
              color: Colors.black, // Cambiar el color del texto
              fontWeight: FontWeight.bold,
            ),

            titleTextStyle: TextStyle(
              fontSize: 12.0, // Cambia el tamaño de la letra aquí
              fontWeight: FontWeight.bold,
              color: Colors.black, // Cambia el color del texto
            ),
            titleCentered: false,
            headerMargin: EdgeInsets.only(bottom: 0), // Ajusta el margen inferior
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(fontSize: 12.0), // Tamaño del texto de los días de la semana
            weekendStyle: TextStyle(fontSize: 12.0), // Tamaño del texto del fin de semana
          ),
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: StyleGlobalApk.getColorPrimary().withOpacity(0.5), // Color para el día de hoy
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: StyleGlobalApk.getColorPrimary(), // Color para el día de hoy
              shape: BoxShape.circle,
            ),
          ),
        ),

        //todo el que estaba estatico
        Expanded(
          child: Builder(
            builder: (context) {
              if (isLoadingTA.watch(context) == true) {
                // Mostrar un indicador de carga mientras se obtienen las tareas
                return Center(
                    child: CircularProgressIndicator(
                  color: StyleGlobalApk.getColorPrimary(),
                ));
              } else if (errorMessageTA.watch(context) != null) {
                // Mostrar un mensaje de error en caso de falla
                return Center(child: Text(TranslationManager.translate('serverError'))); //serverError
                //todoMetodoRutaStatusCode este error para la db y guardarlo
                // return Center(child: Text('Ha ocurrido un Error: ${state.error}'));
              } else if (empyMessageTA.watch(context) != null) {
                // Mostrar mensaje si no hay tareas para ese día
                return Column(
                  children: [
                    const SizedBox(height: 180), //aqui el mensaje cuando esta vacio
                    Center(child: Text(TranslationManager.translate('noResults'))),
                    //Center(child: Text(state.message)),
                  ],
                );
              } else if (taskDataTA.watch(context) != null) {
                List<TaskElement> tasks = taskDataTA.value!.tasks; // Asegúrate que sea una lista de tareas

                // Construir la lista de `CardTasks` dependiendo de la longitud de las tareas
                return SingleChildScrollView(
                  child: Column(
                    children: tasks.map((task) {
                      print('personas por tarea:${task.people![0].name}');
                      print('personas por tarea-id:${task.people![0].roleId}');
                      print('personas por tarea-name:${task.people![0].roleName}');
                      return CardTasks(
                        idTask: task.id!,
                        title: task.title ?? '', // Aquí usas el título de la tarea
                        namePriority: task.namePriority ?? '',
                        iconPriority: getIconFromString(
                            task.namePriority ?? ''), //dado el nombre de la prioridad devuelve el icon
                        colorPriority: getColorConvert(task.colorPriority!),
                        icon: getIconFromString(task.iconCategory!), // Puedes cambiar el ícono
                        // icon: MdiIcons.cakeVariantOutline, // Puedes cambiar el ícono
                        date: formatDate(task.startDate!), // Aquí usas la fecha de inicio de la tarea
                        details: task.description ?? "", // Descripción de la tarea
                        location: task.geoLocation ?? "",
                        schedule: '${extractTime(task.startDate!)} - ${extractTime(task.endDate!)}', // Horario
                        iconSize: 12.0,
                        iconColor: getColorConvert(task.colorCategory), //verde Verde Brillante #32CD32
                        //iconColor: Color(int.parse(task.colorPriority, radix: 16)),
                        padding: 8.0,
                        people: task.people!,
                        task: task,
                        // radius: 30,
                      );
                    }).toList(),
                  ),
                );
              } else {
                // Retorna un widget vacío en caso de que no coincida ningún estado
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
