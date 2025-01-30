import 'dart:async';

// import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/products/product_model.dart';
import 'package:huoon/data/models/store/store_model.dart';
import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/domain/blocs/IncomeExpenses_bloc/login_service.dart';
import 'package:huoon/domain/blocs/IncomeExpenses_bloc/login_signal.dart';
import 'package:huoon/domain/blocs/chat_ia_bloc/chat_ia_service.dart';
import 'package:huoon/domain/blocs/login_bloc/login_signal.dart';
import 'package:huoon/domain/blocs/product_cat_state/bloc/product_cat_state_service.dart';
import 'package:huoon/domain/blocs/product_cat_state/bloc/product_cat_state_signal.dart';
import 'package:huoon/domain/blocs/products_bloc/products_service.dart';
import 'package:huoon/domain/blocs/products_bloc/products_signal.dart';
import 'package:huoon/domain/blocs/store_bloc/store_service.dart';
import 'package:huoon/domain/blocs/store_bloc/store_signal.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_signal.dart';
import 'package:huoon/domain/blocs/tasks/tasks_service.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:huoon/ui/Components/TimePickerModal.dart';
import 'package:huoon/ui/Components/category_widget.dart';
import 'package:huoon/ui/Components/family_widget.dart';
import 'package:huoon/ui/Components/frequency_widget.dart';
import 'package:huoon/ui/Components/priority_widget.dart';
import 'package:huoon/ui/Components/state_widget.dart';
import 'package:huoon/ui/Components/type_frequency_widget.dart';
import 'package:huoon/ui/pages/rol-admin/Task/selectDays/utils.dart';
import 'package:huoon/ui/pages/rol-admin/product/startProductPage.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskChatPage extends StatefulWidget {
  final List<Map<String, dynamic>> conversationSteps;
  final String title;
  final String module;
  final Color colorButton;
  final Color colorButtonSelected;
  final DateTime? focusedDay;
  final CalendarFormat calendarFormat;
  final DateTimeRange? selectedDateRange;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;

  const TaskChatPage({
    Key? key,
    required this.conversationSteps,
    required this.title,
    required this.module,
    this.colorButton = const Color.fromARGB(255, 61, 189, 93),
    this.colorButtonSelected = const Color.fromARGB(255, 199, 64, 59),
    this.focusedDay,
    this.calendarFormat = CalendarFormat.twoWeeks,
    this.selectedDateRange,
    this.startTime,
    this.endTime,
  }) : super(key: key);

  @override
  _TaskChatPageState createState() => _TaskChatPageState();
}


class _TaskChatPageState extends State<TaskChatPage> {
   late TextEditingController _textController;
  late List<Map<String, dynamic>> _messages;
  late Map<String, String> _taskData;
  int _currentStep = 0;
  bool _isTyping = false;
  int _isTypingTime = 1;
  late  List<Map<String, dynamic>> _conversationSteps =List.empty();
 //**variables del dataTimer */
bool isActive = true; // Variable para alternar colores
int isActive2seg = 1; // Variable para alternar colores

  int? _editingMessageIndex;
  String? _editingMessageKey = 'vacio';

  bool _showInputField = true;
  bool _isFinalStepReached = false;
  Timer? _timer;

void removeConversationStep(String key) {
  _conversationSteps.removeWhere((step) => step['key'] == key);
  _messages.removeWhere((step) => step['key'] == key);
}

  // ============================================ TASK SECTION ============================================
   DateTime _focusedDay = DateTime.now();
DateTimeRange? _selectedDateRange;
TimeOfDay? _startTime;
TimeOfDay? _endTime;
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
      'hr' : getcurrenttime()

    };
  } else {
      _handleUserSessions(nombres,'family_user');
  
  }
  });

// aqui se agregan los familiares
    //updateTaskFamily(persons);
    onFamilySelected(selected);
  }
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
 int selectedLevel = 0; // Para seleccionar el nivel
  Color colorBotoom = const Color.fromARGB(255, 61, 189, 93);
  Color colorBotoomSel = const Color.fromARGB(255, 199, 64, 59);

// ============================================ TASK SECTION FIN ============================================
//
//
 // ============================================ STORE SECTION  ============================================
  // ============================================ STORE SECTION FIN ========================================
  //
  //
   // ============================================ PRODUCT SECTION  ============================================
   // Formato completo con fecha y hora, imprime por separado
  String _formatDateTimeProduct(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
   // print('Fecha seleccionada: $formattedDate'); // Imprimir solo la fecha
    return formattedDate;
  }
    // ============================================ PRODUCT SECTION FIN ============================================


 // ============================================ IA-TRAVEL SECTION  ============================================
// Función para construir el prompt


String buildPrompt(List<Map<String, dynamic>> steps) {
  if (widget.module == 'chatIaTravel') {
    String destination = steps.firstWhere(
      (step) => step['key'] == 'boot_promt1_travel',
      orElse: () => {'response': 'un destino'},
    )['response'] ?? 'un destino';

    String motive = steps.firstWhere(
      (step) => step['key'] == 'boot_promt2_travel',
      orElse: () => {'response': 'un motivo'},
    )['response'] ?? 'un motivo';

    String duration = steps.firstWhere(
      (step) => step['key'] == 'boot_promt3_travel',
      orElse: () => {'response': 'una duración'},
    )['response'] ?? 'una duración';

    String companionship = steps.firstWhere(
      (step) => step['key'] == 'boot_promt4_travel',
      orElse: () => {'response': 'solo'},
    )['response'] ?? 'solo';

    String interest = steps.firstWhere(
      (step) => step['key'] == 'boot_promt5_travel_fin',
      orElse: () => {'response': 'ningún interés específico'},
    )['response'] ?? 'ningún interés específico';

    return 'Quiero viajar a $destination por $motive. Planeo quedarme $duration y viajaré $companionship. '
        'Mis intereses principales incluyen $interest. ¿Qué recomendaciones tienes para este viaje? y la respuesta dala en no mas de 400 caracteres';
  } 
  else
   if (widget.module == 'chatIaFinance') {
    String goal = steps.firstWhere(
      (step) => step['key'] == 'boot_promt1_finance',
      orElse: () => {'response': 'un objetivo financiero'},
    )['response'] ?? 'un objetivo financiero';

    String income = steps.firstWhere(
      (step) => step['key'] == 'boot_promt2_finance',
      orElse: () => {'response': 'un ingreso mensual promedio'},
    )['response'] ?? 'un ingreso mensual promedio';

    String expenses = steps.firstWhere(
      (step) => step['key'] == 'boot_promt3_finance',
      orElse: () => {'response': 'principales gastos mensuales'},
    )['response'] ?? 'principales gastos mensuales';

    String savings = steps.firstWhere(
      (step) => step['key'] == 'boot_promt4_finance',
      orElse: () => {'response': 'ningún ahorro o inversión'},
    )['response'] ?? 'ningún ahorro o inversión';

    String riskLevel = steps.firstWhere(
      (step) => step['key'] == 'boot_promt5_finance_fin',
      orElse: () => {'response': 'un nivel de riesgo bajo'},
    )['response'] ?? 'un nivel de riesgo bajo';

    return 'Mi objetivo financiero es $goal. Tengo un ingreso mensual promedio de $income y mis principales gastos incluyen $expenses. '
        'Actualmente tengo $savings y estoy dispuesto a asumir $riskLevel. ¿Qué recomendaciones puedes darme para mejorar mis finanzas? y la respuesta dala en no mas de 400 caracteres';
  } 


  else if (widget.module == 'chatIaHealth') {
    String healthGoal = steps.firstWhere(
      (step) => step['key'] == 'boot_promt1_health',
      orElse: () => {'response': 'mejorar mi bienestar general'},
    )['response'] ?? 'mejorar mi bienestar general';

    String activityLevel = steps.firstWhere(
      (step) => step['key'] == 'boot_promt2_health',
      orElse: () => {'response': 'un nivel bajo de actividad física'},
    )['response'] ?? 'un nivel bajo de actividad física';

    String dietType = steps.firstWhere(
      (step) => step['key'] == 'boot_promt3_health',
      orElse: () => {'response': 'una dieta estándar'},
    )['response'] ?? 'una dieta estándar';

    String sleepPattern = steps.firstWhere(
      (step) => step['key'] == 'boot_promt4_health',
      orElse: () => {'response': '7 horas de sueño por noche'},
    )['response'] ?? '7 horas de sueño por noche';

    String healthConcerns = steps.firstWhere(
      (step) => step['key'] == 'boot_promt5_health_fin',
      orElse: () => {'response': 'ninguna preocupación específica'},
    )['response'] ?? 'ninguna preocupación específica';

    return 'Mi objetivo de salud es $healthGoal. Tengo $activityLevel, sigo $dietType, y generalmente duermo $sleepPattern. '
        'Mis preocupaciones actuales incluyen $healthConcerns. ¿Qué recomendaciones puedes darme para mejorar mi salud?  y la respuesta dala en no mas de 400 caracteres';
  }
  
  else {

    if (widget.module == 'chatIaTravel') 
    {
     return 'Eres un experto en viajes, necesito los mejores cosejos. ¿Qué recomendaciones tienes para mí? y la respuesta dala en no mas de 400 caracteres';
  }
  
   else if (widget.module == 'chatIaFinance') 
    {
     return 'Eres un experto en finanzas, necesito los mejores cosejos. ¿Qué recomendaciones tienes para mí? y la respuesta dala en no mas de 400 caracteres';
  }
  
   else if (widget.module == 'chatIaHealth') 
    {
     return 'Eres un experto en salud, necesito los mejores cosejos. ¿Qué recomendaciones tienes para mí? y la respuesta dala en no mas de 400 caracteres';
  }
  else
  {
     return 'Dependiendo lo que te pregunte tu eres un experto en el tema, necesito los mejores cosejos.y la respuesta dala en no mas de 400 caracteres';
  }
    }
}

