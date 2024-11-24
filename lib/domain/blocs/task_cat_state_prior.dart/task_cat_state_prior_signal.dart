import 'package:huoon/domain/modelos/category_model.dart';
import 'package:signals/signals.dart';

// Definir las señales
final Signal<List<Category>?> categoriesCSP = Signal<List<Category>?>(null);
final Signal<List<Status>?> statusCSP = Signal<List<Status>?>(null);
final Signal<List<Priority>?> prioritiesCSP = Signal<List<Priority>?>(null);
final Signal<List<String>?> frequencyCSP = Signal<List<String>?>(null);
final Signal<List<Taskperson>?> taskPersonsCSP = Signal<List<Taskperson>?>(null);
final Signal<List<int>> selectedPersonIdsCSP = Signal<List<int>>([]);
final Signal<int?> selectedCategoryIdCSP = Signal<int?>(null);
final Signal<int?> selectedPriorityIdCSP = Signal<int?>(null);
final Signal<int?> selectStateTaskCSP = Signal<int?>(null);
final Signal<String> frequencyTaskCSP = Signal<String>("");
final Signal<bool> isLoadingCSP = Signal<bool>(false); // Estado de carga
final Signal<bool> loadDataCSP = Signal<bool>(false); // Estado de carga
final Signal<String?> errorMessageCSP = Signal<String?>(null); // Mensaje de error
final Signal<String?> tittleTaskCSP = Signal<String?>(null); // Mensaje de error
final Signal<String?> descriptionTaskCSP = Signal<String?>(null); // Mensaje de error
final Signal<String?> geoLocationTaskCSP = Signal<String?>(null); // Mensaje de error
