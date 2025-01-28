import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:huoon/domain/signals/products_signals/products_service.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class TranslationManager {
  static late Locale _locale;
  static Map<String, dynamic> _localizedValues = {};

  static List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('es', 'ES'),
    const Locale('pt', 'BR'),
  ];

  static LocalizationsDelegate<TranslationManager> delegate = const _TranslationDelegate();

  // Cargar las traducciones por defecto al iniciar la aplicación
  static Future<void> loadDefaultTranslations(String locale) async {
    _locale = getCurrentApi(locale);
    await loadTranslations(_locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language_code', locale);
  }

  // Cargar traducciones específicas para un locale dado
  static Future<void> loadTranslations(Locale locale) async {
    try {
      // Cargar contenido del archivo .arb correspondiente
      String jsonContent = await rootBundle.loadString('lib/l10n/app_${locale.languageCode}.arb');
      _localizedValues = json.decode(jsonContent);
    } catch (e) {
      print("Error loading translations: $e");
      _localizedValues = {}; // Asignar un mapa vacío en caso de error
    }
    _locale = locale;
  }

  // Método para traducir una clave dada
  static String translate(String key) {
    return _localizedValues[key] ?? key; // Si la clave no existe, retorna la clave misma
  }

  // Obtener el locale actual
  static Locale getCurrentLocale() {
    return _locale;
  }

  // Obtener el locale actual según el idioma proporcionado
  static Locale getCurrentApi(String idioma) {
    switch (idioma) {
      case "es":
        return const Locale('es', 'ES');
      case "en":
        return const Locale('en', 'US');
      case "pt":
        return const Locale('pt', 'BR');
      default:
        return const Locale('es', 'ES'); // Valor por defecto
    }
  }

  // Actualizar el locale actual
  static void updateLocale(Locale locale) {
    _locale = locale;
  }

  // Método para encontrar el locale del sistema operativo (puede ser asíncrono)
  static Future<Locale> findSystemLocale() async {
    // Implementa aquí la lógica para determinar el idioma del sistema operativo
    return const Locale('es', 'ES'); // Valor por defecto
  }
}

class _TranslationDelegate extends LocalizationsDelegate<TranslationManager> {
  const _TranslationDelegate();

  @override
  bool isSupported(Locale locale) => TranslationManager.supportedLocales.contains(locale);

  @override
  Future<TranslationManager> load(Locale locale) async {
    await TranslationManager.loadTranslations(locale);
    return TranslationManager();
  }

  @override
  bool shouldReload(_TranslationDelegate old) => false;
}


class Language {
  final String name;
  final String code;
  final IconData icon;

  Language({
    required this.name,
    required this.code,
    required this.icon,
  });
}

class LanguageSelectorNew extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  LanguageSelectorNew({required this.onLocaleChange});

  @override
  _LanguageSelectorNewState createState() => _LanguageSelectorNewState();
}

class _LanguageSelectorNewState extends State<LanguageSelectorNew> {
  // Lista de idiomas disponibles con íconos
  final List<Language> _languages = [
    Language(name: 'English', code: 'en', icon: Icons.language),
    Language(name: 'Español', code: 'es', icon: Icons.translate),
    Language(name: 'Português', code: 'pt', icon: Icons.g_translate),
  ];

  // Índice del idioma seleccionado temporalmente
  int? _selectedLanguageIndex;

  // Índice del idioma actualmente aplicado
  int? _currentLanguageIndex;

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedLanguageCode = prefs.getString('selected_language_code');

    // Busca el índice del idioma guardado
    if (savedLanguageCode != null) {
      int? index = _languages.indexWhere((language) => language.code == savedLanguageCode);
      if (index != -1) {
        setState(() {
          _currentLanguageIndex = index;
          _selectedLanguageIndex = index; // Se establece como seleccionado
        });
      }
    } else {
      // Si no hay idioma guardado, establece el idioma por defecto (español)
      _currentLanguageIndex = 1; // Por defecto español
      _selectedLanguageIndex = _currentLanguageIndex;
    }
  }

  Future<void> _saveLanguage(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language_code', code);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            TranslationManager.translate('titleLanguage'),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: _languages.map((language) {
              final index = _languages.indexOf(language);
              final isSelected = _selectedLanguageIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedLanguageIndex = index;
                  });
                },
                child: Card(
                  color: isSelected ? Colors.blue.shade100 : Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isSelected ? Colors.blue : Colors.grey.shade300,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              language.icon,
                              // size: 30.0,
                              color: isSelected ? Colors.blue : Colors.grey,
                            ),
                            //SizedBox(height: 10),
                            Text(
                              language.name,
                              style: TextStyle(
                                // fontSize: 14,
                                color: isSelected ? Colors.blue : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Aplicar cambios
                  if (_selectedLanguageIndex != null) {
                    final selectedLanguage = _languages[_selectedLanguageIndex!];
                    widget.onLocaleChange(Locale(selectedLanguage.code));
                    _saveLanguage(selectedLanguage.code); // Guarda el idioma seleccionado
                  }
                },
                child: Text(TranslationManager.translate('acceptButton')),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _selectedLanguageIndex = _currentLanguageIndex; // Revertir cambios
                    Navigator.of(context).pop();
                  });
                },
                child: Text(TranslationManager.translate('cancelButton')),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
bool isNegative(String num) {
  try {
    double number = double.parse(num);  // Intentar convertir el string a un entero
    return number < 0;  // Devuelve true si el número es negativo, false si es positivo o cero
  } catch (e) {
    // Si ocurre una excepción (por ejemplo, si no es un número válido), se maneja aquí
    print('Error al parsear el número: $e');
    return false;  // Devuelve false si no se puede parsear el valor
  }
}

///////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
///
// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0



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
