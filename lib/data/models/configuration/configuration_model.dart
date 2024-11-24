// lib/data/models/configuration/configuration_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'configuration_model.freezed.dart';
part 'configuration_model.g.dart';

@freezed
class ConfigurationsApp with _$ConfigurationsApp {
  const factory ConfigurationsApp({
    required List<Configuration> configurations,
  }) = _ConfigurationsApp;
  factory ConfigurationsApp.fromJson(Map<String, Object?> json) => _$ConfigurationsAppFromJson(json);
}

@freezed
class Configuration with _$Configuration {
  const factory Configuration({
    int? id,
    String? appName,
    String? appVersion,
    String? language,
    String? defaultCurrency,
    String? themeColor,
    String? backgroundColor,
    String? textColor,
    String? buttonColor,
    bool? isDarkModeEnabled,
    bool? notificationsEnabled,
    String? apiEndpoint,
    int? connectionTimeout,
    int? retryAttempts,
    bool? useBiometricAuth,
    bool? requirePinForSensitiveActions,
    String? storagePath,
    int? maxCacheSize,
    bool? autoUpdateEnabled,
    String? supportContactEmail,
    String? lastSyncTime,
    int? fontSize,
  }) = _Configuration;
  factory Configuration.fromJson(Map<String, Object?> json) => _$ConfigurationFromJson(json);
}