String buildPromptInput(String input) {
  String information = buildPrompt(_conversationSteps);
  return '$information, Siguiendo el hilo de la conversación y responde basado en lo siguiente: $input ';
   }



// Ejemplo de cómo actualizar las respuestas
void updateResponse(String key, String response) {
  for (var step in _conversationSteps) {
    if (step['key'] == key) {
      step['response'] = response;
      break;
    }
  }
}

//String prompt = buildPrompt(conversationSteps);
//  print(prompt);
// ============================================ IA-TRAVEL SECTION FIN ============================================

//DECLARAR LAS VARIABLES QUE SE NECESITAN PARA EL MODULO
  
void _addConversationStep(Map<String, dynamic> newStep) {
   // setState(() {
      _conversationSteps.add(newStep); // Agrega un nuevo paso.
      // _messages.add(newStep);
    
  //  });
  }

  void _showInitialMessages(String module ) async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {

      //AQUI PONER EL PRIMER MENSAJE QUE QUIERAS DEPENDIENDO DEL MODULO
     if(module == 'storeTask')
     {
      _messages.add({'key': 'init','text': 'Hola! ${currentUserLG.value!.userName}', 'sender': 'bot'});
     }
     //
     //
     if(module == 'storeStore')
     {
      _messages.add({'key': 'init','text': 'Hola! ${currentUserLG.value!.userName}. Te ayudaremos a crear un Almacen.', 'sender': 'bot'});
     }
     //
     //
     
     if(module == 'storeProduct')
     {
      _messages.add({'key': 'init','text': 'Hola! ${currentUserLG.value!.userName}. Te ayudaremos a crear un Producto.', 'sender': 'bot'});
     }
     //
     //
     if(module == 'chatIaTravel')
     {
      _messages.add({'key': 'init','text': 'Hola! ${currentUserLG.value!.userName}. Soy Huoon estoy aqui para ayudarte.', 'sender': 'bot'});
     }
     //
     //
     if(module == 'IncomeExpensesCreation')
     {
      _messages.add({'key': 'init','text': 'Hola! ${currentUserLG.value!.userName}. Te ayudaremos a registrar tus finanzas', 'sender': 'bot'});
     }
     //
     //
    });
    await Future.delayed(Duration(milliseconds: 800));
    _simulateResponse();
  }
int  cant_boot_promt_extra = 0;
  @override
  void initState() {
    super.initState();

    
    _selectedDay = DateTime.now();
      cant_boot_promt_extra = 1;
    _textController = TextEditingController();
    _messages = [];
    _taskData = {};
    _conversationSteps = widget.conversationSteps;

      _showInitialMessages(widget.module);
    // Iniciar un temporizador que cambie el estado cada 2 segundos
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) { // Verifica si el widget sigue montado
    //verifico si ya pasaron 10segundos le mando un mensaje
    
    if(_isTypingTime == 50)//si e sfalse mando un mensaje
    {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Hola! ${currentUserLG.value!.userName} 😊 Estamos esperando una respuesta para continuar...'),

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

      //   setState(() {
      //   isActive = false; // Cambiar entre activo e inactivo
      // });

      }
     else
    {
      if(isActive == false)
      {
      //   setState(() {
      //   isActive = true; // Cambiar entre activo e inactivo
      // });

      }       
      isActive2seg++;
    }
    }

    });
  
  }

 
  @override
  Widget build(BuildContext context) {    
    
    return Scaffold(
      backgroundColor:  Colors.white,//const Color.fromARGB(100, 194, 191, 191)
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          
          const SizedBox(width: 10,),
                
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HUOON',style: TextStyle(height: 1.2,fontSize: 18,fontWeight:FontWeight.bold,color: Colors.black ),),
                  Text(widget.title,style: TextStyle(height: 1.2,fontSize: 12,color: Color.fromARGB(120, 0, 0, 0) ),),
          
                ],
              ),
              
            ],
          ),
      // const Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(30, 158, 158, 158)),
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
                  //PONER LOS KEY DE LOS SELECCIONAR
                if(message['key'] != null)
                {
                  // ============================================ TASK SECTION ============================================
                  if(widget.module == 'storeTask')//tarea
                  {
                    isUserUpdateMens =  message['key'] == 'category_user' || 
                  message['key'] == 'status_user' ||
                   message['key'] == 'priority_user' || 
                   message['key'] == 'frequencie_user' || 
                   message['key'] == 'family_user';
                  }                  
                   // ============================================ TASK SECTION FIN ============================================
                   //
                   //
                   // ============================================ STORE SECTION  ============================================
                   else if(widget.module == 'storeStore')//almacen
                  {
                    isUserUpdateMens = message['key'] == 'status_store_user' ;
                  } 
                  // ============================================ STORE SECTION FIN ============================================
                  //
                  //
                   // ============================================ PRODUCT SECTION FIN ============================================
                   else if(widget.module == 'storeProduct')//almacen
                  {
                    isUserUpdateMens = message['key'] == 'quantity_product_user' || 
                  message['key'] == 'status_product_user' || message['key'] == 'category_product_user';
                  } 
                  // ============================================ PRODUCT SECTION FIN ============================================



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
                      FutureBuilder<Widget>(
          future: showWidget(message, keyMessage, isUser),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return snapshot.data!;
            } else {
              return Text('No hay datos');
            }
          },
        ),
                      
                     
                    
                  ),
                );
              },
            ),
          ),
          if (_isTyping)
             Padding(
              padding: EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:  Colors.grey[300],
                              borderRadius: 
                              BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomRight: Radius.circular(12))
                            ),
                    child: 
                    Image(
                      image: AssetImage('assets/gif/writing.gif'),
                      height: 30,

                    
                    ) ,
                    //Text('...',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
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
String moduleAct = widget.module;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
  controller: _textController,
  decoration: InputDecoration(
    hintText: hint,
    filled: true, // Habilita el relleno
    fillColor: Colors.white, // Fondo blanco
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: const Color.fromARGB(133, 158, 158, 158), width: 1.0), // Borde cuando está habilitado
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: StyleGlobalApk.colorPrimary, width: 2.0), // Borde cuando está enfocado
      borderRadius: BorderRadius.circular(8.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.5), // Borde cuando hay un error
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2.0), // Borde cuando hay error y está enfocado
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  onSubmitted: (value) {
    _handleUserInput(value, moduleAct);
  },
),
),
SizedBox(
  width: 10,
),
          CircleAvatar(
            backgroundColor: StyleGlobalApk.colorPrimary,
            child: IconButton(
              icon: Icon(Icons.send,color: Colors.white,),
              onPressed: () => _handleUserInput(_textController.text,moduleAct),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleUserInput(String input,String module) async {


    if (_currentStep >= _conversationSteps.length || input.isEmpty) return;

    // Guardar datos
      final currentStepKey = _conversationSteps[_currentStep]['key'];
      print('imprimir aqui que es lo que va a guardar---$currentStepKey');

//PONER AQUI TODOS LOS KEY DE SELECT
  // ============================================ TASK SECTION ============================================
if(module == 'IncomeExpensesCreation')
{
  if((currentStepKey != 'income_expenses' && currentStepKey != 'income_expense_type' &&
                    currentStepKey != 'date_income_expense'  ) || _editingMessageKey == null )//si no es ninguno de estos que selecciona si puede modificar e insertar
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
        _messages.insert(0, {'hr' : getcurrenttime(),'text': input, 'sender': 'user'}); // Insertar al inicio
      });
      //PONER AQUI TODOS LOS KEY QUE NO SON SELCT PARA GUARDAR EL ESTADO

        if(currentStepKey == 'money_amount')
    {
     money_amountIE.value = input;
    }

    else if(currentStepKey == 'description_income_expense')
    {
      description_income_expenseIE.value = input;
    }
   
      if (currentStepKey != 'done') {
        _taskData[currentStepKey!] = input;
      }

      _textController.clear();
      _currentStep++;

      if (_currentStep < _conversationSteps.length) {
        _simulateResponse();
      } else {
        print('Datos de los ingresos y gastos: $_taskData');
        _isFinalStepReached = true;
        _showInputField = false; // Ocultar el campo de texto al finalizar
      }
    }
    

      }

}
  // ============================================ TASK SECTION FIN ============================================
  //
  ////PONER AQUI TODOS LOS KEY DE SELECT
  // ============================================ TASK SECTION ============================================
