import 'package:signals/signals.dart';

// Clase para encapsular contexto de la pantalla
class ScreenContext {
  final String screenName; // Nombre de la pantalla
  final Map<String, dynamic>? additionalData; // Datos adicionales (ej: fecha seleccionada)

  ScreenContext(this.screenName, {this.additionalData});

  @override
  String toString() {
    return 'ScreenContext(screenName: $screenName, additionalData: $additionalData)';
  }
}

// Definición de las señales
final Signal<ScreenContext> currentScreenUA =
    Signal<ScreenContext>(ScreenContext("")); // Contexto de la pantalla actual
final Signal<String?> actionDescriptionUA = Signal<String?>(null); // Descripción de la acción realizada
final Signal<String?> selectedItemTitleUA = Signal<String?>(null); // Título del elemento seleccionado
final Signal<String> dataFieldUA = Signal<String>(""); // Campo de entrada de datos
final Signal<String> dataTypeUA = Signal<String>(""); // Tipo de entrada de datos
final Signal<dynamic> dataValueUA = Signal<dynamic>(null); // Valor de entrada de datos
final Signal<String?> errorDescriptionUA = Signal<String?>(null); // Descripción del error
final Signal<String?> errorContextUA = Signal<String?>(null); // Contexto del error
final Signal<DateTime?> sessionStartUA = Signal<DateTime?>(null); // Inicio de sesión
final Signal<DateTime?> sessionEndUA = Signal<DateTime?>(null); // Fin de sesión
final Signal<Duration?> sessionDurationUA = Signal<Duration?>(null); // Duración de la sesión
