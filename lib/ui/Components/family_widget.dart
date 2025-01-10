import 'package:flutter/material.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/blocs/tasks/tasks_service.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:huoon/ui/pages/env.dart';

class TaskpersonWidget extends StatefulWidget {
  final List<Taskperson> taskpersons;
  final List<Taskperson>? selectTaskpersons;
  final List<Roles>? rolesList;
  final String titleWidget;
  final bool selectMultiple;
  final bool enableRoleSelection;
  final Function(List<Taskperson>, List<String>?) onSelectionChanged;
  final int? selectedPersonId;

  const TaskpersonWidget({
    super.key,
    required this.taskpersons,
    this.selectTaskpersons,
    required this.titleWidget,
    this.selectMultiple = true,
    this.enableRoleSelection = false, 
    required this.onSelectionChanged,
    this.selectedPersonId,
    this.rolesList,
  });

  @override
  _TaskpersonWidgetState createState() => _TaskpersonWidgetState();
}

class _TaskpersonWidgetState extends State<TaskpersonWidget> {
  List<bool> selectedPersons = [];
  List<String>? selectedRoles = []; // Cambiado a List<String>? para coincidir con el tipo esperado por onSelectionChanged
  List<String> selectedRolesNew = []; // Cambiado a List<String>? para coincidir con el tipo esperado por onSelectionChanged
  
  @override
  void initState() {
    super.initState();
    selectedPersons = List<bool>.filled(widget.taskpersons.length, false);
    selectedRoles = List<String>.filled(widget.taskpersons.length, ''); // Inicializamos con cadenas vacías en lugar de null
    selectedRolesNew = List<String>.filled(widget.taskpersons.length, 'Sin Rol'); // Inicializamos con cadenas vacías en lugar de null

    if (widget.selectedPersonId != null) {
      int selectedIndex = widget.taskpersons.indexWhere((person) => person.id == widget.selectedPersonId);
      if (selectedIndex != -1) {
        selectedPersons[selectedIndex] = true;
        selectedRolesNew[selectedIndex]  = 'tiene rol1';
      }
      else{
        selectedRolesNew[selectedIndex]  = 'Sin Rol1';
      }
    }

    if (widget.selectTaskpersons != null) {
      for (var selectedTaskperson in widget.selectTaskpersons!) {
        int index = widget.taskpersons.indexWhere((person) => person.id == selectedTaskperson.id);
        if (index != -1) {
          selectedPersons[index] = true;
          selectedRolesNew[index]  = selectedTaskperson.nameRole ?? '';
        }
        else{
        selectedRolesNew[index]  = 'Sin Rol2';
        
        }
      }
    }
  }

