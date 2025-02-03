// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigurationsAppImpl _$$ConfigurationsAppImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfigurationsAppImpl(
      configurations: (json['configurations'] as List<dynamic>)
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ConfigurationsAppImplToJson(
        _$ConfigurationsAppImpl instance) =>
    <String, dynamic>{
      'configurations': instance.configurations,
    };

_$ConfigurationImpl _$$ConfigurationImplFromJson(Map<String, dynamic> json) =>
    _$ConfigurationImpl(
      id: (json['id'] as num?)?.toInt(),
      cantHome: (json['cantHome'] as num?)?.toInt(),
      home: (json['home'] as num?)?.toInt(),
      appName: json['appName'] as String?,
      tokenNotification: json['tokenNotification'] as String?,
      appVersion: json['appVersion'] as String?,
      language: json['language'] as String?,
      defaultCurrency: json['defaultCurrency'] as String?,
      themeColor: json['themeColor'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      textColor: json['textColor'] as String?,
      buttonColor: json['buttonColor'] as String?,
      isDarkModeEnabled: json['isDarkModeEnabled'] as bool?,
      notificationsEnabled: json['notificationsEnabled'] as bool?,
      apiEndpoint: json['apiEndpoint'] as String?,
      connectionTimeout: (json['connectionTimeout'] as num?)?.toInt(),
      retryAttempts: (json['retryAttempts'] as num?)?.toInt(),
      useBiometricAuth: json['useBiometricAuth'] as bool?,
      requirePinForSensitiveActions:
          json['requirePinForSensitiveActions'] as bool?,
      storagePath: json['storagePath'] as String?,
      maxCacheSize: (json['maxCacheSize'] as num?)?.toInt(),
      autoUpdateEnabled: json['autoUpdateEnabled'] as bool?,
      supportContactEmail: json['supportContactEmail'] as String?,
      lastSyncTime: json['lastSyncTime'] as String?,
      fontSize: (json['fontSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ConfigurationImplToJson(_$ConfigurationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cantHome': instance.cantHome,
      'home': instance.home,
      'appName': instance.appName,
      'tokenNotification': instance.tokenNotification,
      'appVersion': instance.appVersion,
      'language': instance.language,
      'defaultCurrency': instance.defaultCurrency,
      'themeColor': instance.themeColor,
      'backgroundColor': instance.backgroundColor,
      'textColor': instance.textColor,
      'buttonColor': instance.buttonColor,
      'isDarkModeEnabled': instance.isDarkModeEnabled,
      'notificationsEnabled': instance.notificationsEnabled,
      'apiEndpoint': instance.apiEndpoint,
      'connectionTimeout': instance.connectionTimeout,
      'retryAttempts': instance.retryAttempts,
      'useBiometricAuth': instance.useBiometricAuth,
      'requirePinForSensitiveActions': instance.requirePinForSensitiveActions,
      'storagePath': instance.storagePath,
      'maxCacheSize': instance.maxCacheSize,
      'autoUpdateEnabled': instance.autoUpdateEnabled,
      'supportContactEmail': instance.supportContactEmail,
      'lastSyncTime': instance.lastSyncTime,
      'fontSize': instance.fontSize,
    };
