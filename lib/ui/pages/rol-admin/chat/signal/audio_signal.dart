import 'dart:io';

//import 'package:audio_note_flutter/injector.dart';
//import 'package:audio_note_flutter/services/firebase.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signals/signals_flutter.dart';

//todo ****** VARIABLES ******
final recorder = signal<FlutterSoundRecorder>(FlutterSoundRecorder());
final player = signal<FlutterSoundPlayer>(FlutterSoundPlayer());
final messageController = signal<TextEditingController>(TextEditingController());
final isRecording = signal(false);
final isPlaying = signal(false);
final playingIndex = signal<int?>(null);
final activeUser = signal<int>(1);
final currentFilePath = signal<String?>(null);
final messages = signal<List<Map<String, Object>>>([]);

//todo ****** METODOS ******
// Inicializar grabadora y reproductor
Future<void> initializeRecorder() async {
  await Permission.microphone.request();
  await recorder.value.openRecorder();
  await player.value.openPlayer();
}

Future<void> audioDispose() async {
  await recorder.value.closeRecorder();
  await player.value.closePlayer();
}

Future<String> getNextRecordingFileName() async {
  final directory = await getApplicationDocumentsDirectory();
  int counter = 1;
  // Verifica si ya existen archivos grabados y encuentra el siguiente número disponible
  while (File('${directory.path}/recording_$counter.wav').existsSync()) {
    counter++;
  }
  // Devuelve el nombre de archivo incrementado
  return '${directory.path}/recording_$counter.wav';
}

Future<void> startRecording() async {
  try {
    currentFilePath.value = await getNextRecordingFileName();
    await recorder.value.startRecorder(toFile: currentFilePath.value);

    isRecording.value = true;
  } catch (e) {
    print('Ocurrio el siguiente error al intentar grabar audio:$e');
  }
}

Future<void> stopRecording() async {
  await recorder.value.stopRecorder();
  if (currentFilePath.value != null) {
    final recordingInfo = {
      'path': currentFilePath.value.toString(),
      'date': DateTime.now().toLocal().toString().substring(0, 19),
      'type': 'audio', // Indica que es un archivo de audio
      'user': activeUser.toString(),
    };

    messages.value.add(recordingInfo);
    // messages.value.insert(0, recordingInfo);
    messages.value = List.from(messages.value); // Notifica a las señales que la lista ha cambiado
    isRecording.value = false;
  }
}

Future<void> togglePlaying(String filePath, int index) async {
  if (isPlaying.value) {
    await player.value.stopPlayer();

    isPlaying.value = false;
    playingIndex.value = null;
  } else {
    await player.value.startPlayer(
      fromURI: filePath,
      whenFinished: () {
        isPlaying.value = false;
        playingIndex.value = null;
      },
    );

    isPlaying.value = true;
    playingIndex.value = index;
  }
}

void sendMessage(Map<String, Object> message) {
  final currentMessages = messages.value;
  currentMessages.add(message);
  messages.value = List.from(currentMessages); // Actualiza la lista de mensajes
  print('Lista de mensajes:${messages.value}');
  messageController.value.clear(); // Limpia el campo de texto
}

void removeMessageAtIndex(int index) {
  if (index >= 0 && index < messages.value.length) {
    messages.value.removeAt(index); // Elimina el mensaje en la posición 'index'
    messages.value = List.from(messages.value); // Notifica el cambio
  } else {
    print("Índice fuera de rango");
  }
}
