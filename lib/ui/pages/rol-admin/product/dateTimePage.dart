import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/products/product_model.dart';
import 'package:huoon/domain/blocs/products_bloc/products_service.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class DateTimePage extends StatefulWidget {
  @override
  _DateTimePageState createState() => _DateTimePageState();
  final PageController pageController;

  DateTimePage({required this.pageController});
}

class _DateTimePageState extends State<DateTimePage> {
  DateTime _focusedDay = DateTime.now();
  DateTimeRange? _selectedDateRange;
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  static final kFirstDay = DateTime(2020, 1, 1);
  static final kLastDay = DateTime(2030, 12, 31);

  // Formato completo con fecha y hora, imprime por separado
  String _formatDateTime(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    print('Fecha seleccionada: $formattedDate'); // Imprimir solo la fecha
    return DateFormat('yyyy-MM-dd').format(date);
  }

  int selectedLevel = 0; // Para seleccionar el nivel
  Color colorBotoom = const Color.fromARGB(255, 61, 189, 93);
  Color colorBotoomSel = const Color.fromARGB(255, 199, 64, 59);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fecha'),
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
        child: Column(
          children: [
            TableCalendar(
              locale: 'es_ES',
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: RangeSelectionMode.toggledOn, // Activar selección de rango
              selectedDayPredicate: (day) {
                return _selectedDateRange != null &&
                    (isSameDay(_selectedDateRange!.start, day) || isSameDay(_selectedDateRange!.end, day));
              },
              rangeStartDay: _selectedDateRange?.start,
              rangeEndDay: _selectedDateRange?.end,
              onRangeSelected: (start, end, focusedDay) async {
                // Resetear horas cuando cambia el rango
                setState(() {
                  _selectedDateRange = DateTimeRange(start: start!, end: end ?? start);
                  _focusedDay = focusedDay;
                });
                print('selcct dataHora-zzzzz');
                print('selcct dataHora-zzzzz-start:$start');
                print('selcct dataHora-zzzzz-end:$end');
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
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
              child: Center(
                child: Text(
                  _selectedDateRange != null
                      ? 'Fecha de Compra : ${_formatDateTime(_selectedDateRange!.start)}'
                      : 'Fecha de Compra : No seleccionada',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
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
              child: Center(
                child: Text(
                  _selectedDateRange != null
                      ? 'Fecha de Vencimiento : ${_formatDateTime(_selectedDateRange!.end)}'
                      : 'Fecha de Vencimiento : No seleccionada',
                ),
              ),
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
                    if (_selectedDateRange != null) {
                      _onSubmit();
                    } else {
                      _onSubmitIncomple();
                    }
                  },
                  child: Text("Insertar Producto"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmitIncomple() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Escoja la fecha por favor'),

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

  void _onSubmit() {
    // Cierra el teclado si está abierto
    FocusScope.of(context).unfocus();
    // Enviar el evento al BLoC
    String _dataStart = _formatDateTime(_selectedDateRange!.start);
    String _dataEnd = _formatDateTime(_selectedDateRange!.end);
    print('object-dataStart:$_dataStart');
    print('object-dataEnd:$_dataEnd');
    //todo ahora esta fijo
    final productElement = ProductElement(
      purchaseDate: _dataStart,
      expirationDate: _selectedDateRange!.end,
      // image: 'products/1.jpg',
    );
// Dispara el evento para insertar el producto
    updateProductData(productElement);
    submitProduct();

    // Navegar a la siguiente página

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Se está creando el producto...'),

        duration: Duration(seconds: 2), // Duración del SnackBar
        action: SnackBarAction(
          label: 'Aceptar',
          onPressed: () {
            // Acción a realizar si se presiona el botón
          },
        ),
      ),
    );
//llamar que actualice las tareas al dia seleccionado
//  String date = '2024-09-09'; // La fecha puede ser dinámica
    // context.read<TasksBloc>().add(TasksRequested('2024-09-16')); // Pasar la fecha al evento
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
