import 'package:huoon/data/models/configuration/configuration_model.dart';
import 'package:signals/signals.dart';

// Definición de las señales
final Signal<Configuration?> configurationCF = Signal<Configuration?>(null); // Configuración actual
final Signal<bool> isLoadingCF = Signal<bool>(false); // Indicador de carga
final Signal<bool?> updateConfigurationCF = Signal<bool?>(null); // Indicador de carga
final Signal<String?> errorDescriptionCF = Signal<String?>(null); // Descripción del error
final Signal<int> fontSizeCF = Signal<int>(14); // Tamaño de la fuente
