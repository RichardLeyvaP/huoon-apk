import 'package:flutter/material.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/blocs/tasks/tasks_service.dart';
import 'package:huoon/ui/Components/button_custom.dart';
import 'package:huoon/ui/pages/rol-admin/Task/selectDays/utils.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';


class TimePickerModal extends StatefulWidget {
  final Function(String startTime, String endTime) onSelect;

  TimePickerModal({required this.onSelect});

  @override
  _TimePickerModalState createState() => _TimePickerModalState();
}

class _TimePickerModalState extends State<TimePickerModal> {

  TimeOfDay _startTime = TimeOfDay(hour: 8, minute: 0); // Hora inicial predeterminada
  TimeOfDay _endTime = TimeOfDay(hour: 18, minute: 0); // Hora final predeterminada

String formatTimeOfDay(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0'); // Asegura que la hora tenga 2 dígitos
  final minute = time.minute.toString().padLeft(2, '0'); // Asegura que los minutos tengan 2 dígitos
   
  return '$hour:$minute';

}


@override
void initState() {
  super.initState();
  _startTime = hourIniSelectCSP.value != '' && hourIniSelectCSP.value.isNotEmpty
      ? _parseTimeOfDay(hourIniSelectCSP.value)
      : TimeOfDay(hour: 8, minute: 0);

  _endTime = hourEndSelectCSP.value != '' && hourEndSelectCSP.value.isNotEmpty
      ? _parseTimeOfDay(hourEndSelectCSP.value)
      : TimeOfDay(hour: 18, minute: 0);
}

TimeOfDay _parseTimeOfDay(String timeString) {
  final parts = timeString.split(':');
  if (parts.length == 2) {
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts[1]) ?? 0;
    return TimeOfDay(hour: hour, minute: minute);
  }
  return TimeOfDay(hour: 0, minute: 0);
}



  void _selectTime(BuildContext context, bool isStartTime) async {
    final initialTime = isStartTime ? _startTime : _endTime;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime;
          // Validar que la hora final sea mayor a la inicial
          if (_endTime.hour < _startTime.hour ||
              (_endTime.hour == _startTime.hour && _endTime.minute < _startTime.minute)) {
            _endTime = TimeOfDay(hour: _startTime.hour + 1, minute: _startTime.minute);
          }
        } else {
          // Validar que la hora final no sea menor a la inicial
          if (pickedTime.hour > _startTime.hour ||
              (pickedTime.hour == _startTime.hour && pickedTime.minute > _startTime.minute)) {
            _endTime = pickedTime;
          } else {
           // Mostrar mensaje de error
showOverlayMessage(context, 'La hora final debe ser mayor a la hora inicial.');


          }
        }
      });
    }
    print('esta son las horas-HI:$_startTime');
    print('esta son las horas-HF:$_endTime');
    //aqui actualizar las variables de las horas
    onHourIniChanged(formatTimeOfDay(_startTime));
onHourEndChanged(formatTimeOfDay(_endTime));

updateTaskStartTime(formatTimeOfDay(_startTime));
updateTaskEndTime(formatTimeOfDay(_endTime));
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: 
      
      taskTypeSelectCSP.value == 'Evento'?
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          _buildTimeCard(
            context,
            title: 'Hora inicial',
            time: _startTime,
            onTap: () => _selectTime(context, true),
          ),
          SizedBox(height: 16),
          _buildTimeCard(
            context,
            title: 'Hora final',
            time: _endTime,
            onTap: () => _selectTime(context, false),
          ),
          SizedBox(height: 16),
          //boton
         CustomButton(
 onPressed: () {
   // Llama a la función pasada como parámetro y pasa los valores seleccionados
                widget.onSelect(
                  formatTimeOfDay(_startTime),
                  formatTimeOfDay(_endTime),
                );
   selctTime(context);//cerrar el modal
 },
  text: 'Seleccionar',
  backgroundColor: StyleGlobalApk.colorPrimary,
  textColor: Colors.white,
  width: 200,
  height: 50,
),


          SizedBox(height: 40),
        ],
      )
      :
       Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          _buildTimeCard(
            context,
            title: 'Hora inicial',
            time: _startTime,
            onTap: () => _selectTime(context, true),
          ),
          SizedBox(height: 16),
          //boton
        CustomButton(
 onPressed: () {
   // Llama a la función pasada como parámetro y pasa los valores seleccionados
                widget.onSelect(
                  formatTimeOfDay(_startTime),
                  formatTimeOfDay(_endTime),
                );
   selctTime(context);//cerrar el modal
 },
  text: 'Seleccionar',
  backgroundColor: StyleGlobalApk.colorPrimary,
  textColor: Colors.white,
  width: 200,
  height: 50,
),


          SizedBox(height: 40),
        ],
      )
      ,
    );
  }

  Widget _buildTimeCard(BuildContext context,
      {required String title, required TimeOfDay time, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.access_time, color: StyleGlobalApk.colorPrimary),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              time.format(context),
              style: TextStyle(fontSize: 16, color: StyleGlobalApk.colorPrimary),
            ),
          ],
        ),
      ),
    );
  }

  void selctTime(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context); // Cierra el modal si está abierto
  }
  // Aquí puedes agregar cualquier lógica adicional
  print("Modal cerrado y ejecutando lógica adicional");
}

}