if(module == 'storeTask')
{
  if((currentStepKey != 'category' && currentStepKey != 'status' &&
                    currentStepKey != 'priority' && 
                   currentStepKey != 'frequencie'  &&
                   currentStepKey != 'typeTask'  &&
                   currentStepKey != 'help_bot'  &&

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
        _messages.insert(0, {'hr' : getcurrenttime(),'text': input, 'sender': 'user'}); // Insertar al inicio
      });
      //PONER AQUI TODOS LOS KEY QUE NO SON SELCT PARA GUARDAR EL ESTADO

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

}
  // ============================================ TASK SECTION FIN ============================================
  //
  //
  // ============================================ STORE SECTION  ============================================
  else if(module == 'storeStore')
{
  if((currentStepKey != 'status_store' ) || _editingMessageKey == null )//si no es ninguno de estos que selecciona si puede modificar e insertar
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
        _messages.insert(0, {'hr' : getcurrenttime(),'text': input, 'sender': 'user'}); // Insertar al inicio
      });

        if(currentStepKey == 'title_store')
    {
      
      final storeElement = StoreElement(
          title: input, 
          );
          updateStoreData(storeElement);
    }

    else if(currentStepKey == 'description_store')
    {
      final storeElement = StoreElement(
          description: input,
          );
          updateStoreData(storeElement);
    }
    
    else if(currentStepKey == 'place_store')
    {
      final storeElement = StoreElement(
          location: input,
          );
          updateStoreData(storeElement);
    }
      if (currentStepKey != 'done') {
        _taskData[currentStepKey!] = input;
      }

      _textController.clear();
      _currentStep++;

      if (_currentStep < _conversationSteps.length) {
        _simulateResponse();
      } else {
        print('Datos del almacen $_taskData');
        _isFinalStepReached = true;
        _showInputField = false; // Ocultar el campo de texto al finalizar
      }
    }
    

      }

}
    // ============================================ STORE SECTION FIN ============================================  
    //
    //
    //
  //
  // ============================================ PRODUCT SECTION  ============================================
  else if(module == 'storeProduct')
{
  if((currentStepKey != 'quantity_product' && currentStepKey != 'status_product' && currentStepKey != 'category_product') || _editingMessageKey == null )//si no es ninguno de estos que selecciona si puede modificar e insertar
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
        _messages.insert(0, {'hr' : getcurrenttime(),'text': input, 'sender': 'user'}); // Insertar al inicio
      });

        if(currentStepKey == 'title_product')
    {
      
      final productElement = ProductElement( 
          productName: input,        
          image: 'image/default.jpg'
          );
      updateProductData(productElement);
    }

    else if(currentStepKey == 'description_product')
    {
      final productElement = ProductElement(    
          additionalNotes: input,  
          );
      updateProductData(productElement);
    }
    
    else if(currentStepKey == 'price_product')
    {
      final productElement = ProductElement(    
          unitPrice: input, 
          );
      updateProductData(productElement);
    }
    
    else if(currentStepKey == 'location_product')
    {
      final productElement = ProductElement( 
          purchasePlace: input
          );
      updateProductData(productElement);
    }
    
    else if(currentStepKey == 'brand_product')
    {
      final productElement = ProductElement( 
        brand:input ,
          );
      updateProductData(productElement);
    }
      if (currentStepKey != 'done') {
        _taskData[currentStepKey!] = input;
      }

      _textController.clear();
      _currentStep++;

      if (_currentStep < _conversationSteps.length) {
        _simulateResponse();
      } else {
        print('Datos del almacen $_taskData');
        _isFinalStepReached = true;
        _showInputField = false; // Ocultar el campo de texto al finalizar
      }
    }
    

      }

}
    // ============================================ PRODUCT SECTION FIN ============================================
    //
    //
   
     else if(module == 'chatIaTravel' || module == 'chatIaFinance'|| module == 'chatIaHealth')
{
  if( _editingMessageKey == null ||   _editingMessageKey == 'vacio')//si no es ninguno de estos que selecciona si puede modificar e insertar
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

      String responseIA = '';

      if((currentStepKey == 'boot_promt5_travel_fin' || currentStepKey == 'boot_promt5_finance_fin' || currentStepKey == 'boot_promt5_health_fin'  ) && _isTyping == false)//esta es la primer vez, aqui poner el promt
      {_textController.clear();
        setState(()  {
        _isTyping = true; });
        _isTypingTime = 1;   
        _messages.insert(0, {'hr' : getcurrenttime(),'text': input, 'sender': 'user'}); // Insertar al inicio     
 responseIA = await  requestChatIa(buildPrompt(_conversationSteps),buildPrompt(_conversationSteps));
      }
      else if((currentStepKey == 'boot_promt_extra') && _isTyping == false)
      {
        setState(()  {
        _isTyping = true; });
        _isTypingTime = 1;
        _messages.insert(0, {'hr' : getcurrenttime(),'text': input, 'sender': 'user'}); // Insertar al inicio
 responseIA = await  requestChatIa(buildPromptInput(input),buildPrompt(_conversationSteps));
      }
      else
      {
        setState(()  {
        _isTypingTime = 1;
        _messages.insert(0, {'hr' : getcurrenttime(),'text': input, 'sender': 'user'}); // Insertar al inicio
       
      });

      }
    
      
        
         if(currentStepKey == 'boot_promt5_travel_fin' || currentStepKey == 'boot_promt5_finance_fin' || currentStepKey == 'boot_promt5_health_fin'   || currentStepKey == 'boot_promt_extra')
    {
  _taskData[currentStepKey!] = input;
        setState(()  {
       
         _addConversationStep({
    'key': 'boot_promt_extra',
    'answer': getCantAnswer(),
    'message': responseIA,
    'hint': 'Quedaste con dudas? Puedes preguntarme...',
  });
     _isTyping = false;
        });
        updateAddCantAnswer();
 
    }
   

        if(currentStepKey != 'boot_promt_extra')
    {
      
      updateResponse(currentStepKey!, input);
    }
     
    
    

      _textController.clear();
      _currentStep++;

      if (_currentStep < _conversationSteps.length) {
        _simulateResponse();
      } else {

        if(widget.module != 'chatIaTravel')
        {
          print('Datos para la IA$_taskData');
        _isFinalStepReached = true;
        _showInputField = false; // Ocultar el campo de texto al finalizar

        }
        
      }
    }
    

      }

}



      _textController.clear();

   
  }

  void _handleUserSessions(String input,String key) {
    if (_currentStep >= _conversationSteps.length || input.isEmpty) return;

      // Nuevo mensaje
      setState(() {
        _messages.insert(0, {'hr' : getcurrenttime(),'key': key,'text': input, 'sender': 'user'}); // Insertar al inicio
      });

      // Guardar datos
      final currentStepKey = _conversationSteps[_currentStep]['key'];     
        _taskData[currentStepKey!] = input;  
        
     // _textController.clear();
      _currentStep++;

      if (_currentStep < _conversationSteps.length) {
        _simulateResponse();
      } else {
        print('Datos del modulo: $_taskData');
        _isFinalStepReached = true;
        _showInputField = false; // Ocultar el campo de texto al finalizar
      }
    
   // _textController.clear();
  }

  void _simulateResponse() async {
    if (!mounted) return; // Verifica antes de iniciar cualquier acción
    setState(() {

      _isTyping = true;
      _isTypingTime = 1;

    });

    await Future.delayed(Duration(milliseconds: 800));
 if (mounted) {
    setState(() {
      _isTyping = false;
      final message = _conversationSteps[_currentStep]['message'];
      final key = _conversationSteps[_currentStep]['key'];


      if (_currentStep == _conversationSteps.length - 1) {
        _messages.insert(0, {
          'key': key!,
          'text': message!,
          'sender': 'bot',
          'buttons': true,
          'hr' : getcurrenttime()
        });
      } else {
        _messages.insert(0, {'hr' : getcurrenttime(),'key': key!,'text': message!, 'sender': 'bot'});
      }
    });
  }
  }

  void _simulateResponseF(String inMsj,String inKey) async {
    if (!mounted) return; // Verifica antes de iniciar cualquier acción
    setState(() {

      _isTyping = true;
      _isTypingTime = 1;

    });

    await Future.delayed(Duration(milliseconds: 800));

    setState(() {
      _isTyping = false; 

        _messages.insert(0, {
          'key': inKey,
          'text': inMsj,
          'sender': 'bot',
          'buttons': true,
          'hr' : getcurrenttime()
        });
     
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
               if(_messages[index]['key'] != 'typeTask_user')
               {
                print('object-ffffffffffffff-1-${_messages[index]['key']}');
                _startEditing(index);

               }
               else  {
      //cargar el reloj de nuevo para seleccionar la fecha
      print('object-ffffffffffffff-2-${_messages[index]['key']}');
      print('object-ffffffffffffff-2-${_messages[index]['text']}');

          showModalBottomSheet(
  context: context,
  isDismissible: false, // No permite cerrar tocando fuera
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  builder: (context) => TimePickerModal(
    onSelect: (startTime, endTime) {
      //verificar si va 1 hora o van las 2 dependiendo si es evento o tarea
      String msj = '  Inicio: $startTime';
if (taskTypeSelectCSP.value == 'Evento')
{
  
  msj = '  Inicio: $startTime - Fin: $endTime';
  if(_startDate != null && _endDate != null) {
     final existingIndex = _messages.indexWhere((message) => message['key'] == 'calendar_user');
      final existingIndex2 = _messages.indexWhere((message) => message['key'] == 'calendar_product_user');
    
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'calendar_user',
      'text': 'Fecha seleccionada ${_formatDateTimeProduct(_startDate!)} - ${_formatDateTimeProduct(_endDate!)}',
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } 
   else if (existingIndex2 != -1) 
  {
    _messages[existingIndex2] = {
      'key': 'calendar_product_user',
      'text': 'Fecha seleccionada ${_formatDateTimeProduct(_startDate!)} - ${_formatDateTimeProduct(_endDate!)}',//calendar_product_user
      'sender': 'user',
      'hr' : getcurrenttime()

    };

  }
  else {
      //verificar si ya existe que lo modifique
                  _handleUserSessions('Fecha seleccionada ${_formatDateTimeProduct(_startDate!)} - ${_formatDateTimeProduct(_endDate!)}','calendar_user');
  
  }
});
    
  }
}
else
{
 
  if(_startDate != null ) {
{
     final existingIndex = _messages.indexWhere((message) => message['key'] == 'calendar_user');
     final existingIndex2 = _messages.indexWhere((message) => message['key'] == 'calendar_product_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'calendar_user',
      'text': 'Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}',//calendar_product_user
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  }
  else if (existingIndex2 != -1) 
  {
    _messages[existingIndex2] = {
      'key': 'calendar_product_user',
      'text': 'Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}',//calendar_product_user
      'sender': 'user',
      'hr' : getcurrenttime()

    };

  }

  
   else {
      //verificar si ya existe que lo modifique
                  _handleUserSessions('Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}','calendar_user');
  
  }
});
    
  }



}
}
      final existingIndex = _messages.indexWhere((message) => message['key'] == 'typeTask_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'typeTask_user',
      'text': msj,
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
     
                  _handleUserSessions(msj,'typeTask_user');
  
  }
});
      print('Hora inicial: $startTime');
      print('Hora final: $endTime');
      // Aquí puedes realizar cualquier acción adicional
    },
  ),
);
         

    }
              
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
       
        // ============================================ TASK SECTION  ============================================
        if(widget.module == 'storeTask')
        {
         // eventDate();
   // await Future.delayed(Duration(seconds: 3));
    //ENVIAR DATOS A LA API    
    verificDate();//verifica que se cumpla que startDate < endDate
    await storeTask();//insertar tarea
    //limpiando variables
    selecteFamilyCSP.value = null;
    selectedCategoryIdCSP.value = null;
    selecteFamilyCSP.value = null;
    selectedPriorityIdCSP.value = null;
    selectStateTaskCSP.value = null;
    //
    taskTypeSelectCSP.value = null;
    frequencyTaskCSP.value = '';

    GoRouter.of(context).go(
      '/HomePrincipal'
    );

        }       
         // ============================================ TASK SECTION FIN ============================================
         //
         //
         // ============================================ STORE SECTION  ============================================
        else if(widget.module == 'storeStore')
        {
          
    //ENVIAR DATOS A LA API    
    if(currentStoreElementST.value != null)
    {
      print('datos del almacen enviados a la api: ${currentStoreElementST.value}');
    await  submitStore(currentStoreElementST.value!, 1); //todo fijo mando valor del hogar
    GoRouter.of(context).go(
      '/HomePrincipal'
    );

    }
    else
    {
       SnackBar(
        content: Text('Error! Revisa que hay problemas al enviar los datos del almacen'),

        duration: Duration(seconds: 3), // Duración del SnackBar
       
      );
    }
    
        } 
         // ============================================ STORE SECTION FIN ============================================
         //
         //
         // ============================================ PRODUCT SECTION  ============================================
         else if(widget.module == 'storeProduct')
        {
          
    //ENVIAR DATOS A LA API    
     FocusScope.of(context).unfocus();
    String _dataStart = _formatDateTimeProduct(_selectedDateRange!.start);
    String _dataEnd = _formatDateTimeProduct(_selectedDateRange!.end);
    final productElement = ProductElement(
      purchaseDate: _dataStart,
      expirationDate: _selectedDateRange!.end,
    );
    updateProductData(productElement);
    String msj = isUpdateProductSignal.value == true
        ? 'Se está modificando el producto...'
        : 'Se está creando el producto...';

    
      print('Datos del productos a insertar-${productElementSignal.value}');
      await submitProduct();
    

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msj),
        duration: Duration(seconds: 2),
        action: SnackBarAction(label: 'Aceptar', onPressed: () {}),
      ),
    );

    GoRouter.of(context).go(
      '/HomePrincipal'
    );
    
    
        } 
          else if(widget.module == 'IncomeExpensesCreation')
        {
          
    //ENVIAR DATOS A LA API    
     FocusScope.of(context).unfocus();
      int homeId = 1;
    double spent = 0;//gasto
    double income = 0;//ingreso
    DateTime date =  date_income_expenseIE.value;
    String description = description_income_expenseIE.value;
    String type = '' ;
    String method = '';
    String image = '';
    // Convierte el string en un double
double value = double.parse(money_amountIE.value);

// Redondea a dos lugares decimales
double roundedValue = double.parse(value.toStringAsFixed(2));

   
if(incomeExpensesSelectIE.value == 1)//saber si es un gasto o un ingreso
{//ingreso
 income = roundedValue;
}
else{//gasto
spent = roundedValue ;
}   
if(personalHomeSelectIE.value == 1)//saber si es Personal o del hogar
{//Personal 
 type = 'Personal';
}
else{//Hogar
type = 'Hogar';
}
   


      await submitIncomeExpenses(homeId,spent,income,date,description,type,method,image);
      //aqui cargar las finanzas
   await getIncomeExpenses(1,'Todas');
    

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Guardando correctamente los datos de finanzas'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(label: 'Aceptar', onPressed: () {}),
      ),
    );

    GoRouter.of(context).go(
      '/HomePrincipal'
    );
    
    
        } 
         // ============================================ PRODUCT SECTION FIN ============================================


 else if(widget.module == 'chatIaHealth')
 {
  //tener a la mano el promt
  // tener la respuesta correspondiente de la ia
  //mandar modulo,promt y la respuesta d ela ia para un enpoint a guardar
  //
  // 
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Guardando la informacion...'),
        duration: Duration(seconds: 4),
      ),
    );
    GoRouter.of(context).go(
      '/HomePrincipal'
    );

 }
         //YA EL FINAL PARA MANDAR LOS DATOS A LA API


    }
   
  }
   
 void _handleConfirmationIA(String answerIA) async {   
      
         // ============================================ CHAT-IA SECTION  ============================================
 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Guardando la informacion del modulo-${widget.module}...'),
        duration: Duration(seconds: 4),
      ),
      );
    // submitChatIa(String module,String answerIa)
     await submitChatIa(widget.module,answerIA,buildPrompt(_conversationSteps));
    //verificar si ya existe que lo modifique
