import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_signal.dart';
import 'package:huoon/ui/Components/category_widget.dart';
import 'package:signals/signals_flutter.dart';

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
  int? _editingMessageIndex;
  bool _showInputField = true;
  bool _isFinalStepReached = false;

  final List<Map<String, String>> _conversationSteps = [
    {'key': 'title', 'message': 'Por favor, ¿me puedes dar el título de la tarea?', 'hint': 'Título de la tarea'},
    {'key': 'description', 'message': 'Perfecto. Ahora, ¿puedes darme una breve descripción?', 'hint': 'Descripción de la tarea'},
    {'key': 'category', 'message': 'Gracias. ¿A qué categoría pertenece esta tarea?', 'hint': 'Categoría de la tarea'},
    {'key': 'done', 'message': '¡Genial! He registrado todos los datos. ¿Quieres guardar la tarea?', 'hint': 'Confirmar tarea'}
  ];

  List<int> arrayCategory = [1];

  @override
  void initState() {
    super.initState();
    _showInitialMessages();
  }

  void _showInitialMessages() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _messages.add({'key': 'init','text': 'Hola, Ramón. Vi que quieres agregar una nueva tarea.', 'sender': 'bot'});
    });
    await Future.delayed(Duration(milliseconds: 1500));
    _simulateResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Tarea')),
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
                //saber en que paso estoy para saber que componente mostrar
                String? keyMessage;
                if(message['key'] != null) {
                   keyMessage = message['key'] ;
                }

                return GestureDetector(
                  onLongPress: isUser ? () => _showEditOption(index) : null,
                  child: Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue[100] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                      showWidget(message,keyMessage,isUser) ,
                      
                     
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text('Escribiendo...',style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          if (_showInputField) _buildInputField(),
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

    if (_editingMessageIndex != null) {
      // Editar mensaje existente
      setState(() {
        _messages[_editingMessageIndex!] = {'text': input, 'sender': 'user'};
        _editingMessageIndex = null;
        _showInputField = !_isFinalStepReached; // Ocultar solo si se alcanzó el paso final
      });
    } else {
      // Nuevo mensaje
      setState(() {
        _messages.insert(0, {'text': input, 'sender': 'user'}); // Insertar al inicio
      });

      // Guardar datos
      final currentStepKey = _conversationSteps[_currentStep]['key'];
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
    _textController.clear();
  }

  void _simulateResponse() async {
    setState(() {
      _isTyping = true;
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

  void _startEditing(int index) {
    setState(() {
      _editingMessageIndex = index;
      _textController.text = _messages[index]['text'];
      _showInputField = true; // Mostrar el campo de texto al editar
    });
  }

  void _handleConfirmation(bool isSave) async {
    setState(() {
      _messages.insert(0, {
        'key': 'end',
        'end' : 'end',
        'text': isSave
            ? 'Perfecto Ramón, estamos guardando la nueva tarea que creaste... solo un momento.'
            : 'Entendido Ramón, estamos cancelando la creación de la tarea... solo un momento.',
        'sender': 'bot'
      });
    });

    await Future.delayed(Duration(seconds: 3));

    GoRouter.of(context).go(
      '/HomePrincipal',
      extra: {
        'name': '',
        'email': '',
        'avatarUrl': '',
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  
 Widget showWidget(Map<String, dynamic> message, String? keyMessage, bool isUser) {
  print('este es el Key de la tarea-$keyMessage');
 
 if(message['buttons'] == null)//aun no es el final
 {
   if( message['end'] != null)
   {
   return Column(
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
      return Column(
        children: [
          Text(message['text'] ?? ''),
          _buildCategorySection(),

        ],
      );

    }
    else {
      return Text(message['text'] ?? '');
    }

   }

 }
 else //ya lleg[o al final y esta el cancelar o guardar
 {
 return Column(
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


  Widget _buildCategorySection() {
    return Builder(
      builder: (context) {
        if (categoriesCSP.watch(context) != null) {
          bool selectMultiple = false;
          // if (widget.id != 0) {
          //   //es modificar
          // } else //es insertar que cargue el primero por defecto
          // {
          //   if (categoriesCSP.value!.isNotEmpty) {
          //     onCategorySelected(categoriesCSP.value!.first.id);
          //   }
          // }

          return CategoryWidget(
            eventDetails: false,
            fitTextContainer: false,
            categories: categoriesCSP.value!,
            titleWidget: '',
            selectedCategoryId: selectedCategoryIdCSP.value,
            selectMultiple: selectMultiple,
            onSelectionChanged: (selectedCategories) async {
              FocusScope.of(context).unfocus();

              // print('kkkkkkkkkkk:${selectedCategories}');

              arrayCategory = selectedCategories.map((category) => category.id).toList();
              if (arrayCategory.isNotEmpty) {
                print('Estados seleccionados-elementos de la primera pagina:${arrayCategory.first}');
                onCategorySelected(arrayCategory.first);
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
