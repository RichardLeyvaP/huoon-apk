// import 'package:flutter/material.dart';
// import 'package:huoon/ui/pages/rol-admin/chat/signal/audio_signal.dart';
// import 'package:signals/signals_flutter.dart';

// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   @override
//   void initState() {
//     super.initState();
//     initializeRecorder();
//   }

//   @override
//   void dispose() {
//     audioDispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 50,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: Center(
//             child: Column(
//               children: [
//                 Text('Huoon-Chat', style: TextStyle(fontSize: 18, color: Colors.black)),
//                 Text('comunicación directa', style: TextStyle(fontSize: 10, color: Color.fromARGB(150, 0, 0, 0))),
//               ],
//             ),
//           ),
//           actions: const [
//             Padding(
//               padding: EdgeInsets.only(right: 10.0),
//               child: Icon(Icons.close, color: Colors.black),
//             ),
//           ],
//           bottom: const PreferredSize(
//             preferredSize: Size.fromHeight(1.0),
//             child: Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(50, 158, 158, 158)),
//           ),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.all(16.0),
//                 itemCount: messages.watch(context).length,
//                 itemBuilder: (context, index) {
//                   final message = messages.watch(context)[index];
//                   if (message['type'] == 'text') {
//                     // Mostrar el mensaje de texto
//                     return InkWell(
//                         onDoubleTap: () {
//                           showDeleteConfirmationDialog(context, index);
//                         },
//                         child: showTextMessages(message));
//                   } else {
//                     // Mostrar el archivo de audio
//                     return InkWell(
//                         onDoubleTap: () {
//                           showDeleteConfirmationDialog(context, index);
//                         },
//                         child: showAudioMessages(index, message));
//                   }
//                 },
//               ),
//             ),
//             optionSend(),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }

//   Padding optionSend() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: messageController.value,
//               decoration: InputDecoration(
//                 hintText: 'Escribe un mensaje',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 filled: true,
//                 contentPadding: const EdgeInsets.symmetric(
//                   vertical: 8.0,
//                   horizontal: 16.0,
//                 ),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {
//                     // Llama a la función sendMessage de tu servicio de signals
//                     sendMessage(messageController.watch(context).text);
//                     // Limpia el campo de texto después de enviar el mensaje

//                     // Lógica para enviar mensaje de texto
//                   },
//                 ),
//               ),
//               onSubmitted: sendMessage,
//             ),
//           ),
//           const SizedBox(width: 8),
//           IconButton(
//             icon: Icon(
//               isRecording.watch(context) ? Icons.stop : Icons.mic,
//               color: isRecording.watch(context) ? Colors.red : Colors.blue,
//             ),
//             onPressed: () async {
//               if (isRecording.watch(context)) {
//                 await stopRecording();
//               } else {
//                 await startRecording();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Padding showAudioMessages(int index, Map<String, String> message) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10.0),
//             decoration: BoxDecoration(
//               color: Colors.green[100],
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     playingIndex.watch(context) == index ? Icons.stop : Icons.play_arrow,
//                     color: Colors.white,
//                   ),
//                   onPressed: () => togglePlaying(message['path']!, index),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(
//                   'Audio',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           Text(
//             message['date']!,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void showDeleteConfirmationDialog(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('¿Quieres eliminar el archivo?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Cierra el modal
//               },
//               child: const Text('Cancelar'),
//             ),
//             TextButton(
//               onPressed: () {
//                 removeMessageAtIndex(index); // Elimina el mensaje
//                 Navigator.of(context).pop(); // Cierra el modal
//               },
//               child: const Text('Aceptar'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Padding showTextMessages(Map<String, String> message) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Flexible(
//             // Usa Flexible para evitar overflow
//             child: Container(
//               padding: const EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 color: Colors.blue[100],
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     message['text']!,
//                     style: const TextStyle(fontSize: 16),
//                     softWrap: true, // Permite que el texto se ajuste
//                     overflow: TextOverflow.visible, // Muestra todo el texto sin cortarlo
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     message['date']!,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
