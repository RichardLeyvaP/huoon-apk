import 'package:flutter/material.dart';
import 'package:huoon/domain/modelos/category_model.dart';

class TaskTypeWidget extends StatefulWidget {
  final List<TaskType> taskTypes; // Lista de TaskType
  final String titleWidget; // Título del widget
  final bool selectMultiple; // Si se pueden seleccionar múltiples
  final Function(List<TaskType>) onSelectionChanged; // Callback para devolver las tareas seleccionadas
  final String? selectedTaskTypeId; // ID de la tarea seleccionada

  const TaskTypeWidget({
    Key? key,
    required this.taskTypes,
    required this.titleWidget,
    this.selectMultiple = true,
    required this.onSelectionChanged,
    this.selectedTaskTypeId, // ID de la tarea seleccionada
  }) : super(key: key);

  @override
  _TaskTypeWidgetState createState() => _TaskTypeWidgetState();
}

class _TaskTypeWidgetState extends State<TaskTypeWidget> {
  List<bool> selectedTaskTypes = [];

  @override
  void initState() {
    super.initState();
    selectedTaskTypes = List<bool>.filled(widget.taskTypes.length, false);

    // Establecer el estado inicial con el ID de la tarea seleccionada
    if (widget.selectedTaskTypeId != null) {
      int selectedIndex = widget.taskTypes.indexWhere((taskType) => taskType.id == widget.selectedTaskTypeId);
      if (selectedIndex != -1) {
        selectedTaskTypes[selectedIndex] = true; // Marcar la tarea como seleccionada
      }
    }
  }

  void _notifySelection() {
    List<TaskType> selected = [];
    for (int i = 0; i < selectedTaskTypes.length; i++) {
      if (selectedTaskTypes[i]) {
        selected.add(widget.taskTypes[i]);
      }
    }
    widget.onSelectionChanged(selected); // Llamar al callback con las tareas seleccionadas
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.titleWidget,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60, // Ajustar según sea necesario
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.taskTypes.length,
            itemBuilder: (context, index) {
              return _buildTaskTypeContainer(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTaskTypeContainer(int index) {
    final taskType = widget.taskTypes[index];
    final isSelected = selectedTaskTypes[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.selectMultiple) {
            selectedTaskTypes[index] = !isSelected;
          } else {
            selectedTaskTypes = List<bool>.filled(selectedTaskTypes.length, false);
            selectedTaskTypes[index] = true;
          }
          _notifySelection(); // Notificar cuando se cambie la selección
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 120, // Tamaño fijo para cada contenedor
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? Colors.green : Colors.grey,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    taskType.name, // Mostrar el nombre de la tarea
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          if (isSelected)
            const Positioned(
              top: 5,
              right: 5,
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
            ),
        ],
      ),
    );
  }
}


