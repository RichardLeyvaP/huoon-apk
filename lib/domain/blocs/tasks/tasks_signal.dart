// signals.dart
import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:signals/signals.dart';

// Definimos las señales que almacenarán los estados
final Signal<bool> isLoadingTA = Signal<bool>(false);
final Signal<String?> errorMessageTA = Signal<String?>(null);
final Signal<String?> empyMessageTA = Signal<String?>(null);
final Signal<TaskElement> taskElementTA = Signal<TaskElement>(const TaskElement());
final Signal<bool> taskElementUpdateTA = Signal<bool>(false);
final Signal<Task?> taskDataTA = Signal<Task?>(null); // Almacena los datos de la tarea
final Signal<String> successMessageTA = Signal<String>("");
