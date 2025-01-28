import 'package:flutter/material.dart';
import 'package:huoon/domain/modelos/projectModels.dart';

class PriorityWidget extends StatefulWidget {
  final List<Priority> priorities;
  final String titleWidget;
  final bool selectMultiple;
  final Function(List<Priority>) onSelectionChanged;
  final int? selectedPriorityId;

  const PriorityWidget({
    super.key,
    required this.priorities,
    required this.titleWidget,
    this.selectMultiple = true,
    required this.onSelectionChanged,
    this.selectedPriorityId,
  });

  @override
  _PriorityWidgetState createState() => _PriorityWidgetState();
}

class _PriorityWidgetState extends State<PriorityWidget> {
  List<bool> selectedPriorities = [];

  @override
  void initState() {
    super.initState();

    selectedPriorities = List<bool>.filled(widget.priorities.length, false);

    // Si hay una prioridad seleccionada, inicializar su estado
    if (widget.selectedPriorityId != null) {
      int selectedIndex = widget.priorities.indexWhere((priority) => priority.id == widget.selectedPriorityId);
      if (selectedIndex != -1) {
        selectedPriorities[selectedIndex] = true;
      }
    }
  }

  void _notifySelection() {
    List<Priority> selected = [];
    for (int i = 0; i < selectedPriorities.length; i++) {
      if (selectedPriorities[i]) {
        selected.add(widget.priorities[i]);
      }
    }
    widget.onSelectionChanged(selected);
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
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.priorities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.selectMultiple) {
                        selectedPriorities[index] = !selectedPriorities[index];
                      } else {
                        selectedPriorities = List<bool>.filled(selectedPriorities.length, false);
                        selectedPriorities[index] = true;
                      }
                      _notifySelection();
                    });
                  },
                  child: _buildPriorityContainer(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityContainer(int index) {
    final priority = widget.priorities[index];
    final isSelected = selectedPriorities[index];

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  priority.title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  priority.description,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
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
    );
  }
}
