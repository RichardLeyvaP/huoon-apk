import 'package:flutter/material.dart';

// Definir un tipo genérico para el widget
class SelectionWidget<T> extends StatefulWidget {
  final List<T> items; // Lista genérica de elementos
  final String titleWidget; 
  final bool selectMultiple; // Si se permiten múltiples selecciones
  final String Function(T) itemTitle; // Función para obtener el título del ítem
  final String Function(T) itemId; // Función para obtener el ID del ítem
  final Function(List<T>) onSelectionChanged; // Callback para devolver los elementos seleccionados
  final String? selectedItemId; // ID del ítem seleccionado

  const SelectionWidget({
    Key? key,
    required this.items,
    required this.titleWidget,
    required this.itemTitle,
    required this.itemId,
    required this.onSelectionChanged,
    this.selectMultiple = true,
    this.selectedItemId,
  }) : super(key: key);

  @override
  _SelectionWidgetState<T> createState() => _SelectionWidgetState<T>();
}

class _SelectionWidgetState<T> extends State<SelectionWidget<T>> {
  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    selectedItems = List<bool>.filled(widget.items.length, false);

    // Establecer el estado inicial con el ID del ítem seleccionado
    if (widget.selectedItemId != null) {
      int selectedIndex = widget.items.indexWhere((item) => widget.itemId(item) == widget.selectedItemId);
      if (selectedIndex != -1) {
        selectedItems[selectedIndex] = true; // Marcar el ítem como seleccionado
      }
    }
  }

  void _notifySelection() {
    List<T> selected = [];
    for (int i = 0; i < selectedItems.length; i++) {
      if (selectedItems[i]) {
        selected.add(widget.items[i]);
      }
    }
    widget.onSelectionChanged(selected); // Llamar al callback con los elementos seleccionados
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
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return _buildItemContainer(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildItemContainer(int index) {
    final item = widget.items[index];
    final isSelected = selectedItems[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.selectMultiple) {
            selectedItems[index] = !isSelected;
          } else {
            selectedItems = List<bool>.filled(selectedItems.length, false);
            selectedItems[index] = true;
          }
          _notifySelection(); // Notificar cuando se cambie la selección
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 130, // Tamaño fijo para cada contenedor
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
                    widget.itemTitle(item),
                    style: TextStyle(
                      fontSize: 12,
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
