import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/products/product_model.dart';
import 'package:huoon/domain/signals/products_signals/products_service.dart';
import 'package:huoon/domain/signals/products_signals/products_signal.dart';
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
  String tittle = 'Nuevo Producto';

  // Formato completo con fecha y hora, imprime por separado
  String _formatDateTime(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
   // print('Fecha seleccionada: $formattedDate'); // Imprimir solo la fecha
    return formattedDate;
  }

  int selectedLevel = 0; // Para seleccionar el nivel
  Color colorBotoom = const Color.fromARGB(255, 61, 189, 93);
  Color colorBotoomSel = const Color.fromARGB(255, 199, 64, 59);

  @override
  void initState() {
    super.initState();
    // Fechas predeterminadas

     if (isUpdateProductSignal.value == true) {
      tittle = 'Modificar Producto';
      if (productElementSignal.value != null) {
        DateTime initialStartDate = DateTime.parse(productElementSignal.value!.purchaseDate!);
    DateTime initialEndDate = productElementSignal.value!.expirationDate!;
    
    // Inicializa el rango seleccionado
    _selectedDateRange = DateTimeRange(start: initialStartDate, end: initialEndDate);

    // Fija el día enfocado en el calendario
    _focusedDay = initialStartDate;

    print('Rango inicial: ${_selectedDateRange!.start} - ${_selectedDateRange!.end}');
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(tittle),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              locale: 'es_ES',
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              selectedDayPredicate: (day) {
                return _selectedDateRange != null &&
                    (isSameDay(_selectedDateRange!.start, day) || isSameDay(_selectedDateRange!.end, day));
              },
              rangeStartDay: _selectedDateRange?.start,
              rangeEndDay: _selectedDateRange?.end,
              onRangeSelected: (start, end, focusedDay) async {
                setState(() {
                  _selectedDateRange = DateTimeRange(start: start!, end: end ?? start);
                  _focusedDay = focusedDay;
                });
               // print('selcct dataHora-zzzzz-start:$start');
              //  print('selcct dataHora-zzzzz-end:$end');
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
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
                child: Text(
                  _selectedDateRange != null
                      ? 'Fecha de Compra : ${_formatDateTime(_selectedDateRange!.start)}'
                      : 'Fecha de Compra : No seleccionada',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
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
                  child: Text(tittle),
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
        content: Text(
          'Escoja la fecha por favor',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Aceptar',
          onPressed: () {},
        ),
      ),
    );
  }

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();
    String _dataStart = _formatDateTime(_selectedDateRange!.start);
    String _dataEnd = _formatDateTime(_selectedDateRange!.end);
    final productElement = ProductElement(
      purchaseDate: _dataStart,
      expirationDate: _selectedDateRange!.end,
    );
    updateProductData(productElement);
    String msj = isUpdateProductSignal.value == true
        ? 'Se está modificando el producto...'
        : 'Se está creando el producto...';

    if (isUpdateProductSignal.value == true) {
      print('Datos del productos a modificar-${productElementSignal.value}');
     await updateProduct();
     
    } else {
      print('Datos del productos a insertar-${productElementSignal.value}');
      await submitProduct();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msj),
        duration: Duration(seconds: 2),
        action: SnackBarAction(label: 'Aceptar', onPressed: () {}),
      ),
    );

    GoRouter.of(context).go(
      '/HomePrincipal'
    );
  }
}
