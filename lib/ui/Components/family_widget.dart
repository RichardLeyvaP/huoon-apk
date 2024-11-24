import 'package:flutter/material.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:huoon/ui/pages/env.dart';

class TaskpersonWidget extends StatefulWidget {
  final List<Taskperson> taskpersons;
  final List<String>? rolesList;
  final String titleWidget;
  final bool selectMultiple;
  final bool enableRoleSelection; // Nueva variable para habilitar la selección de rol
  final Function(List<Taskperson>, List<String>?)
      onSelectionChanged; // Cambiamos la función para incluir el rol seleccionado
  final int? selectedPersonId;

  const TaskpersonWidget({
    super.key,
    required this.taskpersons,
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
  }

  void _notifySelection() {
    List<Taskperson> selected = [];
    for (int i = 0; i < selectedPersons.length; i++) {
      if (selectedPersons[i]) {
        selected.add(widget.taskpersons[i]);
      }
    }
    widget.onSelectionChanged(selected, selectedRoles); // Pasamos los roles seleccionados
  }

  Future<void> _showRoleSelectionDialog(
      BuildContext context, List<Taskperson> selectedTaskpersons, List<String> listRoles) async {
    List<String> roles = listRoles;

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
                                role,
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
                List<String> finalSelectedRoles = [];
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
                  widget.onSelectionChanged(selectedTaskpersons, finalSelectedRoles);
                }
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
              itemCount: widget.taskpersons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.selectMultiple) {
                        selectedPersons[index] = !selectedPersons[index];
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
















// import 'package:flutter/material.dart';
// import 'package:myhome/domain/modelos/category_model.dart';

// class TaskpersonWidget extends StatefulWidget {
//   final List<Taskperson> taskpersons;
//   final String titleWidget;
//   final bool selectMultiple;
//   final Function(List<Taskperson>) onSelectionChanged;
//   final int? selectedPersonId;

//   const TaskpersonWidget({
//     super.key,
//     required this.taskpersons,
//     required this.titleWidget,
//     this.selectMultiple = true,
//     required this.onSelectionChanged,
//     this.selectedPersonId,
//   });

//   @override
//   _TaskpersonWidgetState createState() => _TaskpersonWidgetState();
// }

// class _TaskpersonWidgetState extends State<TaskpersonWidget> {
//   List<bool> selectedPersons = [];

//   @override
//   void initState() {
//     super.initState();
//     selectedPersons = List<bool>.filled(widget.taskpersons.length, false);

//     // Si hay una persona seleccionada, inicializar su estado
//     if (widget.selectedPersonId != null) {
//       int selectedIndex = widget.taskpersons.indexWhere((person) => person.id == widget.selectedPersonId);
//       if (selectedIndex != -1) {
//         selectedPersons[selectedIndex] = true;
//       }
//     }
//   }

//   void _notifySelection() {
//     List<Taskperson> selected = [];
//     for (int i = 0; i < selectedPersons.length; i++) {
//       if (selectedPersons[i]) {
//         selected.add(widget.taskpersons[i]);
//       }
//     }
//     widget.onSelectionChanged(selected);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(widget.titleWidget, style: Theme.of(context).textTheme.bodyLarge),
//           SizedBox(
//             height: 80,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: widget.taskpersons.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (widget.selectMultiple) {
//                         selectedPersons[index] = !selectedPersons[index];
//                       } else {
//                         selectedPersons = List<bool>.filled(selectedPersons.length, false);
//                         selectedPersons[index] = true;
//                       }
//                       _notifySelection();
//                     });
//                   },
//                   child: _buildTaskpersonContainer(index),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTaskpersonContainer(int index) {
//     final person = widget.taskpersons[index];
//     final isSelected = selectedPersons[index];

//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           // width: 100,
//           margin: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(
//               color: isSelected ? Colors.green : Colors.grey,
//               width: 2,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 4,
//                 offset: const Offset(2, 2),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(person.imagePerson),
//                   radius: 20,
//                 ),
//                 const SizedBox(width: 6),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       person.namePerson,
//                       style: TextStyle(
//                           fontSize: 12, color: Colors.grey[800], fontWeight: isSelected ? FontWeight.w900 : null),
//                       textAlign: TextAlign.center,
//                     ),
//                     Text(
//                       person.nameRole,
//                       style: TextStyle(
//                           fontSize: 10, color: Colors.grey[600], fontWeight: isSelected ? FontWeight.w900 : null),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (isSelected)
//           const Positioned(
//             top: 5,
//             right: 5,
//             child: Icon(
//               Icons.check_circle,
//               color: Colors.green,
//               size: 24,
//             ),
//           ),
//       ],
//     );
//   }
// }
