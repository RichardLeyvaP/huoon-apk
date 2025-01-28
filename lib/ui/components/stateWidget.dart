import 'package:flutter/material.dart';
import 'package:huoon/domain/modelos/projectModels.dart';

class StatusWidget extends StatefulWidget {
  final List<Status> status;
  final String? titleWidget;
  final bool selectMultiple;
  final bool fitTextContainer; //Permite controlar si el titulo es muy grande que se ajuste o no al container
  final bool eventDetails; //Permite activar o no el doble click y mostrar detalle
  final Function(List<Status>) onSelectionChanged; // Callback para devolver estados seleccionados
  final int? selectedStatusId; // ID del estado seleccionado

  const StatusWidget({
    Key? key,
    required this.status,
     this.titleWidget,
    this.selectMultiple = true,
    this.fitTextContainer = false,
    this.eventDetails = false,
    required this.onSelectionChanged,
    this.selectedStatusId, // ID del estado seleccionado
  }) : super(key: key);

  @override
  _StatusWidgetState createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  List<bool> selectedStatuses = [];

  @override
  void initState() {
    super.initState();
    selectedStatuses = List<bool>.filled(widget.status.length, false);

    // Establecer el estado inicial con el ID de estado seleccionado
    if (widget.selectedStatusId != null) {
      int selectedIndex = widget.status.indexWhere((status) => status.id == widget.selectedStatusId);
      if (selectedIndex != -1) {
        selectedStatuses[selectedIndex] = true; // Marcar el estado como seleccionado
      }
    }
  }

  void _notifySelection() {
    List<Status> selected = [];
    for (int i = 0; i < selectedStatuses.length; i++) {
      if (selectedStatuses[i]) {
        selected.add(widget.status[i]);
      }
    }
    widget.onSelectionChanged(selected); // Llamar al callback con los estados seleccionados
  }
   String getTitle(){
    return widget.titleWidget == null ? '':widget.titleWidget!;
     

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
                getTitle(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.status.length,
            itemBuilder: (context, index) {
              return _buildStatusContainer(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatusContainer(int index) {
    final status = widget.status[index];
    final isSelected = selectedStatuses[index];
    return GestureDetector(
      onLongPress: () {
        widget.eventDetails == true
            ? ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: const Color.fromARGB(172, 102, 145, 224),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getTitle(), style: const TextStyle(fontWeight: FontWeight.w900)),
                      Text(status.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                  duration: const Duration(milliseconds: 3000),
                ),
              )
            : null;
      },
      onTap: () {
        setState(() {
          if (widget.selectMultiple) {
            selectedStatuses[index] = !isSelected;
          } else {
            selectedStatuses = List<bool>.filled(selectedStatuses.length, false);
            selectedStatuses[index] = true;
          }
          _notifySelection(); // Notificar cuando se cambie la selección
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: widget.fitTextContainer == true ? null : 110, // Tamaño fijo para cada contenedor
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
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    status.icon,
                    size: 20,
                    color: isSelected ? Colors.green : Colors.grey[700],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status.title,
                    maxLines: widget.fitTextContainer == true ? null : 1, // Limitar a una línea
                    overflow:
                        widget.fitTextContainer == true ? null : TextOverflow.ellipsis, // Añadir puntos suspensivos
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
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
