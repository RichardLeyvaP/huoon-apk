import 'package:huoon/data/models/filesUsser/filesUsser_model.dart';
import 'package:signals/signals.dart';

// Definición de las señales
final Signal<FileElement?> fileElementFU = Signal<FileElement?>(null); // Configuración actual
final Signal<List<FileElement>?> listFileElementFU = Signal<List<FileElement>?>(null);
final Signal<bool> isLoadingFU = Signal<bool>(false); // Indicador de carga
final Signal<bool?> updatefileElementFU = Signal<bool?>(null); // Indicador de carga
final Signal<String?> errorDescriptionFU = Signal<String?>(null); // Descripción del error