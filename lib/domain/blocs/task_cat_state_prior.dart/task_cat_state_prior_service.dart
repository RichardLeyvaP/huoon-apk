import 'package:flutter/material.dart';
import 'package:huoon/data/repository/tasks_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/modelos/category_model.dart';

// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
final TasksRepository tasksRepository = TasksRepository(authService: ApiService());
// Método para solicitar categorías, prioridades y otras informaciones
Future<void> fetchCategoriesStatusPriority() async {
  isLoadingCSP.value = true; // Indicamos que está cargando
  errorMessageCSP.value = null;
  loadDataCSP.value = false;
  try {
    final jsonResponse = await tasksRepository.getCategoriesStatusPriority();

    // Mapeamos los resultados y los actualizamos en las señales
    List<Category> categoriesList = (jsonResponse['taskcategories'] as List<dynamic>).map((categoryJson) {
      return Category(
        title: categoryJson['nameCategory'],
        icon: _getCategoryIcon(categoryJson['nameCategory']),
        id: categoryJson['id'],
      );
    }).toList();

    List<Status> statusList = (jsonResponse['taskstatus'] as List<dynamic>).map((statusJson) {
      return Status(
        title: statusJson['nameStatus'],
        icon: _getCategoryIcon(statusJson['nameStatus']),
        id: statusJson['id'],
      );
    }).toList();

    List<Priority> prioritiesList = (jsonResponse['taskpriorities'] as List<dynamic>).map((priorityJson) {
      return Priority(
        title: priorityJson['namePriority'],
        description: priorityJson['descriptionPriority'],
        id: priorityJson['id'],
      );
    }).toList();

    List<Taskperson> taskpersonList = (jsonResponse['taskpeople'] as List<dynamic>).map((personJson) {
      return Taskperson(
        id: personJson['id'],
        imagePerson: personJson['imagePerson'],
        rolId: personJson['rolId'],
        namePerson: personJson['namePerson'],
        nameRole: personJson['nameRole'],
      );
    }).toList();

    List<int> taskPersonIds = taskpersonList.map((person) => person.id).toList();
    String taskRecurrence = jsonResponse['taskrecurrences'][0]; // Ejemplo
    print('aqui submitTask :${jsonResponse['taskrecurrences']}');
    List<dynamic> dynamicList = jsonResponse['taskrecurrences'];
    List<String> stringList = List<String>.from(dynamicList);
    // Actualizamos las señales con los datos obtenidos
    categoriesCSP.value = categoriesList;
    statusCSP.value = statusList;
    prioritiesCSP.value = prioritiesList;
    taskPersonsCSP.value = taskpersonList;
    selectedPersonIdsCSP.value = taskPersonIds;
    frequencyTaskCSP.value = taskRecurrence; //id
    frequencyCSP.value = stringList;
    loadDataCSP.value = true;
    print('aqui submitTask :${frequencyCSP.value}');
  } catch (error) {
    loadDataCSP.value = false;
    errorMessageCSP.value = "Error: ${error.toString()}"; // Si ocurre un error
  } finally {
    isLoadingCSP.value = false;
  }
}

// Método auxiliar para asignar íconos según el nombre de la categoría (puedes personalizar esto)
IconData _getCategoryIcon(String categoryName) {
  switch (categoryName.toLowerCase()) {
    case 'food':
      return Icons.fastfood;
    case 'cleaning':
      return Icons.cleaning_services;
    case 'electronics':
      return Icons.electrical_services;
    default:
      return Icons.category; // Un ícono genérico si no coincide
  }
}

void onPrioritySelected(int priorityId) {
  selectedPriorityIdCSP.value = priorityId;
}

void onCategorySelected(int categoryId) {
  selectedCategoryIdCSP.value = categoryId;
}

void onTaskStateSelected(int stateTaskId) {
  selectStateTaskCSP.value = stateTaskId;
}

void onPersonSelected(int personId) {
  final updatedPersonIds = List<int>.from(selectedPersonIdsCSP.value)..add(personId);
  selectedPersonIdsCSP.value = updatedPersonIds;
}

void onFrequencyChanged(String newFrequency) {
  frequencyTaskCSP.value = newFrequency;
}

void onTittleChanged(String tittle) {
  tittleTaskCSP.value = tittle;
}

void onDescriptionChanged(String description) {
  descriptionTaskCSP.value = description;
}

void onGeoLocationChanged(String geoLocation) {
  geoLocationTaskCSP.value = geoLocation;
}

void clearCategoryStatusPrioritySignals() {
  // Restablecer las señales a sus valores predeterminados
  categoriesCSP.value = null;
  statusCSP.value = null;
  prioritiesCSP.value = null;
  taskPersonsCSP.value = null;
  selectedPersonIdsCSP.value = [];
  selectedCategoryIdCSP.value = null;
  selectedPriorityIdCSP.value = null;
  selectStateTaskCSP.value = null;
  frequencyTaskCSP.value = "";
  isLoadingCSP.value = false;
  loadDataCSP.value = false;
  errorMessageCSP.value = null;
}
