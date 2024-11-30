import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/ui/pages/rol-admin/chat/signal/audio_signal.dart';
import 'package:signals/signals_flutter.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isRecording = false; // Estado de grabación de audio
  final ScrollController _scrollController = ScrollController(); // Controlador del ListView
  late FocusNode focusNode; // Declara el FocusNode

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode(); // Inicializa el FocusNode
    initializeRecorder(); // Inicializar grabador
  }

  @override
  void dispose() {
    audioDispose(); // Liberar recursos del grabador
    focusNode.dispose(); // Asegúrate de liberar el FocusNode
    super.dispose();
  }

  void toggleRecording() async {
    if (isRecording) {
      await stopRecording(); // Detener grabación
    } else {
      await startRecording(); // Iniciar grabación
    }
    setState(() {
      isRecording = !isRecording;
    });
  }

  void _scrollToBottom() {
    // Desplazar hacia el último mensaje
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _scrollToBottom();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 221, 223, 231),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      GoRouter.of(context).go(
                        '/HomePrincipal',
                      );
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 5,
                ),
                Text('Pacho Pére', style: TextStyle(fontSize: 18, color: Colors.black)),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: CircleAvatar(
                backgroundColor: activeUser.watch(context) == 1
                    ? const Color.fromARGB(120, 141, 189, 228)
                    : const Color.fromARGB(120, 76, 175, 79),
                child: Text(
                  '$activeUser',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              onPressed: () {
                activeUser.value = activeUser.value == 1 ? 2 : 1; // Cambiar usuario activo
              },
            ),
          ],
          // bottom: const PreferredSize(
          //   preferredSize: Size.fromHeight(1.0),
          //   child: Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(50, 158, 158, 158)),
          // ),
        ),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white, // Cambia el color según lo necesites
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0), // Ajusta el radio según lo necesites
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController, // Asociar el controlador
                    padding: const EdgeInsets.all(16.0),
                    itemCount: messages.watch(context).length,
                    itemBuilder: (context, index) {
                      final message = messages.watch(context)[index];
                      bool isCurrentUser = message['user'] == '1';

                      // Verifica si es el último mensaje para aplicar la animación
                      final isLastMessage = index == messages.watch(context).length - 1;

                      final messageWidget = message['type'] == 'text'
                          ? showTextMessages(message, isCurrentUser)
                          : showAudioMessages(index, message, isCurrentUser);

                      return isLastMessage
                          ? BounceInDown(
                              duration: const Duration(milliseconds: 800),
                              child: InkWell(
                                onDoubleTap: () {
                                  showDeleteConfirmationDialog(context, index);
                                },
                                child: messageWidget,
                              ),
                            )
                          : InkWell(
                              onDoubleTap: () {
                                showDeleteConfirmationDialog(context, index);
                              },
                              child: messageWidget,
                            );
                    },
                  ),
                ),
                optionSend(),
                const SizedBox(height: 16),
              ],
            ),
          ),
          // Positioned(
          //   top: -50, // Para centrar verticalmente
          //   left: MediaQuery.of(context).size.width / 2 - 50, // Para centrar horizontalmente
          //   child: const CircleAvatar(
          //     maxRadius: 45,
          //     backgroundColor: Color.fromARGB(255, 221, 223, 231),
          //     child: Padding(
          //       padding: EdgeInsets.only(top: 30),
          //       child: Text('Hoy'),
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }

  Padding optionSend() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController.value,
              focusNode: focusNode, // Asigna el FocusNode
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    sendMessage({
                      'text': messageController.value.text,
                      'type': 'text',
                      'user': activeUser.toString(),
                      'date': DateTime.now().toString(),
                    });
                    focusNode.requestFocus(); // Devuelve el foco al TextField
                  },
                ),
              ),
              onSubmitted: (value) {
                sendMessage({
                  'text': value,
                  'type': 'text',
                  'user': activeUser.toString(),
                  'date': DateTime.now().toString(),
                });
                focusNode
                    .requestFocus(); // Devuelve el foco al TextField                FocusScope.of(context).requestFocus(FocusNode()); //abro el teclado
              },
              textInputAction: TextInputAction.none, // Desactiva el comportamiento de cierre automático
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              isRecording ? Icons.stop : Icons.mic,
              color: isRecording ? Colors.red : Colors.blue,
            ),
            onPressed: toggleRecording,
          ),
        ],
      ),
    );
  }

  Padding showAudioMessages(int index, Map<String, Object> message, bool isCurrentUser) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.blue[100] : Colors.green[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    playingIndex.watch(context) == index ? Icons.stop : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () => togglePlaying(message['path']!.toString(), index),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Audio',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            message['date']!.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Padding showTextMessages(Map<String, Object> message, bool isCurrentUser) {
    return Padding(
      padding: EdgeInsets.only(right: isCurrentUser ? 5 : 50, top: 5, left: isCurrentUser ? 50 : 5, bottom: 5),
      child: Row(
        mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: isCurrentUser ? Colors.blue[100] : Colors.green[100],
                  borderRadius: isCurrentUser
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                      : const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    message['text']!.toString(),
                    style: const TextStyle(fontSize: 16),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message['date']!.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return FadeInUpBig(
          duration: Duration(milliseconds: 600),
          child: AlertDialog(
            title: const Text('¿Quieres eliminar el archivo?'),
            actions: [
              TextButton(
                onPressed: () {
                  _scrollToBottom();
                  Navigator.of(context).pop(); // Cierra el modal
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  removeMessageAtIndex(index); // Elimina el mensaje
                  Navigator.of(context).pop(); // Cierra el modal
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
      },
    );
  }

  void removeMessageAtIndex(int index) {
    final currentMessages = messages.value;
    if (index >= 0 && index < currentMessages.length) {
      currentMessages.removeAt(index); // Elimina el mensaje en el índice especificado
      messages.value = List.from(currentMessages); // Actualiza el estado
    }
  }
}
