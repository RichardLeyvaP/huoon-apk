import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/domain/blocs/login_bloc/login_signal.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/blocs/tasks/tasks_service.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:huoon/ui/Components/category_widget.dart';
import 'package:huoon/ui/Components/family_widget.dart';
import 'package:huoon/ui/Components/frequency_widget.dart';
import 'package:huoon/ui/Components/priority_widget.dart';
import 'package:huoon/ui/Components/state_widget.dart';
import 'package:huoon/ui/pages/rol-admin/product/startProductPage.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskChatPage extends StatefulWidget {
  @override
  _TaskChatPageState createState() => _TaskChatPageState();
}

class _TaskChatPageState extends State<TaskChatPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final Map<String, String> _taskData = {};
  int _currentStep = 0;
  bool _isTyping = false;
  int _isTypingTime = 1;

  int? _editingMessageIndex;
  String? _editingMessageKey = 'vacio';

  bool _showInputField = true;
  bool _isFinalStepReached = false;

  final List<Map<String, String>> _conversationSteps = [
    
  {'key': 'title', 'message': 'Empecemos, ¿me puedes dar el título de la tarea? ✍️', 'hint': 'Título de la tarea'},
  {'key': 'description', 'message': 'Perfecto. Ahora, ¿puedes darme una breve descripción? 📝', 'hint': 'Descripción de la tarea'},
  {'key': 'category', 'message': '¿A qué categoría pertenece esta tarea? 📂', 'hint': ''},
  {'key': 'status', 'message': '¿Qué estado tendría? ✅', 'hint': ''},
  {'key': 'priority', 'message': '¡Muy bien! ¿Ahora qué prioridad le das a esta tarea? 🔥⬆️', 'hint': ''},
  {'key': 'frequencie', 'message': 'Escoge la Frecuencia que deseas darle 📝', 'hint': ''},

  {'key': 'family', 'message': '¡Ya estamos terminando! ¿Qué familiar va a participar en la tarea? 👨‍👩‍👧‍👦', 'hint': ''},
  {'key': 'calendar', 'message': '¡Solo falta la fecha de Inicio y Final! 👏👏', 'hint': ''},


    

    {'key': 'done', 'message': '¡Genial! He registrado todos los datos. ¿Quieres guardar la tarea?', 'hint': 'Confirmar tarea'}
    //ENVIANDO A INSERTAR
        // await storeTask();
  ];

  List<int> arrayCategory = [1];
   // Variable para manejar las prioridades seleccionadas
  List<Priority> selectedPriorities = [];
   int selectedPriority = 0;

    List<Taskperson> selectedTaskpersons = [];
  List<String>? selectedRoles; // Para almacenar los roles seleccionados

  void _onSelectionChanged(List<Taskperson> selected, List<String>? roles) {
    FocusScope.of(context).unfocus();
    List<Person> persons = convertToPersonList(selected);
    
    // print('Primera pagina de tareas-seleccionando nuevas personas-$persons');
    // print('Primera pagina de tareas-seleccionando nuevas personas-2${selected.first.namePerson}');
    // Eliminar todos los mensajes con 'key' igual a 'family_user'
  String nombres = selected.map((person) => person.namePerson).join(', ');
  final existingIndex = _messages.indexWhere((message) => message['key'] == 'family_user');
    setState(()  {
      _isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'family_user',
      'text': nombres,
      'sender': 'user',

    };
  } else {
      _handleUserSessions(nombres,'family_user');
  
  }
  });

