import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/data/repository/tasks_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/tasks/tasks_signal.dart';
import 'package:huoon/domain/modelos/category_model.dart';

final tasksRepository = TasksRepository(authService: ApiService());

// Solicitar tareas por fecha
Future<void> fetchTasks(String date) async {
  taskElementUpdateTA.value = false;
  isLoadingTA.value = true;
  empyMessageTA.value = null;
  errorMessageTA.value = null;
  taskDataTA.value = null;
  try {
    final result = await tasksRepository.getTasksRepository(date);
    if (result is String) {
      empyMessageTA.value = result; //esta vacio
    } else if (result is Task) {
      taskDataTA.value = result; //tiene resultados
    }
  } catch (error) {
    errorMessageTA.value = "Error: ${error.toString()}";
  } finally {
    isLoadingTA.value = false;
  }
}

// Enviar tarea actualizada
Future<void> storeTask() async {
  isLoadingTA.value = true;
  try {
    await tasksRepository.addTasks(taskElementTA.value);
    successMessageTA.value = "Task submitted successfully!";
  } catch (error) {
    successMessageTA.value = "Error submitting task: ${error.toString()}";
  } finally {
    isLoadingTA.value = false;
  }
}

// Solicitar tareas por fecha
Future<void> updateTasks() async {
  isLoadingTA.value = true;
  try {
    await tasksRepository.updateTasksRepository(taskElementTA.value);
    successMessageTA.value = "Task update successfully!";
  } catch (error) {
    successMessageTA.value = "Error update task: ${error.toString()}";
  } finally {
    isLoadingTA.value = false;
  }
}

// Solicitar tareas por fecha
Future<void> deleteTasks(int id) async {
  isLoadingTA.value = true;
  try {
    await tasksRepository.deleteTasks(id);
    successMessageTA.value = "Task deleted successfully!";
  } catch (error) {
    successMessageTA.value = "Error deleted task: ${error.toString()}";
  } finally {
    isLoadingTA.value = false;
  }
}

// Actualizar título y descripción de la tarea
void updateTaskTitleDescription(String title, String description) {
  taskElementTA.value = taskElementTA.value.copyWith(title: title, description: description);
  taskElementUpdateTA.value = true;
}
// Actualizar título y descripción de la tarea
void updateTaskTitle(String title) {
  taskElementTA.value = taskElementTA.value.copyWith(title: title);
  taskElementUpdateTA.value = true;
}
// Actualizar título y descripción de la tarea
void updateTaskDescription(String description) {
  taskElementTA.value = taskElementTA.value.copyWith( description: description);
  taskElementUpdateTA.value = true;
}

// Actualizar título y descripción de la tarea
void updateTaskDateTime(String startDate, String endDate) {
  taskElementTA.value = taskElementTA.value.copyWith(startDate: startDate, endDate: endDate);
  taskElementUpdateTA.value = true;
}

// Actualizar prioridad de la tarea
void updateTaskPriority(int priorityId) {
  taskElementTA.value = taskElementTA.value.copyWith(priorityId: priorityId);
  taskElementUpdateTA.value = true;
} // Actualizar categoryId de la tarea

// Actualizar prioridad de la tarea
void updateTaskid(int id) {
  taskElementTA.value = taskElementTA.value.copyWith(id: id);
  taskElementUpdateTA.value = true;
} // Actualizar categoryId de la tarea

void updateTaskCategoryId(int categoryId) {
  taskElementTA.value = taskElementTA.value.copyWith(categoryId: categoryId);
  taskElementUpdateTA.value = true;
}

void updateTaskRecurrence(String recurrence) {
  taskElementTA.value = taskElementTA.value.copyWith(recurrence: recurrence);
  taskElementUpdateTA.value = true;
}

void updateTaskStatusId(int statusId) {
  taskElementTA.value = taskElementTA.value.copyWith(statusId: statusId);
  taskElementUpdateTA.value = true;
}

void updateTaskGeoLocation(String geoLocation) {
  taskElementTA.value = taskElementTA.value.copyWith(geoLocation: geoLocation);
  taskElementUpdateTA.value = true;
}

// Actualizar familiares asignados a la tarea
void updateTaskFamily(List<Person> familyMembers) {
  taskElementTA.value = taskElementTA.value.copyWith(people: familyMembers);
  taskElementUpdateTA.value = true;
}

List<Person> convertToPersonList(List<Taskperson> taskpersons) {
  return taskpersons.map((taskperson) {
    return Person(
        id: taskperson.id,
        name: taskperson.namePerson!, // Mapear namePerson a name
        image: taskperson.imagePerson!, // Mapear imagePerson a image
        roleId: taskperson.rolId!,
        roleName: taskperson.nameRole!);
  }).toList();
}

// Actualizar familiares asignados a la tarea
void dataEditTask(TaskElement taskElem) {
  onSelectedID(taskElem.id!);
  onTittleChanged(taskElem.title ?? '');
  onDescriptionChanged(taskElem.description ?? '');
  onPrioritySelected(taskElem.priorityId!);
  onCategorySelected(taskElem.categoryId!);
  onTaskStateSelected(taskElem.statusId!);
//onPersonSelected();
  // aqui se agregan los familiares
  updateTaskFamily(taskElem.people!);
  // onFamilySelected(taskElem.people!);
  onFrequencyChanged(taskElem.recurrence ?? '');
  onGeoLocationChanged(taskElem.geoLocation ?? '');
}

void clearTaskSignals() {
  // Restablecer las señales a sus valores predeterminados
  isLoadingTA.value = false;
  errorMessageTA.value = null;
  empyMessageTA.value = null;
  taskElementTA.value = const TaskElement(); // Usamos la constante de TaskElement vacía
  taskElementUpdateTA.value = false;
  taskDataTA.value = null;
  successMessageTA.value = "";
}
