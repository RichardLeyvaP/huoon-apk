import 'package:flutter/material.dart';
import 'package:huoon/domain/modelos/category_model.dart';

class FrequencyWidget extends StatefulWidget {
  final List<Frequency> frequencies;
  final String titleWidget;
  final bool selectMultiple;
  final Function(List<Frequency>) onSelectionChanged; // Callback para devolver las frecuencias seleccionadas
  final int? selectedFrequencyId; // ID de la frecuencia seleccionada

  const FrequencyWidget({
    Key? key,
    required this.frequencies,
    required this.titleWidget,
    this.selectMultiple = true,
    required this.onSelectionChanged,
    this.selectedFrequencyId, // ID de la frecuencia seleccionada
  }) : super(key: key);

  @override
  _FrequencyWidgetState createState() => _FrequencyWidgetState();
}

class _FrequencyWidgetState extends State<FrequencyWidget> {
  List<bool> selectedFrequencies = [];

  @override
  void initState() {
    super.initState();
    selectedFrequencies = List<bool>.filled(widget.frequencies.length, false);

    // Establecer el estado inicial con el ID de la frecuencia seleccionada
    if (widget.selectedFrequencyId != null) {
      int selectedIndex = widget.frequencies.indexWhere((frequency) => frequency.id == widget.selectedFrequencyId);
      if (selectedIndex != -1) {
        selectedFrequencies[selectedIndex] = true; // Marcar la frecuencia como seleccionada
      }
    }
  }

  void _notifySelection() {
    List<Frequency> selected = [];
    for (int i = 0; i < selectedFrequencies.length; i++) {
      if (selectedFrequencies[i]) {
        selected.add(widget.frequencies[i]);
      }
    }
    widget.onSelectionChanged(selected); // Llamar al callback con las frecuencias seleccionadas
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
          height: 70, // Ajustar según sea necesario
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.frequencies.length,
            itemBuilder: (context, index) {
              return _buildFrequencyContainer(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFrequencyContainer(int index) {
    final frequency = widget.frequencies[index];
    final isSelected = selectedFrequencies[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.selectMultiple) {
            selectedFrequencies[index] = !isSelected;
          } else {
            selectedFrequencies = List<bool>.filled(selectedFrequencies.length, false);
            selectedFrequencies[index] = true;
          }
          _notifySelection(); // Notificar cuando se cambie la selección
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100, // Tamaño fijo para cada contenedor
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
                    frequency.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // const SizedBox(height: 8),
                  // Text(
                  //   frequency.description,
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     color: Colors.grey[600],
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
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