// aqui se agregan los familiares
    //updateTaskFamily(persons);
    onFamilySelected(selected);
  }

   List<Person> convertToPersonList(List<Taskperson> taskpersons) {
    return taskpersons.map((taskperson) {
      return Person(
        id: taskperson.id,
        name: taskperson.namePerson!, // Mapear namePerson a name
        image: taskperson.imagePerson!, // Mapear imagePerson a image
        //roleId: taskperson.rolId!,
        //roleName: taskperson.nameRole!
      );
    }).toList();
  }

  //**variables del dataTimer */

  
  int selectedLevel = 0; // Para seleccionar el nivel
  Color colorBotoom = const Color.fromARGB(255, 61, 189, 93);
  Color colorBotoomSel = const Color.fromARGB(255, 199, 64, 59);

  String getRecurrence(int index) {
    String _recurrence = 'Diaria';
    if (selectedLevel == index) {
      _recurrence = 'Semanal';
    } else if (selectedLevel == index) {
      _recurrence = 'Mensual';
    } else if (selectedLevel == index) {
      _recurrence = 'Anual';
    }
    return _recurrence;
  }

  DateTime _focusedDay = DateTime.now();
DateTimeRange? _selectedDateRange;
TimeOfDay? _startTime;
TimeOfDay? _endTime;
 
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;

  static final kFirstDay = DateTime(2020, 1, 1);
  static final kLastDay = DateTime(2030, 12, 31);

  // Selección de horas
  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      confirmText: 'Aceptar',
    );
    if (pickedTime != null) {
      setState(() {
        if (isStart) {
          print('selcct dataHora-$_startTime');
          _startTime = pickedTime;
        } else {
          _endTime = pickedTime;
          print('selcct dataHora-F$_endTime');
        }
      });
    }
  }

  // Formato completo con fecha y hora, imprime por separado
  String _formatDateTime(DateTime date, TimeOfDay? time) {
    if (time == null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      print('Fecha seleccionada: $formattedDate'); // Imprimir solo la fecha
      return DateFormat('yyyy-MM-dd').format(date);
    } else {
      final DateTime dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);

      // Formateamos por separado
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      String formattedTime = DateFormat('HH:mm:ss').format(dateTime);

      // Imprimimos fecha y hora por separado
      print('ffff-Fecha seleccionada: $formattedDate');
      print('ffff-Hora seleccionada: $formattedTime');

      return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    }
  }

  String tittle = 'Crear Tarea';

  //**variables del dataTimer */