//  setState(() {

//       //_isTyping = true;
//       _isTypingTime = 1;
//       _messages.insert(0, {'key':'msj_ia','text': 'Muy bien! ${currentUserLG.value!.userName} ya guardamos la informacion, si tienes alguna otra duda puedes preguntarme.', 'sender': 'bot'});


//     });                 
_simulateResponseF('Muy bien! ${currentUserLG.value!.userName} ya guardamos la informacion, si tienes alguna otra duda puedes preguntarme o finalizar','msj_ia');
// ============================================ CHAT-IA SECTION FIN ============================================
         //YA EL FINAL PARA MANDAR LOS DATOS A LA API
  }
 
  void _close() async {   
      
         // ============================================ CHAT-IA SECTION  ============================================
 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cerrando...'),
        duration: Duration(seconds: 4),
      ),
      );
    
     GoRouter.of(context).go(
      '/HomePrincipal'
     ); 
// ============================================ CHAT-IA SECTION FIN ============================================
         //YA EL FINAL PARA MANDAR LOS DATOS A LA API
  }
   
 //ESTE ES UN METODO QUE PERTENECE AL MODULO COMO TAL DEL BOOT, DEVUELVE EL MENSAJE DEL BOOT 
 Future<Widget> showWidget(Map<String, dynamic> message, String? keyMessage, bool isUser) async {
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

    //AQUI PONER LOS COMPONENTES DE SELECT QUE HAY QUE CARGAR
    // ============================================ TASK SECTION  ============================================    
    if(widget.module == 'IncomeExpensesCreation')
    {
       if( keyMessage =='income_expenses')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
          _buildIncomeExpensesSection(),
          

        ],
      );

    }
    else if( keyMessage =='income_expense_type')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildIncomeExpenseTypeSection(),

        ],
      );//priority
         }
         
          else if( keyMessage =='date_income_expense')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildCalendarIncomeExpensesSection(),

        ],
      );//_buildRecurrenceSection
         }
         
    else {
      showWidgetOption = Text(message['text'] ?? '',style: TextStyle(color: isUser ? Colors.white : Colors.black));
    }

    } //AQUI PONER LOS COMPONENTES DE SELECT QUE HAY QUE CARGAR
    // ============================================ TASK SECTION  ============================================    
   else if(widget.module == 'storeTask')
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
         }//help_bot
    //         else if( keyMessage =='help_bot')
    // {
    //   showWidgetOption = Column(
    //     children: [
    //       Text(message['text'] ?? ''),
         

    //     ],
    //   );//
    //      }//help_bot
            else if( keyMessage =='typeTask')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildTaskTypeSection(),

        ],
      );//
         }//_buildTaskTypeSection
         
    else {
      showWidgetOption = Text(message['text'] ?? '',style: TextStyle(color: isUser ? Colors.white : Colors.black));
    }

    }
     // ============================================ TASK SECTION FIN ============================================
     //
     //
      // ============================================ STORE SECTION FIN ============================================
