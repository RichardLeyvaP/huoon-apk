
import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/domain/modelos/projectModels.dart';
import 'package:signals/signals.dart';

// Definir las señales
final Signal<List<Category>?> categoriesCSP = Signal<List<Category>?>(null);
final Signal<List<Status>?> statusCSP = Signal<List<Status>?>(null);
final Signal<List<Priority>?> prioritiesCSP = Signal<List<Priority>?>(null);
final Signal<List<Roles>?> rolesCSP = Signal<List<Roles>?>(null);
final Signal<List<Frequency>?> frequencyCSP = Signal<List<Frequency>?>(null);
final Signal<List<TaskType>?> taskTypeCSP = Signal<List<TaskType>?>(null);
final Signal<String?> taskTypeSelectCSP = Signal<String?>(null);
final Signal<String> hourIniSelectCSP = Signal<String>('08:00');
final Signal<String> hourEndSelectCSP = Signal<String>('18:00');
final Signal<List<Taskperson>?> taskPersonsCSP = Signal<List<Taskperson>?>(null);
final Signal<List<int>> selectedPersonIdsCSP = Signal<List<int>>([]);
final Signal<Map<int, String?>> selectedPersonRolesCSP = Signal<Map<int, String?>>({});
final Signal<List<Taskperson>?> selecteFamilyCSP = Signal<List<Taskperson>?>(null);
final Signal<int?> selectedCategoryIdCSP = Signal<int?>(null);
final Signal<int?> selectedIdCSP = Signal<int?>(null);
final Signal<TaskElement?> selectedTaskUpdateCSP = Signal<TaskElement?>(null);
final Signal<int?> selectedPriorityIdCSP = Signal<int?>(null);
final Signal<int?> selectStateTaskCSP = Signal<int?>(null);
final Signal<String> frequencyTaskCSP = Signal<String>("");
final Signal<bool> isLoadingCSP = Signal<bool>(false); // Estado de carga
final Signal<bool> loadDataCSP = Signal<bool>(false); // Estado de carga
final Signal<String?> errorMessageCSP = Signal<String?>(null); // Mensaje de error
final Signal<String?> tittleTaskCSP = Signal<String?>(null); // Mensaje de error
final Signal<String?> descriptionTaskCSP = Signal<String?>(null); // Mensaje de error
final Signal<String?> geoLocationTaskCSP = Signal<String?>(null); // Mensaje de error