bool isActive = true; // Variable para alternar colores
int isActive2seg = 1; // Variable para alternar colores
Timer? _timer;

  @override
  void initState() {
    super.initState();
    _showInitialMessages();
    // Iniciar un temporizador que cambie el estado cada 2 segundos
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) { // Verifica si el widget sigue montado
    //verifico si ya pasaron 10segundos le mando un mensaje
    
    if(_isTypingTime == 30)//si e sfalse mando un mensaje
    {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('👋 Hola! ${currentUserLG.value!.userName} 😊 Estamos esperando una respuesta para continuar...'),

        duration: Duration(seconds: 3), // Duración del SnackBar
       
      ),
    );
      _isTypingTime=1;

    }
    else{
      _isTypingTime++;
    }


      if(isActive2seg == 5)
      {
        isActive2seg = 1;

        setState(() {
        isActive = false; // Cambiar entre activo e inactivo
      });

      }
     else
    {
      if(isActive == false)
      {
        setState(() {
        isActive = true; // Cambiar entre activo e inactivo
      });

      }       
      isActive2seg++;
    }
    }

    });
  
  }

  
  @override
  void dispose() {
    _textController.dispose();
    _timer?.cancel(); // Cancela el Timer
    super.dispose();
  }

  void _showInitialMessages() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
     
      _messages.add({'key': 'init','text': '👋 Hola! ${currentUserLG.value!.userName}. Te ayudaremos a crear una nueva tarea.', 'sender': 'bot'});
    });
    await Future.delayed(Duration(milliseconds: 1500));
    _simulateResponse();
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 
      
      Column(
        children: [
          Row(
            children: [
              Stack(
            children: [
              CircleAvatar(
          backgroundColor: const Color.fromARGB(100, 106, 105, 105),
          radius: 30, // Define el tamaño del CircleAvatar
          child: ClipOval(
            child: Image.asset(
              'assets/images/icon-Huoon.jpg', // Ruta de tu imagen en los assets
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
              ),
              Positioned(
          bottom: 5, // Ajusta la posición vertical del punto
          right: 5,  // Ajusta la posición horizontal del punto
          child: Container(
            width: 12, // Tamaño del punto verde
            height: 12, 
            decoration: BoxDecoration(
              color: isActive ? Colors.green :  Colors.white, // Color del punto verde
              shape: BoxShape.circle, // Forma circular
              border: Border.all(
                color: Colors.white, // Borde blanco para destacar
                width: 2,
              ),
            ),
          ),
              ),
            ],
          ),
          
          const SizedBox(width: 15,),
                
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HUOON',style: TextStyle(height: 1.2,fontSize: 18,fontWeight:FontWeight.bold,color: Colors.black ),),
                  Text('Creando Tarea',style: TextStyle(height: 1.2,fontSize: 12,color: Color.fromARGB(120, 0, 0, 0) ),),
          
                ],
              ),
              
            ],
          ),
       const Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(30, 158, 158, 158)),
        ],
      )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Invertir el orden de la lista
              padding: EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                bool isUser = message['sender'] == 'user';
                  bool isUserUpdateMens = false;
                if(message['key'] != null)
                {
                  isUserUpdateMens =  message['key'] == 'category_user' || 
                  message['key'] == 'status_user' ||
                   message['key'] == 'priority_user' || 
                   message['key'] == 'frequencie_user' || 

                   message['key'] == 'family_user';//
                }
                


                //saber en que paso estoy para saber que componente mostrar
                String? keyMessage;
                if(message['key'] != null) {
                   keyMessage = message['key'] ;
                }

                return GestureDetector(
                  onLongPress: isUser && !isUserUpdateMens  ? () {                    
                    _showEditOption(index);
                  } : null,
                  child: Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: 
                      showWidget(message,keyMessage,isUser) ,
                      
                     
                    
                  ),
                );
              },
            ),
          ),
          if (_isTyping)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text('Escribiendo...',style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          if (_showInputField ) _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    String hint = _currentStep < _conversationSteps.length
        ? _conversationSteps[_currentStep]['hint'] ?? ''
        : '';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onSubmitted: _handleUserInput,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleUserInput(_textController.text),
          ),
        ],
      ),
    );
  }

  void _handleUserInput(String input) {
    if (_currentStep >= _conversationSteps.length || input.isEmpty) return;

    // Guardar datos
      final currentStepKey = _conversationSteps[_currentStep]['key'];
      print('imprimir aqui que es lo que va a guardar---$currentStepKey');
      if((currentStepKey != 'category' && currentStepKey != 'status' &&
                    currentStepKey != 'priority' && 
                   currentStepKey != 'frequencie'  &&

                  currentStepKey != 'family') || _editingMessageKey == null )//si no es ninguno de estos que selecciona si puede modificar e insertar
      {
         if (_editingMessageIndex != null) {
      // Editar mensaje existente
      setState(() {
         _editingMessageKey = 'vacio';
        _isTypingTime = 1;
        _messages[_editingMessageIndex!] = {'text': input, 'sender': 'user'};
        _editingMessageIndex = null;
        _showInputField = !_isFinalStepReached; // Ocultar solo si se alcanzó el paso final
      });
    } else {
      // Nuevo mensaje
      setState(() {
        _isTypingTime = 1;
        _messages.insert(0, {'text': input, 'sender': 'user'}); // Insertar al inicio
      });

      
//     title
// description
// category
// status
// priority
// frequencie
// family
// calendar
      if(currentStepKey == 'title')
    {
      updateTaskTitle(input); //updateTaskDescription
    }

    else if(currentStepKey == 'description')
    {
      updateTaskDescription(input); //updateTaskDescription
    }
      if (currentStepKey != 'done') {
        _taskData[currentStepKey!] = input;
      }

      _textController.clear();
      _currentStep++;

      if (_currentStep < _conversationSteps.length) {
        _simulateResponse();
      } else {
        print('Datos de la tarea: $_taskData');
        _isFinalStepReached = true;
        _showInputField = false; // Ocultar el campo de texto al finalizar
      }
    }
    

      }
      _textController.clear();

   
  }

  void _handleUserSessions(String input,String key) {
    if (_currentStep >= _conversationSteps.length || input.isEmpty) return;

      // Nuevo mensaje
      setState(() {
        _messages.insert(0, {'key': key,'text': input, 'sender': 'user'}); // Insertar al inicio
      });

      // Guardar datos
      final currentStepKey = _conversationSteps[_currentStep]['key'];     
        _taskData[currentStepKey!] = input;  
        
     // _textController.clear();
      _currentStep++;

      if (_currentStep < _conversationSteps.length) {
        _simulateResponse();
      } else {
        print('Datos de la tarea: $_taskData');
        _isFinalStepReached = true;
        _showInputField = false; // Ocultar el campo de texto al finalizar
      }
    
   // _textController.clear();
  }

  void _simulateResponse() async {
    setState(() {

      _isTyping = true;
      _isTypingTime = 1;

    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isTyping = false;
      final message = _conversationSteps[_currentStep]['message'];
      final key = _conversationSteps[_currentStep]['key'];


      if (_currentStep == _conversationSteps.length - 1) {
        _messages.insert(0, {
          'key': key!,
          'text': message!,
          'sender': 'bot',
          'buttons': true
        });
      } else {
        _messages.insert(0, {'key': key!,'text': message!, 'sender': 'bot'});
      }
    });
  }

  void _showEditOption(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Editar mensaje'),
        content: Text('¿Quieres editar este mensaje?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _startEditing(index);
            },
            child: Text('Sí'),
          ),
        ],
      ),
    );
  }
  
  void _showConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar'),
        content: Text('Si cancelas se perderan todos los datos insertados'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
             
              //cierro todo
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  void _startEditing(int index) {
    setState(() {
      _editingMessageIndex = index;
      _textController.text = _messages[index]['text'];
      _editingMessageKey = _messages[index]['key'];
      _showInputField = true; // Mostrar el campo de texto al editar
      //_isTypingTime = 1;
    });
  }

  void _handleConfirmation(bool isSave) async {
    if(!isSave)
    {
      _showConfirmation();
    }
    

   else 
    {
       eventDate();

   // await Future.delayed(Duration(seconds: 3));
    //ENVIAR DATOS A LA API
    
    await storeTask();

    GoRouter.of(context).go(
      '/HomePrincipal',
      extra: {
        'name': '',
        'email': '',
        'avatarUrl': '',
      },
    );

    }
   

   
  }
   
    void eventDate() {
    //mandar la fecha
    if (_selectedDateRange == null) //si el rango es null que coja la fecha actual
    {
      // Si _selectedDateRange es null, asignamos la fecha actual como inicio y fin.
      final DateTime startDate = _selectedDateRange?.start ?? DateTime.now();
      final DateTime endDate = _selectedDateRange?.end ?? DateTime.now();

      // Si _startTime es null, asignamos las 7:00 AM como hora predeterminada.
      final TimeOfDay startTime = _startTime ?? TimeOfDay(hour: 7, minute: 0);

// Si _endTime es null, asignamos las 6:00 PM como hora predeterminada.
      final TimeOfDay endTime = _endTime ?? TimeOfDay(hour: 18, minute: 0);

      updateTaskDateTime(_formatDateTime(startDate, startTime), _formatDateTime(endDate, endTime));
    } else {
      updateTaskDateTime(
          _formatDateTime(_selectedDateRange!.start, _startTime), _formatDateTime(_selectedDateRange!.end, _endTime));
    }
  }
 
  
 Widget showWidget(Map<String, dynamic> message, String? keyMessage, bool isUser) {
  print('este es el Key de la tarea-$keyMessage');
 Widget showWidgetOption;
 if(message['buttons'] == null)//aun no es el final
 {
   if( message['end'] != null)
   {
   showWidgetOption = Column(
                            children: [
                              CircularProgressIndicator(strokeWidth: 1),
                              
                              Text(message['text'] ?? ''),
                            ],
                          );

   }
   else
   {
    if( keyMessage =='category')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
          _buildCategorySection(),

        ],
      );

    }
    else if( keyMessage =='status')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildStatusSection(),

        ],
      );//priority
         }
          else if( keyMessage =='priority')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildPrioritySection(),

        ],
      );//_buildFamilySection
         }
          else if( keyMessage =='family')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildFamilySection(),

        ],
      );//_buildFamilySection
         }
         
          else if( keyMessage =='calendar')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildCalendarSection(),

        ],
      );//_buildRecurrenceSection
         }
            else if( keyMessage =='frequencie')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildRecurrenceSection(),

        ],
      );//
         }
    else {
      showWidgetOption = Text(message['text'] ?? '');
    }

   }

 }
 else //ya lleg[o al final y esta el cancelar o guardar
 {
 showWidgetOption = Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(message['text'] ?? ''),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => _handleConfirmation(false),
                                      child: Text('Cancelar'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => _handleConfirmation(true),
                                      child: Text('Guardar'),
                                    ),
                                  ],
                                ),
                              ],
                            );

 }
 return 
                        Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.blue[100] : Colors.grey[300],
                          borderRadius: isUser ?BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomLeft: Radius.circular(12)):
                          BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomRight: Radius.circular(12))
                        ),
                        child:  showWidgetOption   );                   

                          

 }


  Widget _buildCategorySection() {
    return Builder(
      builder: (context) {
        if (categoriesCSP.watch(context) != null) {
          bool selectMultiple = false;
         

          return CategoryWidget(
            eventDetails: false,
            fitTextContainer: false,
            categories: categoriesCSP.value!,
            titleWidget: '',
            selectedCategoryId: selectedCategoryIdCSP.value,
            selectMultiple: selectMultiple,
            onSelectionChanged: (selectedCategories) async {
              FocusScope.of(context).unfocus();

              arrayCategory = selectedCategories.map((category) => category.id).toList();
              if (arrayCategory.isNotEmpty) {
                print('Estados seleccionados-elementos de la primera pagina:${arrayCategory.first}');
                
  // Verificar si ya existe un mensaje con 'key': 'category_user'
  final existingIndex = _messages.indexWhere((message) => message['key'] == 'category_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'category_user',
      'text': selectedCategories.first.title,
      'sender': 'user',

    };
  } else {
      _handleUserSessions(selectedCategories.first.title,'category_user');
  
  }
});
onCategorySelected(arrayCategory.first);
updateTaskCategoryId(arrayCategory.first);

              }
            },
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }


  Widget _buildStatusSection() {
    return Builder(
      builder: (context) {
        if (statusCSP.watch(context) != null) {
          bool selectMultiple = false;
          
            
          
          return StatusWidget(
            status: statusCSP.value!,
            fitTextContainer: false,
            eventDetails: true,
            titleWidget: '',
            selectMultiple: selectMultiple, // Permite seleccionar solo un estado
            selectedStatusId: selectStateTaskCSP.value, // Estado preseleccionado
            onSelectionChanged: (List<Status> selectedStatuses) {
              FocusScope.of(context).unfocus();
              // Aquí manejas los estados seleccionados
              print('Estados seleccionados: ${selectedStatuses.map((e) => e.id).join(', ')}');
              selectedStatus = selectedStatuses.isNotEmpty ? selectedStatuses.first.id : 0;
              print('Estados seleccionados: $selectedStatus');

              
              final existingIndex = _messages.indexWhere((message) => message['key'] == 'status_user');
setState(()  {
  _isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'status_user',
      'text': selectedStatuses.first.title,
      'sender': 'user',

    };
  } else {
      _handleUserSessions(selectedStatuses.first.title,'status_user');
  
  }
  });

//seleccionando el estado
              onTaskStateSelected(selectedStatus);
              updateTaskStatusId(selectedStatus);
            },
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }

  Widget _buildPrioritySection() {
    return Builder(
      builder: (context) {
        if (prioritiesCSP.watch(context) != null) {
          bool selectMultiple = false;
          
          
          return PriorityWidget(
            priorities: prioritiesCSP.value!,
            titleWidget: '',
            selectMultiple: selectMultiple, // Cambia a false si solo quieres una selección
            selectedPriorityId: selectedPriorityIdCSP.value,
            onSelectionChanged:(selectedPrioritiesList) async  {
    FocusScope.of(context).unfocus();
    selectedPriorities = selectedPrioritiesList;
    // Aquí manejas los estados seleccionados
    // print('Estados seleccionados: ${selectedPrioritiesList.map((e) => e.id).join(', ')}');
    selectedPriority = selectedPrioritiesList.isNotEmpty ? selectedPrioritiesList.first.id : 0;
    // print('Estados seleccionados: $selectedStatus');
    // Verificar si ya existe un mensaje con 'key': 'priority_user'
  final existingIndex = _messages.indexWhere((message) => message['key'] == 'priority_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'priority_user',
      'text': selectedPrioritiesList.first.title,
      'sender': 'user',

    };
  } else {
      _handleUserSessions(selectedPrioritiesList.first.title,'priority_user');
  
  }
});
    onPrioritySelected(selectedPriority);
    updateTaskPriority(selectedPriority);
    //este va actualizando el arreglo para mandar a insertar o eliminar
  }
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }

_buildFamilySection() {
    return Builder(
      builder: (context) {
        if (taskPersonsCSP.watch(context) != null) {
          bool selectMultiple = true;


// Luego, puedes usarla así:

          return TaskpersonWidget(
            taskpersons: taskPersonsCSP.value!,
            selectTaskpersons: selecteFamilyCSP.value,
            titleWidget: '',
            selectMultiple: selectMultiple, // Permitir selección múltiple
            enableRoleSelection: true, // Habilitar selección de rol
           // selectedPersonId: selectedPersonIdsCSP.value.first,
            
            rolesList: rolesCSP.value,
            onSelectionChanged: _onSelectionChanged, // Manejar cambios de selección
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }

  _buildCalendarSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              headerStyle: const HeaderStyle(
                // titleTextFormatter: (date, locale) => '', // Oculta el título
                formatButtonVisible: false, // Oculta el botón de formato
                // titleCentered: true,
                // leftChevronVisible: false, // Oculta el botón de navegación izquierda
                // rightChevronVisible: false, // Oculta el botón de navegación derecha
              ),
              locale: 'es_ES',
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: RangeSelectionMode.toggledOn, // Activar selección de rango
              selectedDayPredicate: (day) {
                //FocusScope.of(context).unfocus();
                return _selectedDateRange != null &&
                    (isSameDay(_selectedDateRange!.start, day) || isSameDay(_selectedDateRange!.end, day));
              },
              rangeStartDay: _selectedDateRange?.start,
              rangeEndDay: _selectedDateRange?.end,
              onRangeSelected: (start, end, focusedDay) async {
                // Resetear horas cuando cambia el rango
                FocusScope.of(context).unfocus();
                setState(() {
                  _selectedDateRange = DateTimeRange(start: start!, end: end ?? start);
                  _focusedDay = focusedDay;
                  _startTime = null;
                  _endTime = null;
                });
                print('selcct dataHora-zzzzz-start:$start');
                print('selcct dataHora-zzzzz-end:$end');

                // Selecciona la hora de inicio
                if (start != null) {
                  await _selectTime(context, true); // Seleccionar hora para la fecha de fin
                  
                }
                // Selecciona la hora de fin solo si hay una fecha final seleccionada
                if (end != null) {
                  await _selectTime(context, false); // Seleccionar hora para la fecha de fin
                }
                if (_selectedDateRange != null && _startTime != null && _endTime != null)
                {
                 
                   final existingIndex = _messages.indexWhere((message) => message['key'] == 'calendar_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'calendar_user',
      'text': 'Nueva Fecha seleccionada',
      'sender': 'user',

    };
  } else {
      //verificar si ya existe que lo modifique
                  _handleUserSessions('Fecha seleccionada correctamente','calendar_user');
  
  }
});

                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            if (_selectedDateRange != null && _startTime != null && _endTime != null) ...[
           
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white, // Color de fondo del contenedor
                  borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
                  border: Border.all(
                    color: selectedLevel == 2
                        ? colorBotoomSel.withOpacity(0.8)
                        : colorBotoom.withOpacity(0.4), // Color del borde
                    width: 2.0, // Grosor del borde
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: selectedLevel == 2
                          ? colorBotoomSel.withOpacity(0.4)
                          : colorBotoom.withOpacity(0.4), // Sombra roja
                      spreadRadius: 0, // Asegura que la sombra esté en el borde
                      blurRadius: 10, // Difumina la sombra
                      offset: Offset(0, 0), // Posiciona la sombra en las 4 partes
                    ),
                  ],
                ),
                child: Center(child: Text('Inicial:${_formatDateTime(_selectedDateRange!.start, _startTime)}')),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white, // Color de fondo del contenedor
                  borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
                  border: Border.all(
                    color: selectedLevel == 2
                        ? colorBotoomSel.withOpacity(0.8)
                        : colorBotoom.withOpacity(0.4), // Color del borde
                    width: 2.0, // Grosor del borde
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: selectedLevel == 2
                          ? colorBotoomSel.withOpacity(0.4)
                          : colorBotoom.withOpacity(0.4), // Sombra roja
                      spreadRadius: 0, // Asegura que la sombra esté en el borde
                      blurRadius: 10, // Difumina la sombra
                      offset: Offset(0, 0), // Posiciona la sombra en las 4 partes
                    ),
                  ],
                ),
                child: Center(child: Text('Final:${_formatDateTime(_selectedDateRange!.end, _endTime)}')),
              ),
            ],
          ],
        ),
      ),
    );
  }


  _buildRecurrenceSection() {
    return Builder(
      builder: (context) {
        if (frequencyCSP.watch(context) != null) {
          // Supongamos que 'frequencies' es una lista de nombres de frecuencias.[Diaria, Semanal, Mensual, Anual]
          final frequenciesData = frequencyCSP.value; // Cambia según tu fuente de datos
          int frecuencyId = 1;

          List<Frequency> frequencies = frequenciesData!.map((item) {
            final title = item; // Asegúrate de que item sea un String
            if (title == frequencyTaskCSP.value) {
              frecuencyId = frequenciesData.indexOf(item) + 1;
            }
            return Frequency(
              id: frequenciesData.indexOf(item) +
                  1, // Asigna un id basado en el índice, puedes cambiar esto si tienes otra lógica
              title: title,
              description: '', // Si no tienes descripción, puedes dejarlo vacío o manejarlo de otra manera
            );
          }).toList();

          return FrequencyWidget(
            frequencies: frequencies,
            titleWidget: '',
            selectMultiple: false, // Permite seleccionar solo una frecuencia
            selectedFrequencyId: frecuencyId, // Frecuencia preseleccionada (Opcional)
            onSelectionChanged: (List<Frequency> selectedFrequencies) {
              FocusScope.of(context).unfocus();
              // Aquí manejas las frecuencias seleccionadas
              print('Estados seleccionados-Frecuencias seleccionadas: ${selectedFrequencies.map((e) => e.title)}');
              if (selectedFrequencies.isNotEmpty) {
                print('Primera pagina de tareas-Frecuencia-${selectedFrequencies.first.title}'); 
              
                final existingIndex = _messages.indexWhere((message) => message['key'] == 'frequencie_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'frequencie_user',
      'text': selectedFrequencies.first.title,
      'sender': 'user',

    };
  } else {
     
                  _handleUserSessions(selectedFrequencies.first.title,'frequencie_user');
  
  }
});
  onFrequencyChanged(selectedFrequencies.first.title);
              }
            },
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }


}