else if(widget.module == 'storeStore')
{
  if( keyMessage =='status_store')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildStatusSectionStore(),

        ],
      );//priority
         }
         else {
      showWidgetOption = Text(message['text'] ?? '',style: TextStyle(color: isUser ? Colors.white : Colors.black));
    }
  
}
 // ============================================ STORE SECTION FIN ============================================
 //
 //
      // ============================================ PRODUCT SECTION FIN ============================================
else if(widget.module == 'storeProduct')
{
  if( keyMessage == 'quantity_product')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
           _buildQuantitySectionProduct(),

        ],
      );//priority
         }
       else  if( keyMessage == 'status_product')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildStatusSectionProduct(),

        ],
      );//priority
         }
        else  if( keyMessage == 'category_product')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildStatusCategoryProduct(),

        ],
      );//priority
         }
         
        else  if( keyMessage == 'date_product')
    {
      showWidgetOption = Column(
        children: [
          Text(message['text'] ?? ''),
         _buildCalendarSectionProduct(),     

        ],
      );//priority
         }
         else {
      showWidgetOption = Text(message['text'] ?? '',style: TextStyle(color: isUser ? Colors.white : Colors.black));
    }
  
}
 // ============================================ PRODUCT SECTION FIN ============================================
 //
 //
 
     
    else//este es el por defecto
    {
      showWidgetOption = Text(message['text'] ?? '',style: TextStyle(color: isUser ? Colors.white : Colors.black));
    }
   
   

   }

 }
 else //ya lleg[o al final y esta el cancelar o guardar
 {
 

//  si llego al final y estoy ne el modulo de la ia, ahi la ia e sla que le sigue
  
 if(widget.module == 'chatIaTravel' || widget.module == 'chatIaFinance' || widget.module == 'chatIaHealth'  ){
  
  if(keyMessage !='boot_promt_extra' || cant_boot_promt_extra <= 1)
  {

      cant_boot_promt_extra++;
 
      
    showWidgetOption = Text(message['text'] ?? '',style: TextStyle(color: isUser ? Colors.white : Colors.black));    
  }//Text(message['text'] ?? '',style: TextStyle(color: isUser ? Colors.white : Colors.black)); 
  else
  {
    
    showWidgetOption = Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(message['text'] ?? ''),
                                SizedBox(height: 10,),
                                Text('Si no quedó satisfecho o tiene más preguntas, puede consultarme nuevamente o guardar esta información para usarla cuando la necesite.'),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        print('answer-answer-answer:${message['text']}');
                                        _close();
                                      },
                                      child: Text('Salir'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        print('answer-answer-answer:${message['text']}');
                                        updateSendAnswerApi(message['text']);
                                        _handleConfirmationIA(message['text']);
                                      },
                                      child: Text('Guardar'),
                                    ),
                                  ],
                                ),
                              ],
                            );

  }
 
                     
   }
   else
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
    
    
  


 }
 return 
                        Column(
                          children: [
                            
                            Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isUser ? StyleGlobalApk.colorPrimary : const Color.fromARGB(60, 194, 191, 191),
                              borderRadius: isUser ?BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomLeft: Radius.circular(12)):
                              BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomRight: Radius.circular(12))
                            ),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                showWidgetOption,
                                 Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(''),
                                          Text(message['hr']??'',style: TextStyle(color: isUser ? const Color.fromARGB(118, 255, 255, 255) : const Color.fromARGB(118, 0, 0, 0),fontSize: 10),),
                                                                     
                                        ],
                                      )
                              ],
                            )   ),
                           
                           isUser ?  const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                Text(''),
                                 CircleAvatar(
                                   radius: 15, // Tamaño del avatar
                                   backgroundImage: AssetImage('assets/people/default.jpg'),
                                 ),
                               ],
                             ):
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                
                                 CircleAvatar(
                                   radius: 15, // Tamaño del avatar
                                   backgroundImage: AssetImage('assets/images/icon-Huoon.jpg'),
                                 ),
                                 Text(''),
                               ],
                             ),
                          ],
                        );                   

                          

 }