  void _notifySelection() {
    List<Taskperson> selected = [];
    //clearPersonRoles();
    for (int i = 0; i < selectedPersons.length; i++) {
      if (selectedPersons[i]) {
       // togglePersonRole(widget.taskpersons[i].rolId!, widget.taskpersons[i].id, 1);
        selected.add(widget.taskpersons[i]);
        print('Estados seleccionados-${widget.taskpersons[i].id}');
      }
    }
    List<int> personIds = selected.map((taskperson) => taskperson.id).toList();
    List<int> rolIds = selected.map((taskperson) => taskperson.rolId!).toList();

    filterPersonRolesByIds(personIds,rolIds,1);
    widget.onSelectionChanged(selected, selectedRoles!.isEmpty ? null : selectedRoles); // Enviamos null si la lista está vacía
  }
Future<void> _showRoleSelectionDialog(
  BuildContext scaffoldContext, // Cambia el nombre para claridad
  Taskperson selectedTaskperson,
  List<Roles> listRoles,
  int index,
) async {
  List<Roles> roles = listRoles;
  int? selectedRoleIndex;

  showDialog(
    barrierDismissible: false, // Evita que se cierre al tocar fuera del diálogo
    context: scaffoldContext,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text(
          'Selecciona un Rol para ${selectedTaskperson.namePerson}',
          style: Theme.of(scaffoldContext).textTheme.displayMedium!.copyWith(
                color: const Color.fromARGB(213, 0, 0, 0),
                fontSize: 14,
              ),
        ),
        content: Container(
          width: double.maxFinite,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: roles.map((role) {
                  int roleIndex = roles.indexOf(role);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRoleIndex = roleIndex;
                      });
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: selectedRoleIndex == roleIndex
                          ? Colors.green[100]
                          : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              role.nameRol,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: selectedRoleIndex == roleIndex
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            if (selectedRoleIndex == roleIndex)
                              Icon(Icons.check_circle, color: Colors.green),
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
          // // Botón "Cancelar"
          // TextButton(
          //   onPressed: () {
              
          //     if (mounted) {
          //       setState(() {
          //         selectedPersons[index] = false; // Deselecciona el contenedor
          //         selectedRoles![index] = ''; // Limpia el rol seleccionado
          //       });
          //     }
          //     Navigator.of(dialogContext).pop();
          //   },
          //   child: Text('Cancelar'),
          // ),
          // Botón "Aceptar"
          TextButton(
            onPressed: () {
              if (selectedRoleIndex == null) {
                // Usa el contexto del Scaffold original
                ScaffoldMessenger.of(scaffoldContext)
  ..hideCurrentSnackBar() // Oculta el SnackBar actual si existe
  ..showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 200),
      content: Text(
        'Debes seleccionar al menos un rol.',
        style: TextStyle(fontSize: 18),
      ),
      backgroundColor: Colors.redAccent,
    ),
  );

              } else {
                // Si se selecciona un rol, actualiza y cierra el diálogo
                Roles selectedRole = roles[selectedRoleIndex!];
                if (mounted) {
                  setState(() {
                    selectedRoles![index] =
                        selectedRole.nameRol; // Guarda el rol seleccionado
                  });
                }
                _updatePersonRole(
                    index, selectedRole.nameRol, selectedRole.id);
                Navigator.of(dialogContext).pop();
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
                        selectedRoles![index] = '';
                      } else {
                        selectedPersons = List<bool>.filled(selectedPersons.length, false);//onFamilySelected(selected);
                        selectedPersons[index] = true;
                        selectedRoles![index] = '';

                        //
                      }
                      if (widget.enableRoleSelection &&
                          selectedPersons[index] &&
                          widget.rolesList != null) {
                        _showRoleSelectionDialog(
                          context,
                          widget.taskpersons[index],
                          widget.rolesList!,
                          index,
                        );
                      }
                      _notifySelection();
                    });
                  },
                  child: _buildTaskpersonContainer( index,index < widget.rolesList!.length? widget.rolesList![index].nameRol: 'NO', ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  void _updatePersonRole(int index, String? newRole, int idRole) {
  // Verifica si la lista selecteFamilyCSP tiene valor y contiene elementos
  if (selecteFamilyCSP.value != null && selecteFamilyCSP.value!.isNotEmpty) {
    // Encuentra la persona correspondiente en selecteFamilyCSP.value!
    Taskperson selectedPerson = selecteFamilyCSP.value!.firstWhere((person) => person.id == widget.taskpersons[index].id);
    
    // Actualiza el rol de la persona
    selectedPerson = Taskperson(
      id: selectedPerson.id,
      namePerson: selectedPerson.namePerson,
      imagePerson: selectedPerson.imagePerson,
      rolId: idRole,
      nameRole: newRole,  // Aquí actualizas el rol de la persona seleccionada
    );
    //aqui seria un modificar si esta 
    //togglePersonRole(idRole, selectedPerson.id,1);
    updateOrAddPersonRole(idRole, selectedPerson.id,1);

    // Actualiza la lista de selecteFamilyCSP con la persona modificada
    final updatedList = selecteFamilyCSP.value!
      ..removeWhere((person) => person.id == selectedPerson.id)
      ..add(selectedPerson);
      
    // Actualiza el valor de selecteFamilyCSP con la lista actualizada
    selecteFamilyCSP.value = updatedList;
  }
}


  Widget _buildTaskpersonContainer(int index,String roleNam) {
    final person = widget.taskpersons[index];
    final isSelected = selectedPersons[index];
    if(isSelected){
print('peronas selec sionadas:${person.namePerson} rol:${selectedRolesNew[index]}');

    // print('peronas selec sionadas-id:${person.id}');
    // print('peronas selec sionadas-rol:${selectedRoles![index]}');

    
    }
    

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
                    isSelected ?//si es seleccionado que muestre el rol con la tarea ---- taskDataTA
                    Text(//aqui en esta linea
                     selectedRoles![index].isEmpty ? selectedRolesNew[index].isEmpty ? person.nameRole! : selectedRolesNew[index]: selectedRoles![index], // Mostrar el rol seleccionado o 'Sin Rol.'
                      style: TextStyle(
                          fontSize: 10, color: Colors.grey[600], fontWeight: isSelected ? FontWeight.w900 : null),
                      textAlign: TextAlign.center,
                    )
                    :
                    Text(//aqui en esta linea
                      selectedRoles![index].isEmpty ? person.nameRole! : selectedRoles![index], // Mostrar el rol seleccionado o 'Sin Rol.'
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
