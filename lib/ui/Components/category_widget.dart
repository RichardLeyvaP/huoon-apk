import 'package:flutter/material.dart';
import 'package:huoon/domain/modelos/category_model.dart';

class CategoryWidget extends StatefulWidget {
  final List<Category> categories; //la lista de categorias
  final String titleWidget; //el titulo del widget
  final bool selectMultiple; //si se desea seleccionar uno o varios
  final bool fitTextContainer; //Permite controlar si el titulo es muy grande que se ajuste o no al container
  final bool eventDetails; //Permite activar o no el doble click y mostrar detalle
  final Function(List<Category>) onSelectionChanged; // Callback para devolver categorías seleccionadas
  final int? selectedCategoryId; // Agregar el ID de categoría seleccionada

  const CategoryWidget({
    super.key,
    required this.categories,
    required this.titleWidget,
    this.selectMultiple = true,
    this.fitTextContainer = false,
    this.eventDetails = false,
    required this.onSelectionChanged,
    this.selectedCategoryId, // Recibir el ID de categoría seleccionada
  });

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<bool> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    selectedCategories = List<bool>.filled(widget.categories.length, false);

    // Establecer el estado inicial con el ID de categoría seleccionada
    if (widget.selectedCategoryId != null) {
      int selectedIndex = widget.categories.indexWhere((category) => category.id == widget.selectedCategoryId);
      if (selectedIndex != -1) {
        selectedCategories[selectedIndex] = true; // Marcar la categoría como seleccionada
      }
    }
  }

  void _notifySelection() {
    List<Category> selected = [];
    for (int i = 0; i < selectedCategories.length; i++) {
      if (selectedCategories[i]) {
        selected.add(widget.categories[i]);
      }
    }
    widget.onSelectionChanged(selected); // Llamar al callback con las categorías seleccionadas
  }

  // Función para mostrar el modal
  void _showAddCategoryDialog() {
    // (El código del diálogo se mantiene igual)
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.titleWidget,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 10),
              // GestureDetector(
              //   onTap: _showAddCategoryDialog, // Muestra el modal al hacer clic
              //   child: const CircleAvatar(
              //     radius: 15,
              //     child: Icon(Icons.add),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 118, // Altura total del contenedor (dos filas)
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (widget.categories.length / 2).ceil(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: _buildCategoryContainer(index * 2),
                  ),
                  if ((index * 2) + 1 < widget.categories.length)
                    Expanded(
                      child: _buildCategoryContainer((index * 2) + 1),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryContainer(int index) {
    final category = widget.categories[index];
    final isSelected = selectedCategories[index];
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
                      Text(widget.titleWidget, style: const TextStyle(fontWeight: FontWeight.w900)),
                      Text(category.title, style: const TextStyle(fontWeight: FontWeight.w700)),
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
            selectedCategories[index] = !isSelected;
          } else {
            selectedCategories = List<bool>.filled(selectedCategories.length, false);
            selectedCategories[index] = true;
          }
          _notifySelection(); // Notificar cuando se cambie la selección

          // Despachar evento al Bloc
          // context.read<CategoriesPrioritiesBloc>().add(CategorySelectedEvent(category.id));
          // context.read<CategoriesStatePrioritiesBloc>().add(CategoryTaskSelectedEvent(category.id));
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
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    category.icon,
                    size: 20,
                    color: Colors.grey[700],
                  ),
                  Text(
                    category.title,
                    maxLines: widget.fitTextContainer == true ? null : 1, // Limitar a una línea
                    overflow:
                        widget.fitTextContainer == true ? null : TextOverflow.ellipsis, // Añadir puntos suspensivos
                    style: TextStyle(
                      fontSize: 10,
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

class IconItem {
  final IconData iconData;
  final String iconName;

  IconItem(this.iconData, this.iconName);
}
