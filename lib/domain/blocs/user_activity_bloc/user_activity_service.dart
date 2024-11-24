import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_signal.dart';
import 'package:intl/intl.dart';

// Funciones para manejar las acciones y actualizar las señales
void onScreenChange(String screenName, {Map<String, dynamic>? additionalData}) {
  // Mantener el valor previo si `additionalData` es null
  final existingAdditionalData = currentScreenUA.value.additionalData;
  currentScreenUA.value = ScreenContext(
    screenName,
    additionalData: additionalData ?? existingAdditionalData,
  );
}

void onActionPerformed(String actionDesc, {String? itemTitle, required DateTime timestamp}) {
  actionDescriptionUA.value = actionDesc;
  selectedItemTitleUA.value = itemTitle;
}

void onDataInput(String field, String type, dynamic value, DateTime timestamp) {
  dataFieldUA.value = field;
  dataTypeUA.value = type;
  dataValueUA.value = value;
}

void onErrorEncountered(String errorDesc, String context, DateTime timestamp) {
  errorDescriptionUA.value = errorDesc;
  errorContextUA.value = context;
}

void onSessionStarted(DateTime start) {
  sessionStartUA.value = start;
  sessionEndUA.value = null;
  sessionDurationUA.value = null;
}

void onSessionEnded(DateTime end) {
  if (sessionStartUA.value != null) {
    sessionEndUA.value = end;
    sessionDurationUA.value = end.difference(sessionStartUA.value!);
  }
}

int getIndexCurrentScreenUA() {
  switch (currentScreenUA.value.screenName) {
    case 'screen_Home_Wishes':
      return 0;
    case 'screen_Home_Finance':
      return 1;
    case 'screen_Home_Health':
      return 2;
    case 'screen_Home_Tasks':
      return 3;
    case 'screen_Home_Store':
      return 4;
    case 'screen_Home_Files':
      return 5;

    default:
      return 3; // Valor predeterminado si no coincide(RETORNA A TASK)
  }
}

// Obtener el día seleccionado en una pantalla específica (ejemplo: tareas)
String getSelectedDate() {
  final additionalData = currentScreenUA.value.additionalData;
  if (additionalData != null && additionalData.containsKey('selectedDate')) {
    return additionalData['selectedDate'];
  } else {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return date;
  }
}

// Ejemplo de actualización de contexto para tareas
void updateTaskScreen(String selectedDate) {
  onScreenChange(
    'screen_Home_Tasks',
    additionalData: {'selectedDate': selectedDate},
  );
}

void clearUserActionSignals() {
  // Limpiar todas las señales y restaurar a sus valores iniciales
  currentScreenUA.value = ScreenContext(""); // Restauramos el contexto de la pantalla
  actionDescriptionUA.value = null;
  selectedItemTitleUA.value = null;
  dataFieldUA.value = "";
  dataTypeUA.value = "";
  dataValueUA.value = null;
  errorDescriptionUA.value = null;
  errorContextUA.value = null;
  sessionStartUA.value = null;
  sessionEndUA.value = null;
  sessionDurationUA.value = null;
}
