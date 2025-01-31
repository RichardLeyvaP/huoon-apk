// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:huoon/domain/blocs/products_bloc/products_service.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

//subida de archivo
//******************* */

// Esta función se llamará cuando el usuario presione el botón
Future<void> pickFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // Permite cualquier tipo de archivo
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      print('result-archivo-Archivo seleccionado: ${file.path}');
      await sendFileToApi(file); // Envía el archivo a la API
    } else {
      print('result-archivo-No se seleccionó ningún archivo');
    }
  } catch (e) {
    print('result-archivo-Error al seleccionar el archivo: $e');
  }
}

Future<void> sendFileToApi(File file) async {
  // Lógica para enviar el archivo a la API
  print('Enviando archivo a la API: ${file.path}');
}

class FilePickerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Llama a la función para seleccionar y enviar el archivo
        await pickFile();
      },
      child: Text('Seleccionar Imagen'),
    );
  }
}

//******************* */
//subida de archivo

//******************* */
//selccionador de cantidades

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int> onQuantityChanged; // Función callback

  const QuantitySelector({
    Key? key,
    required this.initialQuantity,
    required this.onQuantityChanged, // Recibimos la función callback
  }) : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Cantidad: ', style: TextStyle(fontSize: 14)),
        IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: quantity > 1
              ? () {
                  decreaseQuantity();
                  setState(() {
                    quantity--;
                  });
                  widget.onQuantityChanged(quantity); // Llamamos la función callback
                }
              : null,
        ),
        Text('$quantity', style: TextStyle(fontSize: 16)),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {
            increaseQuantity();
            setState(() {
              quantity++;
            });
            widget.onQuantityChanged(quantity); // Llamamos la función callback
          },
        ),
      ],
    );
  }
}


// Método auxiliar para asignar íconos según el nombre de la categoría
IconData getCategoryIcon(String categoryName) {
  switch (categoryName.toLowerCase()) {
    case 'food':
      return Icons.fastfood;
    case 'cleaning':
      return Icons.cleaning_services;
    case 'electronics':
      return Icons.electrical_services;
    default:
      return Icons.category;
  }
}
//******************* */
//selccionador de cantidades

//******************* */
//sdevuelve un color entrado un String "FF3DBD5D"
Color getColorConvert(String? colorString) {
  try {
    if (colorString == null)
      return Color(int.parse('ffffff', radix: 16));
    else
      return Color(int.parse(colorString, radix: 16));
  } catch (e) {
    print('getColorConvert :$e');
    return const Color.fromARGB(255, 119, 76, 121); //color por defecto
  }
}
//******************* */
//sdevuelve un color entrado un String "FF3DBD5D"

//******************* */
// Convierte el string a un objeto DateTime
String extractTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Usa DateFormat para extraer solo la hora
  return DateFormat('HH:mm').format(dateTime);
}
//******************* */

//******************* */
// Convierte el string a un objeto DateTime
String formatDate(String dateString) {
  final date = DateTime.parse(dateString);
  return DateFormat('yyyy-MM-dd').format(date);
}
//******************* */
//******************* */
// Convierte el string a un objeto DateTime

IconData getIconFromString(String iconName) {
  switch (iconName) {
    case 'MdiIcons.broom': // Limpiar la Casa
      return MdiIcons.broom;
    case 'MdiIcons.wrench': // Mantenimiento
      return MdiIcons.wrench;
    case 'MdiIcons.silverwareForkKnife': // Cocina
      return MdiIcons.silverwareForkKnife;
    case 'MdiIcons.formatPaint': // Pintura
      return MdiIcons.formatPaint;
    case 'MdiIcons.cakeVariant': // Cumpleaños
      return MdiIcons.cakeVariant;
    case 'MdiIcons.cart': // Mercado
      return MdiIcons.cart;
    case 'MdiIcons.washingMachine': // Lavandería
      return MdiIcons.washingMachine;
    //
    //*****ESTOS SON PARA LA PRIORIDAD******/
    case 'Normal':
      return MdiIcons.calendarCheck; // Icono representando tareas completadas de manera tranquila
    case 'Media':
      return MdiIcons.alertCircleOutline; // Alerta moderada, para indicar atención sin urgencia
    case 'Alta':
      return MdiIcons.alertOctagonOutline; // Icono de advertencia fuerte para indicar prioridad alta
    //*****ESTOS SON PARA LA PRIORIDAD******/
    //
    default:
      return MdiIcons.alertCircleOutline; // Icono por defecto
  }
}

//******************* */

bool emptyTextField(String texto) {
  //me dice si tiene texto o no true esta vacio y false es que tiene
  return texto.trim().isEmpty;
}

String multiplyAndConvert(int intValue, String stringValue) {
  try {
    // Convertir el String a double
    double doubleValue = double.parse(stringValue);

    // Multiplicar el int y el double
    double result = intValue * doubleValue;

    // Convertir el resultado a String y retornarlo
    return result.toString();
  } catch (e) {
    // Manejo de errores en caso de que la conversión falle
    return "0.0";
  }
}


void showOverlayMessage(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10, // Ajusta la posición
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  // Añadir el OverlayEntry al Overlay
  overlay?.insert(overlayEntry);

  // Quitar el OverlayEntry después de 2 segundos
  Future.delayed(Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}