// ============================================ TASK SECTION FIN ============================================
  Widget _buildCategorySection() {
    return Builder(
      builder: (context) {
        if (categoriesCSP.value != null) {
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
      'hr' : getcurrenttime()

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

   Widget _buildIncomeExpensesSection() {
    return Builder(
      builder: (context) {
       
          bool selectMultiple = false;
         final List<Status> status = [
  Status(
    title: 'Ingreso',
    icon: Icons.arrow_downward, // Ícono para "Ingreso"
    id: 1,
  ),
  Status(
    title: 'Gasto',
    icon: Icons.arrow_upward, // Ícono para "Gasto"
    id: 2,
    )];

          return StatusWidget(
            status: status,
            fitTextContainer: false,
            eventDetails: true,
            titleWidget: '',
            selectMultiple: selectMultiple, // Permite seleccionar solo un estado
            selectedStatusId: incomeExpensesSelectIE.value, // Estado preseleccionado
            onSelectionChanged: (List<Status> selectedStatuses) {
              FocusScope.of(context).unfocus();
              // Aquí manejas los estados seleccionados
              print('Estados seleccionados: ${selectedStatuses.map((e) => e.id).join(', ')}');
              selectedStatus = selectedStatuses.isNotEmpty ? selectedStatuses.first.id : 0;
              print('Estados seleccionados: $selectedStatus');

              
              // Verificar si ya existe un mensaje con 'key': 'category_user'
  final existingIndex = _messages.indexWhere((message) => message['key'] == 'income_expenses_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'income_expenses_user',
      'text': selectedStatuses.first.title,
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
      _handleUserSessions(selectedStatuses.first.title,'income_expenses_user');
  
  }
});
incomeExpensesSelectIE.value = selectedStatuses.first.id;
            },
          );
        
      },
    );
  }

  Widget _buildIncomeExpenseTypeSection() {
    return Builder(
      builder: (context) {        
          bool selectMultiple = false;         
          

final List<Status> status = [
  Status(
    title: 'Personal',
    icon: Icons.person, // Ícono para "Ingreso"
    id: 1,
  ),
  Status(
    title: 'Hogar',
    icon: Icons.home, // Ícono para "Gasto"
    id: 2,
  ),
];

          
          return StatusWidget(
            status: status,
            fitTextContainer: false,
            eventDetails: true,
            titleWidget: '',
            selectMultiple: selectMultiple, // Permite seleccionar solo un estado
            selectedStatusId: personalHomeSelectIE.value, // Estado preseleccionado
            onSelectionChanged: (List<Status> selectedStatuses) {
              FocusScope.of(context).unfocus();
              // Aquí manejas los estados seleccionados
              print('Estados seleccionados: ${selectedStatuses.map((e) => e.id).join(', ')}');
              selectedStatus = selectedStatuses.isNotEmpty ? selectedStatuses.first.id : 0;
              print('Estados seleccionados: $selectedStatus');

              
              final existingIndex = _messages.indexWhere((message) => message['key'] == 'personalHome_user');
setState(()  {
  _isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'personalHome_user',
      'text': selectedStatuses.first.title,
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
      _handleUserSessions(selectedStatuses.first.title,'personalHome_user');
  
  }
  });

//seleccionando el estado
personalHomeSelectIE.value = selectedStatuses.first.id;
            },
          );
       
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
      'hr' : getcurrenttime()

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
      'hr' : getcurrenttime()

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
  late DateTime _selectedDay;
  
  DateTime? _startDate;
  DateTime? _endDate;

  // Actualiza el rango de fechas seleccionadas
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;

      if (taskTypeSelectCSP.value == 'Evento') {
        if (_startDate == null || _endDate != null) {
          // Si no hay fecha de inicio o ya se seleccionó un rango completo
          _startDate = selectedDay;
          _endDate = null;
        } else {
          // Si ya se seleccionó la fecha de inicio, seleccionamos la fecha final
          if (selectedDay.isBefore(_startDate!)) {
            _startDate = selectedDay;
            _endDate = null;
          } else if (selectedDay.isAfter(_startDate!)) {
            _endDate = selectedDay;
          }
        }


  if (_startDate != null && _endDate != null) {
      final existingIndex = _messages.indexWhere((message) => message['key'] == 'calendar_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'calendar_user',
      'text': 'Nueva Fecha seleccionada ${_formatDateTimeProduct(_startDate!)} - ${_formatDateTimeProduct(_endDate!)}',
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
      //verificar si ya existe que lo modifique
                  _handleUserSessions('Fecha seleccionada ${_formatDateTimeProduct(_startDate!)} - ${_formatDateTimeProduct(_endDate!)}','calendar_user');
  
  }
});

  }

//verificDate();
  updateTaskDateTime(
  _formatDateTimeProduct(_startDate ?? DateTime.now()),
  _formatDateTimeProduct(
    _endDate ?? (_startDate != null ? _startDate!.add(Duration(days: 1)) : DateTime.now()),
  ),
);

                         
      }
       else if (taskTypeSelectCSP.value == 'Tarea') {
        // Si es 'Tarea', solo selecciona un día
        _startDate = selectedDay;
        _endDate = null;
          final existingIndex = _messages.indexWhere((message) => message['key'] == 'calendar_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'calendar_user',
      'text': 'Nueva Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}',
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
      //verificar si ya existe que lo modifique
                  _handleUserSessions('Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}','calendar_user');
  
  }
});
updateTaskDateTime(
  _formatDateTimeProduct(_startDate ?? DateTime.now()),
  _formatDateTimeProduct(_endDate ?? DateTime.now()),
);
      }
    });



  } // Actualiza el rango de fechas seleccionadas
  void _onDaySelectedIE(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;

   
      
        _startDate = selectedDay;
        _endDate = null;
          final existingIndex = _messages.indexWhere((message) => message['key'] == 'date_income_expense_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'date_income_expense_user',
      'text': 'Nueva Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}',
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
      //verificar si ya existe que lo modifique
                  _handleUserSessions('Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}','date_income_expense_user');
  
  }
});
date_income_expenseIE.value = _startDate ?? DateTime.now() ;

      
    });



  }

  verificDate()
  {
    if (_endDate != null && _startDate != null && _endDate!.isBefore(_startDate!)) {
  _endDate = _startDate!.add(Duration(days: 1));
} else if (_endDate == null && _startDate != null) {
  _endDate = _startDate!.add(Duration(days: 1));
} else if (_endDate == null && _startDate == null) {
  _endDate = DateTime.now().add(Duration(days: 1));
}

updateTaskDateTime(
  _formatDateTimeProduct(_startDate ?? DateTime.now()),
  _formatDateTimeProduct(_endDate ?? DateTime.now().add(Duration(days: 1))),
);

  }
   // Método que retorna el componente del calendario
  Widget _buildCalendarIncomeExpensesSection() {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2020, 01, 01),
      lastDay: DateTime.utc(2030, 12, 31),
      selectedDayPredicate: (day) {
        // Resalta el día seleccionado
        return isSameDay(_startDate, day);
      },
      onDaySelected: _onDaySelectedIE,
      calendarStyle: CalendarStyle(
  todayDecoration: BoxDecoration(
    color: StyleGlobalApk.colorPrimary.withOpacity(0.5),
    shape: BoxShape.circle,
  ),
  selectedDecoration: BoxDecoration(
    color: StyleGlobalApk.colorPrimary,
    shape: BoxShape.circle,
  ),
  rangeHighlightColor: StyleGlobalApk.colorPrimary.withOpacity(0.5),
  rangeStartDecoration: BoxDecoration(
    color: StyleGlobalApk.colorPrimary,
    shape: BoxShape.circle,
  ),
  rangeEndDecoration: BoxDecoration(
    color: StyleGlobalApk.colorPrimary,
    shape: BoxShape.circle,
  ),
),

      rangeStartDay: _startDate, // Día de inicio del rango
      rangeEndDay: _endDate, // Día de fin del rango
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
    );
  }
  
   // Método que retorna el componente del calendario
  Widget _buildCalendarSection() {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2020, 01, 01),
      lastDay: DateTime.utc(2030, 12, 31),
      selectedDayPredicate: (day) {
        // Resalta el día seleccionado
        return isSameDay(_startDate, day);
      },
      onDaySelected: _onDaySelected,
      calendarStyle: CalendarStyle(
  todayDecoration: BoxDecoration(
    color: StyleGlobalApk.colorPrimary.withOpacity(0.5),
    shape: BoxShape.circle,
  ),
  selectedDecoration: BoxDecoration(
    color: StyleGlobalApk.colorPrimary,
    shape: BoxShape.circle,
  ),
  rangeHighlightColor: StyleGlobalApk.colorPrimary.withOpacity(0.5),
  rangeStartDecoration: BoxDecoration(
    color: StyleGlobalApk.colorPrimary,
    shape: BoxShape.circle,
  ),
  rangeEndDecoration: BoxDecoration(
    color: StyleGlobalApk.colorPrimary,
    shape: BoxShape.circle,
  ),
),

      rangeStartDay: _startDate, // Día de inicio del rango
      rangeEndDay: _endDate, // Día de fin del rango
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
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

          

          return FrequencyWidget(
            frequencies: frequenciesData!,
            titleWidget: '',
            selectMultiple: false, // Permite seleccionar solo una frecuencia
            selectedFrequencyId: frequencyTaskCSP.value, // Frecuencia preseleccionada (Opcional)
            onSelectionChanged: (List<Frequency> selectedFrequencies) {
              FocusScope.of(context).unfocus();
              // Aquí manejas las frecuencias seleccionadas
              print('Estados seleccionados-Frecuencias seleccionadas: ${selectedFrequencies.map((e) => e.title)}');
              if (selectedFrequencies.isNotEmpty) {
                print('Primera pagina de tareas-Frecuencia-${selectedFrequencies.first.title}'); 
                if(selectedFrequencies.first.id == 'No se repite')
              {
                //mostrar el reloj para seleccionar la hora
                
                 print('aqui en fecuencia- NO-mostrar componente reloj');
              }
              else
              {
               

               print('aqui en fecuencia- mostrar componente reloj');

              }
              
                final existingIndex = _messages.indexWhere((message) => message['key'] == 'frequencie_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'frequencie_user',
      'text': selectedFrequencies.first.title,
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
     
                  _handleUserSessions(selectedFrequencies.first.title,'frequencie_user');
  
  }
});
  onFrequencyChanged(selectedFrequencies.first.title);
  updateTaskRecurrence(selectedFrequencies.first.title);
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
// ============================================ TASK SECTION FIN ============================================
//
  _buildTaskTypeSection() {
    return Builder(
      builder: (context) {
        if (taskTypeCSP.watch(context) != null) {
          // Supongamos que 'frequencies' es una lista de nombres de frecuencias.[Diaria, Semanal, Mensual, Anual]
          final taskTypeData = taskTypeCSP.value; // Cambia según tu fuente de datos         

          

          return TaskTypeWidget(
  taskTypes: taskTypeData!, // Lista de TaskType
  titleWidget: '',
  selectMultiple: false,
  onSelectionChanged: (selectedTaskTypes) {
    // Maneja las tareas seleccionadas
    

      FocusScope.of(context).unfocus();
       showModalBottomSheet(
  context: context,
  isDismissible: false, // No permite cerrar tocando fuera
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  builder: (context) => TimePickerModal(
    onSelect: (startTime, endTime) {
      //verificar si va 1 hora o van las 2 dependiendo si es evento o tarea
      String msj = '${selectedTaskTypes.first.name}  Inicio: $startTime';
if (taskTypeSelectCSP.value == 'Evento')
{
  setState(() {
      _isTyping = false; 

        _messages.insert(0, {
          'key': 'help_bot',
          'text': 'Muy bien! te ayudaremos a crear un Evento',
          'sender': 'bot',
          'hr' : getcurrenttime()
        });
     
    });
  msj = '${selectedTaskTypes.first.name}  Inicio: $startTime - Fin: $endTime';
  if(_startDate != null && _endDate != null) {
     final existingIndex = _messages.indexWhere((message) => message['key'] == 'calendar_user');
      final existingIndex2 = _messages.indexWhere((message) => message['key'] == 'calendar_product_user');
     // _simulateResponseF('Muy bien! ${currentUserLG.value!.userName} te ayudaremos a crear un Evento','help_bot');
    //  _messages.add({'key': 'help_bot','text': 'Muy bien! ${currentUserLG.value!.userName} te ayudaremos a crear un Evento', 'sender': 'bot'});
      
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'calendar_user',
      'text': 'Fecha seleccionada ${_formatDateTimeProduct(_startDate!)} - ${_formatDateTimeProduct(_endDate!)}',
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } 
   else if (existingIndex2 != -1) 
  {
    _messages[existingIndex2] = {
      'key': 'calendar_product_user',
      'text': 'Fecha seleccionada ${_formatDateTimeProduct(_startDate!)} - ${_formatDateTimeProduct(_endDate!)}',//calendar_product_user
      'sender': 'user',
      'hr' : getcurrenttime()

    };

  }
  else {
      //verificar si ya existe que lo modifique
                  _handleUserSessions('Fecha seleccionada ${_formatDateTimeProduct(_startDate!)} - ${_formatDateTimeProduct(_endDate!)}','calendar_user');
  
  }
});
    
  }
}
else
{
  //  _simulateResponseF('Muy bien! ${currentUserLG.value!.userName} te ayudaremos a crear una Tarea','help_bot');
  // _messages.add({'key': 'help_bot','text': 'Muy bien! ${currentUserLG.value!.userName} te ayudaremos a crear una Tarea', 'sender': 'bot'});
   setState(() {
      _isTyping = false; 

        _messages.insert(0, {
          'key': 'help_bot',
          'text': 'Muy bien! te ayudaremos a crear una Tarea',
          'sender': 'bot',
          'hr' : getcurrenttime()
        });
     
    });
  if(_startDate != null ) {
{
     final existingIndex = _messages.indexWhere((message) => message['key'] == 'calendar_user');
     final existingIndex2 = _messages.indexWhere((message) => message['key'] == 'calendar_product_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'calendar_user',
      'text': 'Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}',//calendar_product_user
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  }
  else if (existingIndex2 != -1) 
  {
    _messages[existingIndex2] = {
      'key': 'calendar_product_user',
      'text': 'Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}',//calendar_product_user
      'sender': 'user',
      'hr' : getcurrenttime()

    };

  }

  
   else {
      //verificar si ya existe que lo modifique
                  _handleUserSessions('Fecha seleccionada ${_formatDateTimeProduct(_startDate!)}','calendar_user');
  
  }
});
    
  }



}
}
      final existingIndex = _messages.indexWhere((message) => message['key'] == 'typeTask_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'typeTask_user',
      'text': msj,
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
     
                  _handleUserSessions(msj,'typeTask_user');
  
  }
});
      print('Hora inicial: $startTime');
      print('Hora final: $endTime');
      // Aquí puedes realizar cualquier acción adicional
    },
  ),
);
         

  onTaskTypeChanged(selectedTaskTypes.first.id);
  updateTaskType(selectedTaskTypes.first.id);

  removeConversationStep('typeTask');


  },
  selectedTaskTypeId: taskTypeSelectCSP.value , // Opcional, ID de la tarea pre-seleccionada
)
;

        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }
// ============================================ TASK SECTION FIN ============================================
//
//
// ============================================ STORE SECTION  ============================================
  Widget _buildStatusSectionStore() {
    return Builder(
      builder: (context) {
        if (statusStoreCSP.value != null) {
          bool selectMultiple = false;
          // if (isUpdateST.value == true) //SI ES TRUE ES PARA MODIFICAR
          // {
          //   permisSelect = currentStoreElementST.value!.status!;
          // } else {
          //   permisSelect = statusStoreCSP.value!.first.id;
          // }

          return StatusWidget(
            status: statusStoreCSP.value!,
            fitTextContainer: false,
            eventDetails: true,
            titleWidget: '',
            selectMultiple: selectMultiple, // Permite seleccionar solo un estado
            selectedStatusId: selectStatusStoreCSP.value, // Estado preseleccionado
            onSelectionChanged: (List<Status> selectedStatuses) {
              FocusScope.of(context).unfocus();
              // Aquí manejas los estados seleccionados
              print('Estados del almacen seleccionados-1: ${selectedStatuses.map((e) => e.id).join(', ')}');
              selectedStatus = selectedStatuses.isNotEmpty ? selectedStatuses.first.id : 0;
              print('Estados del almacen seleccionados-2: $selectedStatus');


  final existingIndex = _messages.indexWhere((message) => message['key'] == 'status_store_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'status_store_user',
      'text': selectedStatuses.first.title,
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
     
                  _handleUserSessions(selectedStatuses.first.title,'status_store_user');
  
  }
});


selectStatusStoreCSP.value = selectedStatuses.first.id;
              final storeElement = StoreElement(
          status: selectedStatus,

          );
          updateStoreData(storeElement);

              //seleccionando el estado
              // onTaskStateSelected(selectedStatus);
            },
          );
        } else if (errorMessageCSP.watch(context) != null) {
          return Center(child: Text('Error: ${errorMessageCSP.value}'));
        }
        return Container();
      },
    );
  }
