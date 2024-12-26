import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huoon/domain/blocs/configuration_bloc/configuration_signal.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
   final String apiKey = "aqui la api key"; // Sustituye con tu API Key
late final Map<String, String> _initialMessage;



 //**variables del dataTimer */
bool isActive = true; // Variable para alternar colores
int isActive2seg = 1; // Variable para alternar colores
Timer? _timer;

String getLanguageName(String? languageCode) {
  const languageMap = {
    'en': 'Inglés',
    'es': 'Español',
    'pt': 'Portugués',
  };
  return languageMap[languageCode] ?? 'Español';
}
  @override
  void initState() {
    super.initState();

      // Inicializar el mensaje inicial con el idioma
    final String language = getLanguageName(configurationCF.value?.language);
    _initialMessage = {
      "role": "system",
      "content":
          "Actúa como un experto en viajes. Responde preguntas relacionadas con destinos, itinerarios, recomendaciones y consejos de viaje. Todas las respuestas deben estar en $language ."
    };
    print('_initialMessage:$_initialMessage');
    // Añadimos el mensaje inicial a los mensajes internos
    _messages.add(_initialMessage);

    //
    //
    
    // Iniciar un temporizador que cambie el estado cada 2 segundos
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) { // Verifica si el widget sigue montado
    //verifico si ya pasaron 10segundos le mando un mensaje
    
   


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

  Future<void> _sendMessage(String userMessage) async {
    setState(() {
      _messages.add({"role": "user", "content": userMessage});
    });

    final url = Uri.parse("https://api.openai.com/v1/chat/completions");

    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": _messages,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes)); // Decodificar UTF-8
        final String botResponse = data['choices'][0]['message']['content'];

        setState(() {
          _messages.add({"role": "assistant", "content": botResponse});
        });
      } else {
        setState(() {
          _messages.add({
            "role": "assistant",
            "content": "Error: ${response.reasonPhrase}"
          });
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({"role": "assistant", "content": "Error de conexión"});
      });
    }
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
                
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HUOON',style: TextStyle(height: 1.2,fontSize: 18,fontWeight:FontWeight.bold,color: Colors.black ),),
                  Text('Dime que necesitas',style: TextStyle(height: 1.2,fontSize: 12,color: Color.fromARGB(120, 0, 0, 0) ),),
          
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
              itemCount: _messages.length - 1, // Ignoramos el mensaje inicial
              itemBuilder: (context, index) {
                final message = _messages[index + 1]; // Saltamos el inicial
                return Align(
                  alignment: message["role"] == "user"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message["role"] == "user"
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message["content"] ?? "",
                      style: TextStyle(
                        color: message["role"] == "user"
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Escribe tu pregunta...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final userMessage = _controller.text;
                    if (userMessage.isNotEmpty) {
                      _controller.clear();
                      _sendMessage(userMessage);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

