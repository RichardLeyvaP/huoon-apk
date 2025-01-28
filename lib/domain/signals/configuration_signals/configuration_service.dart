import 'package:huoon/data/models/configuration/configuration_model.dart';
import 'package:huoon/data/repository/configurationRepository.dart';
import 'package:huoon/data/services/globalApiService.dart';
import 'package:huoon/domain/signals/configuration_signals/configuration_signal.dart';
import 'package:huoon/ui/util/utilClass.dart';

// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
final ConfigurationRepository configurationRepository = ConfigurationRepository(authService: ApiService());

// Funciones para manejar las acciones y actualizar las señales

// Solicitar configuración
Future<void> requestConfiguration() async {
  isLoadingCF.value = true;
  errorDescriptionCF.value = null;

  try {
    final result = await configurationRepository.getConfigurations();
    if (result is String) {
      errorDescriptionCF.value = result; // Error en la obtención
      TranslationManager.loadDefaultTranslations('es');
    } else if (result is Configuration) {
      configurationCF.value = result; // Éxito en la obtención
      TranslationManager.loadDefaultTranslations(configurationCF.value!.language.toString());
    }
  } catch (error) {
    TranslationManager.loadDefaultTranslations('es');
    errorDescriptionCF.value = error.toString(); // Error inesperado
  } finally {
    isLoadingCF.value = false;
  }
}

// Actualizar configuración localmente
void updateConfiguration(Configuration updatedConfig) {
  updateConfigurationCF.value = null;
//  print('idioma:${configurationCF.value!.language}');
  if (configurationCF.value != null) {
    if (updatedConfig.language != null) {
      updateConfigurationCF.value = true;
    }
    configurationCF.value = configurationCF.value!.copyWith(
      language: updatedConfig.language ?? configurationCF.value!.language,
      themeColor: updatedConfig.themeColor ?? configurationCF.value!.themeColor,
      appName: updatedConfig.appName ?? configurationCF.value!.appName,
    );
    submitConfiguration();
  } else {
    errorDescriptionCF.value = "Configuración no inicializada.";
  }
}

// Enviar configuración actualizada a la API
Future<void> submitConfiguration() async {
  if (configurationCF.value != null) {
    try {
      await configurationRepository.updateConfiguration(configurationCF.value!);
    } catch (error) {
      errorDescriptionCF.value = error.toString();
    }
  }
}

// Aumentar el tamaño de fuente
void increaseFontSize(dynamic fontSize) {
  fontSize.value += 1;
}

void clearConfigurationSignals() {
  // Restablecer las señales a sus valores predeterminados
  configurationCF.value = null;
  isLoadingCF.value = false;
  updateConfigurationCF.value = null;
  errorDescriptionCF.value = null;
  fontSizeCF.value = 14;
}
