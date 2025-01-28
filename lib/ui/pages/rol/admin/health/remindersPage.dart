import 'package:flutter/material.dart';
import 'package:huoon/ui/util/utilsStyleGlobalApk.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:animate_do/animate_do.dart';

class RemindersPage extends StatefulWidget {
  @override
  _RemindersPageState createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  late Map<DateTime, List<String>> _events;
  late TextEditingController _eventController;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  int _notificationCount = 0; // Valor inicial de notificaciones.

  @override
  void initState() {
    super.initState();
    _events = {}; // Inicialmente sin eventos.
    _eventController = TextEditingController();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  void _addEvent() {
    if (_eventController.text.isNotEmpty) {
      setState(() {
        if (_events[_selectedDay] != null) {
          _events[_selectedDay]!.add(_eventController.text);
        } else {
          _events[_selectedDay] = [_eventController.text];
        }
        _notificationCount = _getEventCountForMonth(_focusedDay); // Actualiza el contador de notificaciones
      });
      _eventController.clear();
    }
  }

  void _deleteEvent(DateTime day, int index) {
    setState(() {
      _events[day]?.removeAt(index);
      _notificationCount = _getEventCountForMonth(_focusedDay); // Actualiza el contador de notificaciones
    });
  }

  int _getEventCountForMonth(DateTime date) {
    int count = 0;
    for (var entry in _events.entries) {
      if (entry.key.month == date.month && entry.key.year == date.year) {
        count += entry.value.length;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Column(
            children: [
              Text('Recordatorios', style: TextStyle(fontSize: 18, color: Colors.black)),
              Text('Gestiona tus recordatorios de salud',
                  style: TextStyle(fontSize: 10, color: Color.fromARGB(150, 0, 0, 0))),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: Icon(Icons.notifications_none, color: Colors.black),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: _notificationCount > 0
                      ? CircleAvatar(
                          radius: 10,
                          backgroundColor: StyleGlobalApk.getColorRedOpaque(),
                          child: Text(
                            _notificationCount.toString(),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(50, 158, 158, 158)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Calendar for selecting a day
            TableCalendar(
              firstDay: DateTime.utc(2020, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              eventLoader: (day) {
                return _events[day] ?? [];
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: StyleGlobalApk.getColorRedOpaque().withAlpha(80),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: StyleGlobalApk.getColorGreenBlue(),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            SizedBox(height: 20),
            // Event input section
            TextField(
              controller: _eventController,
              decoration: InputDecoration(
                hintText: 'Añadir recordatorio...',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add, color: StyleGlobalApk.getColorRedOpaque()),
                  onPressed: _addEvent,
                ),
              ),
            ),

            SizedBox(height: 20),
            // Event List for the selected day with animation
            Expanded(
              child: ListView.builder(
                itemCount: _events[_selectedDay]?.length ?? 0,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: 300),
                    child: GestureDetector(
                      onLongPress: () {
                        // Eliminar evento con una opción
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Eliminar Evento'),
                              content: Text('¿Deseas eliminar este evento?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Eliminar'),
                                  onPressed: () {
                                    _deleteEvent(_selectedDay, index);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(Icons.notifications, color: StyleGlobalApk.getColorRedOpaque()),
                          title: Text(_events[_selectedDay]![index]),
                          tileColor: StyleGlobalApk.getColorRedOpaque().withAlpha(80),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
