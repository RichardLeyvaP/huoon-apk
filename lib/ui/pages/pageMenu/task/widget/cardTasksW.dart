import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/tasks/tasks_service.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';
import 'package:huoon/ui/Components/avatarMultiples.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CardTasks extends StatefulWidget {
  final int idTask;
  final String title;
  final IconData icon;
  final IconData iconPriority;
  final String date;
  final String details;
  final String location;
  final String schedule;
  final String namePriority;
  final Color colorPriority;
  final double iconSize;
  final Color iconColor;
  final double? padding;
  final double? radius;
  final List<Person> people;
  final TaskElement task;

  const CardTasks({
    super.key,
    required this.idTask,
    required this.title,
    required this.icon,
    required this.iconPriority,
    required this.date,
    required this.details,
    required this.location,
    required this.schedule,
    required this.namePriority,
    required this.colorPriority,
    required this.iconSize,
    required this.iconColor,
    required this.people,
    this.padding,
    this.radius,
    required this.task,
  });

  @override
  _CardTasksState createState() => _CardTasksState();
}

class _CardTasksState extends State<CardTasks> {
  bool isExpanded = true; // Controla la visibilidad del contenido expandido
  bool isOptionsVisible = false; // Controla si se muestran las opciones

  Future<void> handleNavigation() async {
    // Realiza todas las operaciones asíncronas primero.
    await fetchCategoriesStatusPriority();
    dataEditTask(widget.task);

    // Una vez que las tareas asíncronas han terminado, verifica si el widget sigue montado.
    if (mounted) {
      context.goNamed(
        'taskCreation',
        pathParameters: {'id': '${widget.idTask}'},
      );
      setState(() {
        isOptionsVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          isOptionsVisible = true;
        });
      },
      child: Stack(
        children: [
          // Card principal
          Card(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              width: double.infinity, // Ocupa el 100% del ancho disponible
              decoration: BoxDecoration(
                color: widget.iconColor.withOpacity(0.0), // Color de fondo del contenedor
                borderRadius: BorderRadius.circular(widget.radius ?? 20), // Esquinas redondeadas
                border: Border.all(
                  color: const Color.fromARGB(40, 158, 158, 158).withOpacity(0.28), // Color del borde
                  width: 2.0, // Grosor del borde
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.iconColor.withOpacity(0.1), // Sombra
                    spreadRadius: 1, // Asegura que la sombra esté en el borde
                    blurRadius: 6, // Difumina la sombra
                    offset: Offset(0, 0), // Posiciona la sombra en las 4 partes
                  ),
                ],
              ),
              child: Opacity(
                opacity: isOptionsVisible ? 0.2 : 1.0, // Opacidad para el modo opciones
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    width: double.infinity, // Ocupa el 100% del ancho disponible
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start, // Alineación superior
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        widget.title,
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      isExpanded
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isExpanded = false; // Mostrar detalles
                                                });
                                              },
                                              child: Icon(MdiIcons.chevronUp),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isExpanded = true; // Ocultar detalles
                                                });
                                              },
                                              child: Icon(MdiIcons.chevronDown),
                                            ),
                                    ],
                                  ),
                                  // Mostrar detalles solo si isExpanded es true
                                  if (isExpanded) Text(widget.details == '' ? 'No hay detalles' : widget.details),
                                ],
                              ),
                            ),
                            if (isExpanded) const SizedBox(width: 10), // Espacio entre el texto y el avatar

                            CircleAvatar(
                              backgroundColor: widget.iconColor,
                              child: Center(
                                child: Icon(
                                  widget.icon, // Reemplaza con el ícono que deseas
                                  size: 18, // Ajusta el tamaño del ícono
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (isExpanded) const SizedBox(height: 5),
                        if (isExpanded)
                          Row(
                            children: [
                              Icon(
                                widget.iconPriority,
                                color: widget.colorPriority,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.namePriority,
                                style: TextStyle(color: widget.colorPriority, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        if (isExpanded)
                          Row(
                            children: [
                              Icon(
                                MdiIcons.mapMarker,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.location == '' ? 'No hay ubicación' : widget.location,
                                style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        if (isExpanded) const SizedBox(height: 10),
                        if (isExpanded)
                          Container(
                            color: Colors.black12,
                            height: 1,
                            width: double.infinity, // Ocupa el 100% del ancho disponible
                          ),
                        if (isExpanded) const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Icon(MdiIcons.clockOutline),
                                  const SizedBox(width: 10),
                                  Text(
                                    widget.schedule,
                                    style: TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                            if (isExpanded)
                              Expanded(
                                child: AvatarMultiple(
                                    people: widget.people), // Reemplaza con tu widget de avatares múltiples
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Opciones superpuestas
          if (isOptionsVisible)
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildOptionButton(
                          icon: Icons.edit,
                          label: "Editar",
                          color: const Color.fromARGB(255, 16, 79, 131),
                          onPressed: () {
                            handleNavigation();
                          },
                        ),
                        _buildOptionButton(
                          icon: Icons.delete,
                          label: "Eliminar",
                          color: Colors.red,
                          onPressed: () async {
                            await deleteTasks(widget.idTask);
                            // Obtén la fecha seleccionada inicial desde getSelectedDate
                            String initialDateString = getSelectedDate();
                            // carga las tareas
                            fetchTasks(initialDateString);
                            updateTaskScreen('screen_Home_Tasks', initialDateString); //screen_Home_Tasks
                            // setState(() {
                            //   // task-destroy por post
                            //   isOptionsVisible = false;
                            // });

                            // Lógica de eliminación aquí
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          isOptionsVisible = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(width: 5),
                      isExpanded
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  isExpanded = false;
                                });
                              },
                              child: Icon(MdiIcons.chevronUp),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  isExpanded = true;
                                });
                              },
                              child: Icon(MdiIcons.chevronDown),
                            ),
                    ],
                  ),
                  if (isExpanded) Text(widget.details.isEmpty ? 'No hay detalles' : widget.details),
                ],
              ),
            ),
            if (isExpanded) const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: widget.iconColor,
              child: Center(
                child: Icon(widget.icon, size: 18),
              ),
            ),
          ],
        ),
        if (isExpanded) const SizedBox(height: 5),
        if (isExpanded)
          Row(
            children: [
              Icon(widget.iconPriority, color: widget.colorPriority),
              const SizedBox(width: 5),
              Text(
                widget.namePriority,
                style: TextStyle(color: widget.colorPriority, fontWeight: FontWeight.w900),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30, color: color),
          onPressed: onPressed,
        ),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}
