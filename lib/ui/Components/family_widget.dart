import 'package:flutter/material.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:huoon/ui/pages/env.dart';

class TaskpersonWidget extends StatefulWidget {
  final List<Taskperson> taskpersons;
  final List<Taskperson>? selectTaskpersons;
  final List<Roles>? rolesList;
  final String titleWidget;
  final bool selectMultiple;
  final bool enableRoleSelection; // Nueva variable para habilitar la selección de rol
  final Function(List<Taskperson>, List<String>?)
      onSelectionChanged; // Cambiamos la función para incluir el rol seleccionado
  final int? selectedPersonId;

  const TaskpersonWidget({
    super.key,
    required this.taskpersons,
    this.selectTaskpersons,
    required this.titleWidget,
    this.selectMultiple = true,
    this.enableRoleSelection = false, // Valor por defecto
    required this.onSelectionChanged,
    this.selectedPersonId,
    this.rolesList,
  });

  @override
  _TaskpersonWidgetState createState() => _TaskpersonWidgetState();
}

class _TaskpersonWidgetState extends State<TaskpersonWidget> {
  List<bool> selectedPersons = [];
  List<String>? selectedRoles; // Lista para guardar los roles seleccionados

  @override
  void initState() {
    super.initState();
    selectedPersons = List<bool>.filled(widget.taskpersons.length, false);
    selectedRoles = List<String>.filled(widget.taskpersons.length, ''); // Inicializamos la lista de roles

    // Si hay una persona seleccionada, inicializar su estado
    if (widget.selectedPersonId != null) {
      int selectedIndex = widget.taskpersons.indexWhere((person) => person.id == widget.selectedPersonId);
      if (selectedIndex != -1) {
        selectedPersons[selectedIndex] = true;
      }
    }

    // Marca las personas de selectTaskpersons como seleccionadas
    if (widget.selectTaskpersons != null) {
      for (var selectedTaskperson in widget.selectTaskpersons!) {
        int index = widget.taskpersons.indexWhere((person) => person.id == selectedTaskperson.id);
        if (index != -1) {
          selectedPersons[index] = true;
        }
      }
    }
  }

  void _notifySelection() {
    List<Taskperson> selected = [];
    for (int i = 0; i < selectedPersons.length; i++) {
      if (selectedPersons[i]) {
        selected.add(widget.taskpersons[i]);
      }
    }
    print('Primera pagina de tareas-revisando a los familiares-${selected.length}');
    widget.onSelectionChanged(selected, selectedRoles); // Pasamos los roles seleccionados
  }

  Future<void> _showRoleSelectionDialogMultiple(
      BuildContext context, List<Taskperson> selectedTaskpersons, List<Roles> listRoles) async {
    List<Roles> roles = listRoles;

    // List<bool> selectedRoles = List<bool>.filled(roles.length, false);
    List<bool> selectedRoles =
        List<bool>.generate(roles.length, (index) => index == 0); // Selecciona el primer rol por defecto

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Selecciona un Rol',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: const Color.fromARGB(213, 0, 0, 0), fontSize: 20
                    // Cambia alguna propiedad aqui
                    ),
          ),
          content: Container(
            width: double.maxFinite,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: roles.map((role) {
                    int index = roles.indexOf(role);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // Cambia el estado del rol seleccionado
                          selectedRoles[index] = !selectedRoles[index];
                        });
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        color: selectedRoles[index] ? Colors.green[100] : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                role.nameRol,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: selectedRoles[index] ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                              if (selectedRoles[index]) Icon(Icons.check_circle, color: Colors.green),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                List<Roles> finalSelectedRoles = [];
                for (int i = 0; i < selectedRoles.length; i++) {
                  if (selectedRoles[i]) {
                    finalSelectedRoles.add(roles[i]);
                  }
                }

                // Si no hay roles seleccionados, simplemente cierra el diálogo
                if (finalSelectedRoles.isEmpty) {
                  Navigator.of(context).pop(); // Solo cierra el diálogo
                } else {
                  // Cierra el diálogo y notifica la selección
                  Navigator.of(context).pop();
                  // widget.onSelectionChanged(selectedTaskpersons, finalSelectedRoles);
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showRoleSelectionDialog(
      BuildContext context, List<Taskperson> selectedTaskpersons, List<Roles> listRoles) async {
    List<Roles> roles = listRoles;

    // Inicialmente, ningún rol está seleccionado
    int? selectedRoleIndex;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Selecciona un Rol',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: const Color.fromARGB(213, 0, 0, 0),
                  fontSize: 20,
                ),
          ),
          content: Container(
            width: double.maxFinite,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: roles.map((role) {
                    int index = roles.indexOf(role);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // Actualiza el índice del rol seleccionado
                          selectedRoleIndex = index;
                        });
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        color: selectedRoleIndex == index ? Colors.green[100] : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                role.nameRol,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: selectedRoleIndex == index ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                              if (selectedRoleIndex == index) Icon(Icons.check_circle, color: Colors.green),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (selectedRoleIndex != null) {
                  // Notifica el rol seleccionado si se eligió uno
                  Roles selectedRole = roles[selectedRoleIndex!];
                  // Aquí puedes hacer lo que necesites con `selectedRole`
                  print('Rol seleccionado: ${selectedRole.nameRol}');
                }
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titleWidget, style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3, //todo .....la longitud de los roles
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.selectMultiple) {
                        selectedPersons[index] = !selectedPersons[index];
                        print('Primera pagina de tareas-revisando a los familiares-${selectedPersons[index]}');
                      } else {
                        selectedPersons = List<bool>.filled(selectedPersons.length, false);
                        selectedPersons[index] = true;
                      }
                      if (widget.enableRoleSelection && selectedPersons[index] && widget.rolesList != null) {
                        _showRoleSelectionDialog(
                            context, widget.taskpersons, widget.rolesList!); // Muestra el diálogo si está habilitado
                      }
                      _notifySelection();
                    });
                  },
                  child: _buildTaskpersonContainer(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskpersonContainer(int index) {
    final person = widget.taskpersons[index];
    final isSelected = selectedPersons[index];

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('${Env.apiEndpoint}/images/${person.imagePerson!}'),
                  radius: 20,
                ),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      person.namePerson!,
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey[800], fontWeight: isSelected ? FontWeight.w900 : null),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      person.nameRole ?? 'Sin Rol.',
                      style: TextStyle(
                          fontSize: 10, color: Colors.grey[600], fontWeight: isSelected ? FontWeight.w900 : null),
                      textAlign: TextAlign.center,
                    ),
                  ],
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
    );
  }
}