// ============================================ STORE SECTION FIN ============================================


// ============================================ PRODUCT SECTION  ============================================
  Widget _buildStatusSectionProduct() {
    
    return Builder(
      builder: (context) {
        if (statusSignalPCS.value != null) {
          bool selectMultiple = false;
          //     if (isUpdateProductSignal.value == true) { //es modificar           
          //   selectStatus(productElementSignal.value!.statusId!);
          // } 
          return StatusWidget(
            status: statusSignalPCS.value!,
            fitTextContainer: false,
            eventDetails: true,
            titleWidget: '',
            selectMultiple: selectMultiple, // Permite seleccionar solo un estado
            selectedStatusId: selectedStatusIdSignalPCS.value, // Estado preseleccionado
            onSelectionChanged: (List<Status> selectedStatuses) {
              FocusScope.of(context).unfocus();
              // Aquí manejas los estados seleccionados
           //   print('Estados seleccionados: ${selectedStatuses.map((e) => e.id).join(', ')}');
              selectedStatus = selectedStatuses.isNotEmpty ? selectedStatuses.first.id : 0;
              print('Estados seleccionados: $selectedStatus');
 final existingIndex = _messages.indexWhere((message) => message['key'] == 'status_product_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'status_product_user',
      'text': selectedStatuses.first.title,
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
     
                  _handleUserSessions(selectedStatuses.first.title,'status_product_user');
  
  }
});
              //seleccionando el estado
              selectStatus(selectedStatus);
              final productElement = ProductElement(
                homeId: 1,//todo por defecto
                        statusId: selectedStatuses.first.id,
                        nameStatus: selectedStatuses.first.title
  );
                  updateProductData(productElement);
            },
          );
        }
        return Text('No hay estados');
      },
    );
  }

 QuantitySelector _buildQuantitySectionProduct() {
   return QuantitySelector(
                    initialQuantity: quantitySignal.value,
                    onQuantityChanged: (newQuantity) {                        

                      updateQuantity(newQuantity);
                      int? price = int.tryParse(getPrice());
if (price != null) {
  print("El precio convertido es $price.");
} else {
  print("No se pudo convertir el precio.");
}

                       final productElement = ProductElement(
                        quantity: newQuantity,
                        totalPrice: price != null ?(price*newQuantity).toString():'0',
  );

  final existingIndex = _messages.indexWhere((message) => message['key'] == 'quantity_product_user');
               setState(()  {
_isTypingTime = 1;
if (existingIndex != -1) {
  // Si existe, modificarlo
  _messages[existingIndex] = {
    'key': 'quantity_product_user',
    'text': newQuantity.toString(),
    'sender': 'user',
      'hr' : getcurrenttime()

  };
} else {
   
                _handleUserSessions(newQuantity.toString(),'quantity_product_user');

}
});

                  updateProductData(productElement);

                      // context.read<CategoriesPrioritiesBloc>().add(QuantityProductEvent(newQuantity));
                    },
                  );
 }

 CategoryWidget _buildStatusCategoryProduct() {
    return CategoryWidget(
                categories: categoriesSignalPCS.value,
                titleWidget: '',
                selectedCategoryId: selectedCategoryIdSignalPCS.value,
                selectMultiple: false,
                onSelectionChanged: (selectedCategories) {
                  // setState(() {
                    arrayCategory = selectedCategories
                        .asMap()
                        .entries
                        .map((entry) => selectedCategories[entry.key].id) // Mapea los IDs de las categorías
                        .toList();
                  // });

                   final existingIndex = _messages.indexWhere((message) => message['key'] == 'category_product_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'category_product_user',
      'text': selectedCategories.first.title,
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
     
                  _handleUserSessions(selectedCategories.first.title,'category_product_user');
  
  }
});
                  selectCategory(selectedCategories.first.id);
                   final productElement = ProductElement(
    categoryId: selectedCategories.first.id,
    nameCategory: selectedCategories.first.title
  );
                  updateProductData(productElement);
                },
              );
  }

 Column _buildCalendarSectionProduct() {
   return Column(
        children: [
          TableCalendar(
            locale: 'es_ES',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            selectedDayPredicate: (day) {
              return _selectedDateRange != null &&
                  (isSameDay(_selectedDateRange!.start, day) || isSameDay(_selectedDateRange!.end, day));
            },
            rangeStartDay: _selectedDateRange?.start,
            rangeEndDay: _selectedDateRange?.end,
            onRangeSelected: (start, end, focusedDay) async {
              setState(() {
                _selectedDateRange = DateTimeRange(start: start!, end: end ?? start);
                _focusedDay = focusedDay;
              });
             // print('selcct dataHora-zzzzz-start:$start');
            //  print('selcct dataHora-zzzzz-end:$end');
              final existingIndex = _messages.indexWhere((message) => message['key'] == 'calendar_product_user');
                 setState(()  {
_isTypingTime = 1;
  if (existingIndex != -1) {
    // Si existe, modificarlo
    _messages[existingIndex] = {
      'key': 'calendar_product_user',
      'text': 'Nueva Fecha seleccionada',
      'sender': 'user',
      'hr' : getcurrenttime()

    };
  } else {
      //verificar si ya existe que lo modifique
                  _handleUserSessions('Fecha seleccionada correctamente','calendar_product_user');
  
  }
});
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: 20),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedLevel == 2
                    ? colorBotoomSel.withOpacity(0.8)
                    : colorBotoom.withOpacity(0.4),
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: selectedLevel == 2
                      ? colorBotoomSel.withOpacity(0.4)
                      : colorBotoom.withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: Text(
                _selectedDateRange != null
                    ? 'Fecha de Compra : ${_formatDateTimeProduct(_selectedDateRange!.start)}'
                    : 'Fecha de Compra : No seleccionada',
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedLevel == 2
                    ? colorBotoomSel.withOpacity(0.8)
                    : colorBotoom.withOpacity(0.4),
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: selectedLevel == 2
                      ? colorBotoomSel.withOpacity(0.4)
                      : colorBotoom.withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: Text(
                _selectedDateRange != null
                    ? 'Fecha de Vencimiento : ${_formatDateTimeProduct(_selectedDateRange!.end)}'
                    : 'Fecha de Vencimiento : No seleccionada',
              ),
            ),
          ),
          
         
        ],
      );
 }

// ============================================ PRODUCT SECTION FIN ============================================
//
//
//CARGAR ALGUN MODULO QUE HAGA FALTA


}
