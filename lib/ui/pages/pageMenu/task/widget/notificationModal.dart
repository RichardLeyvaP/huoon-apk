import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationModal extends StatefulWidget {
  final String date;
  final String hour;

  NotificationModal({required this.date, required this.hour});

  @override
  _NotificationModalState createState() => _NotificationModalState();
}

class _NotificationModalState extends State<NotificationModal> {
  int selectedIndex = 1; // Seleccionado por defecto (1 hora antes)
  DateTime? customDateTime;

  final List<String> options = [
    "1 día antes",
    "1 hora antes",
    "30 minutos antes",
    "En el momento de la tarea",
  ];

  final List<Duration> timeAdjustments = [
    Duration(days: -1),
    Duration(hours: -1),
    Duration(minutes: -30),
    Duration.zero,
  ];

  // Future<void> _selectCustomDateTime(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2100),
  //   );

  //   if (pickedDate != null) {
  //     final TimeOfDay? pickedTime = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay.now(),
  //     );

  //     if (pickedTime != null) {
  //       setState(() {
  //         customDateTime = DateTime(
  //           pickedDate.year,
  //           pickedDate.month,
  //           pickedDate.day,
  //           pickedTime.hour,
  //           pickedTime.minute,
  //         );
  //         selectedIndex = -1; // Indica que es personalizado
  //       });
  //     }
  //   }
  // }
  Future<void> _selectCustomDateTime(BuildContext context, String date, String hour) async { 
  // Convertir el String date a DateTime
  DateTime taskStartDate = DateTime.parse(date); 

  // Obtener la fecha actual sin la hora para comparación
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  // Mostrar el selector de fecha con restricciones
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: today.isBefore(taskStartDate) ? today : taskStartDate, // La menor de ambas
    firstDate: today, // No permitir fechas pasadas
    lastDate: taskStartDate, // No permitir después de la fecha de la tarea
  );

  if (pickedDate != null) {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        customDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        selectedIndex = -1; // Indica que es personalizado
      });
    }
  }
}

  @override
  Widget build(BuildContext context) {
    DateTime taskDateTime = DateTime.parse("${widget.date} ${widget.hour}");
    DateTime notificationDateTime = selectedIndex >= 0
        ? taskDateTime.add(timeAdjustments[selectedIndex])
        : customDateTime ?? taskDateTime;

    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Text(
                "¿Cuándo te gustaría recibir el recordatorio?",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            customDateTime = null;
                          });
                        },
                        child: Stack(
                          children: [
                            Card(
                              color: isSelected ? Colors.green[50] : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: isSelected ? Colors.green : Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    options[index],
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            if (isSelected)
                              Positioned(
                                top: 2,
                                right: 2,
                                child: Icon(Icons.check_circle, color: Colors.green, size: 20),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _selectCustomDateTime(context,widget.date,widget.hour),
                    child: Stack(
                      children: [
                        Card(
                          color: selectedIndex == -1 ? Colors.green[50] : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: selectedIndex == -1 ? Colors.green : Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Text(
                                customDateTime != null
                                    ? "Personalizado: ${DateFormat('dd/MM/yyyy HH:mm').format(customDateTime!)}"
                                    : "Personalizar",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        if (selectedIndex == -1)
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Icon(Icons.check_circle, color: Colors.green, size: 20),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     TextButton(
  onPressed: () {
    DateTime inputDateTime = DateTime.parse("${widget.date} ${widget.hour}"); // Combinar fecha y hora
    DateTime adjustedDateTime = inputDateTime.subtract(Duration(hours: 1)); // Restar 1 hora

    Navigator.pop(context, {
      "selectedOption": "Cancelar",
      "customDateTime": adjustedDateTime.toString(),
    });
  },
  child: Text("Cancelar"),
),

                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          final result = {
                            "selectedOption": selectedIndex == -1 ? "Personalizado" : options[selectedIndex],
                            "customDateTime": DateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(notificationDateTime),
                          };
                          Navigator.pop(context, result);
                        },
                        child: Text("Aceptar"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

