// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configuration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfigurationsApp _$ConfigurationsAppFromJson(Map<String, dynamic> json) {
  return _ConfigurationsApp.fromJson(json);
}

/// @nodoc
mixin _$ConfigurationsApp {
  List<Configuration> get configurations => throw _privateConstructorUsedError;

  /// Serializes this ConfigurationsApp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigurationsApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigurationsAppCopyWith<ConfigurationsApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationsAppCopyWith<$Res> {
  factory $ConfigurationsAppCopyWith(
          ConfigurationsApp value, $Res Function(ConfigurationsApp) then) =
      _$ConfigurationsAppCopyWithImpl<$Res, ConfigurationsApp>;
  @useResult
  $Res call({List<Configuration> configurations});
}

/// @nodoc
class _$ConfigurationsAppCopyWithImpl<$Res, $Val extends ConfigurationsApp>
    implements $ConfigurationsAppCopyWith<$Res> {
  _$ConfigurationsAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigurationsApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configurations = null,
  }) {
    return _then(_value.copyWith(
      configurations: null == configurations
          ? _value.configurations
          : configurations // ignore: cast_nullable_to_non_nullable
              as List<Configuration>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigurationsAppImplCopyWith<$Res>
    implements $ConfigurationsAppCopyWith<$Res> {
  factory _$$ConfigurationsAppImplCopyWith(_$ConfigurationsAppImpl value,
          $Res Function(_$ConfigurationsAppImpl) then) =
      __$$ConfigurationsAppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Configuration> configurations});
}

/// @nodoc
class __$$ConfigurationsAppImplCopyWithImpl<$Res>
    extends _$ConfigurationsAppCopyWithImpl<$Res, _$ConfigurationsAppImpl>
    implements _$$ConfigurationsAppImplCopyWith<$Res> {
  __$$ConfigurationsAppImplCopyWithImpl(_$ConfigurationsAppImpl _value,
      $Res Function(_$ConfigurationsAppImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfigurationsApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configurations = null,
  }) {
    return _then(_$ConfigurationsAppImpl(
      configurations: null == configurations
          ? _value._configurations
          : configurations // ignore: cast_nullable_to_non_nullable
              as List<Configuration>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigurationsAppImpl implements _ConfigurationsApp {
  const _$ConfigurationsAppImpl(
      {required final List<Configuration> configurations})
      : _configurations = configurations;

  factory _$ConfigurationsAppImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigurationsAppImplFromJson(json);

  final List<Configuration> _configurations;
  @override
  List<Configuration> get configurations {
    if (_configurations is EqualUnmodifiableListView) return _configurations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_configurations);
  }

  @override
  String toString() {
    return 'ConfigurationsApp(configurations: $configurations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigurationsAppImpl &&
            const DeepCollectionEquality()
                .equals(other._configurations, _configurations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_configurations));

  /// Create a copy of ConfigurationsApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigurationsAppImplCopyWith<_$ConfigurationsAppImpl> get copyWith =>
      __$$ConfigurationsAppImplCopyWithImpl<_$ConfigurationsAppImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigurationsAppImplToJson(
      this,
    );
  }
}

abstract class _ConfigurationsApp implements ConfigurationsApp {
  const factory _ConfigurationsApp(
          {required final List<Configuration> configurations}) =
      _$ConfigurationsAppImpl;

  factory _ConfigurationsApp.fromJson(Map<String, dynamic> json) =
      _$ConfigurationsAppImpl.fromJson;

  @override
  List<Configuration> get configurations;

  /// Create a copy of ConfigurationsApp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigurationsAppImplCopyWith<_$ConfigurationsAppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return _Configuration.fromJson(json);
}

/// @nodoc
mixin _$Configuration {
  int? get id => throw _privateConstructorUsedError;
  int? get cantHome => throw _privateConstructorUsedError;
  String? get appName => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get defaultCurrency => throw _privateConstructorUsedError;
  String? get themeColor => throw _privateConstructorUsedError;
  String? get backgroundColor => throw _privateConstructorUsedError;
  String? get textColor => throw _privateConstructorUsedError;
  String? get buttonColor => throw _privateConstructorUsedError;
  bool? get isDarkModeEnabled => throw _privateConstructorUsedError;
  bool? get notificationsEnabled => throw _privateConstructorUsedError;
  String? get apiEndpoint => throw _privateConstructorUsedError;
  int? get connectionTimeout => throw _privateConstructorUsedError;
  int? get retryAttempts => throw _privateConstructorUsedError;
  bool? get useBiometricAuth => throw _privateConstructorUsedError;
  bool? get requirePinForSensitiveActions => throw _privateConstructorUsedError;
  String? get storagePath => throw _privateConstructorUsedError;
  int? get maxCacheSize => throw _privateConstructorUsedError;
  bool? get autoUpdateEnabled => throw _privateConstructorUsedError;
  String? get supportContactEmail => throw _privateConstructorUsedError;
  String? get lastSyncTime => throw _privateConstructorUsedError;
  int? get fontSize => throw _privateConstructorUsedError;

  /// Serializes this Configuration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Configuration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigurationCopyWith<Configuration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationCopyWith<$Res> {
  factory $ConfigurationCopyWith(
          Configuration value, $Res Function(Configuration) then) =
      _$ConfigurationCopyWithImpl<$Res, Configuration>;
  @useResult
  $Res call(
      {int? id,
      int? cantHome,
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
      int? fontSize});
}

/// @nodoc
class _$ConfigurationCopyWithImpl<$Res, $Val extends Configuration>
    implements $ConfigurationCopyWith<$Res> {
  _$ConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Configuration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cantHome = freezed,
    Object? appName = freezed,
    Object? appVersion = freezed,
    Object? language = freezed,
    Object? defaultCurrency = freezed,
    Object? themeColor = freezed,
    Object? backgroundColor = freezed,
    Object? textColor = freezed,
    Object? buttonColor = freezed,
    Object? isDarkModeEnabled = freezed,
    Object? notificationsEnabled = freezed,
    Object? apiEndpoint = freezed,
    Object? connectionTimeout = freezed,
    Object? retryAttempts = freezed,
    Object? useBiometricAuth = freezed,
    Object? requirePinForSensitiveActions = freezed,
    Object? storagePath = freezed,
    Object? maxCacheSize = freezed,
    Object? autoUpdateEnabled = freezed,
    Object? supportContactEmail = freezed,
    Object? lastSyncTime = freezed,
    Object? fontSize = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cantHome: freezed == cantHome
          ? _value.cantHome
          : cantHome // ignore: cast_nullable_to_non_nullable
              as int?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultCurrency: freezed == defaultCurrency
          ? _value.defaultCurrency
          : defaultCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      themeColor: freezed == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor: freezed == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String?,
      buttonColor: freezed == buttonColor
          ? _value.buttonColor
          : buttonColor // ignore: cast_nullable_to_non_nullable
              as String?,
      isDarkModeEnabled: freezed == isDarkModeEnabled
          ? _value.isDarkModeEnabled
          : isDarkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      notificationsEnabled: freezed == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      apiEndpoint: freezed == apiEndpoint
          ? _value.apiEndpoint
          : apiEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      connectionTimeout: freezed == connectionTimeout
          ? _value.connectionTimeout
          : connectionTimeout // ignore: cast_nullable_to_non_nullable
              as int?,
      retryAttempts: freezed == retryAttempts
          ? _value.retryAttempts
          : retryAttempts // ignore: cast_nullable_to_non_nullable
              as int?,
      useBiometricAuth: freezed == useBiometricAuth
          ? _value.useBiometricAuth
          : useBiometricAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
      requirePinForSensitiveActions: freezed == requirePinForSensitiveActions
          ? _value.requirePinForSensitiveActions
          : requirePinForSensitiveActions // ignore: cast_nullable_to_non_nullable
              as bool?,
      storagePath: freezed == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      maxCacheSize: freezed == maxCacheSize
          ? _value.maxCacheSize
          : maxCacheSize // ignore: cast_nullable_to_non_nullable
              as int?,
      autoUpdateEnabled: freezed == autoUpdateEnabled
          ? _value.autoUpdateEnabled
          : autoUpdateEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      supportContactEmail: freezed == supportContactEmail
          ? _value.supportContactEmail
          : supportContactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSyncTime: freezed == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as String?,
      fontSize: freezed == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigurationImplCopyWith<$Res>
    implements $ConfigurationCopyWith<$Res> {
  factory _$$ConfigurationImplCopyWith(
          _$ConfigurationImpl value, $Res Function(_$ConfigurationImpl) then) =
      __$$ConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? cantHome,
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
      int? fontSize});
}

/// @nodoc
class __$$ConfigurationImplCopyWithImpl<$Res>
    extends _$ConfigurationCopyWithImpl<$Res, _$ConfigurationImpl>
    implements _$$ConfigurationImplCopyWith<$Res> {
  __$$ConfigurationImplCopyWithImpl(
      _$ConfigurationImpl _value, $Res Function(_$ConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Configuration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cantHome = freezed,
    Object? appName = freezed,
    Object? appVersion = freezed,
    Object? language = freezed,
    Object? defaultCurrency = freezed,
    Object? themeColor = freezed,
    Object? backgroundColor = freezed,
    Object? textColor = freezed,
    Object? buttonColor = freezed,
    Object? isDarkModeEnabled = freezed,
    Object? notificationsEnabled = freezed,
    Object? apiEndpoint = freezed,
    Object? connectionTimeout = freezed,
    Object? retryAttempts = freezed,
    Object? useBiometricAuth = freezed,
    Object? requirePinForSensitiveActions = freezed,
    Object? storagePath = freezed,
    Object? maxCacheSize = freezed,
    Object? autoUpdateEnabled = freezed,
    Object? supportContactEmail = freezed,
    Object? lastSyncTime = freezed,
    Object? fontSize = freezed,
  }) {
    return _then(_$ConfigurationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cantHome: freezed == cantHome
          ? _value.cantHome
          : cantHome // ignore: cast_nullable_to_non_nullable
              as int?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultCurrency: freezed == defaultCurrency
          ? _value.defaultCurrency
          : defaultCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      themeColor: freezed == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor: freezed == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String?,
      buttonColor: freezed == buttonColor
          ? _value.buttonColor
          : buttonColor // ignore: cast_nullable_to_non_nullable
              as String?,
      isDarkModeEnabled: freezed == isDarkModeEnabled
          ? _value.isDarkModeEnabled
          : isDarkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      notificationsEnabled: freezed == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      apiEndpoint: freezed == apiEndpoint
          ? _value.apiEndpoint
          : apiEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      connectionTimeout: freezed == connectionTimeout
          ? _value.connectionTimeout
          : connectionTimeout // ignore: cast_nullable_to_non_nullable
              as int?,
      retryAttempts: freezed == retryAttempts
          ? _value.retryAttempts
          : retryAttempts // ignore: cast_nullable_to_non_nullable
              as int?,
      useBiometricAuth: freezed == useBiometricAuth
          ? _value.useBiometricAuth
          : useBiometricAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
      requirePinForSensitiveActions: freezed == requirePinForSensitiveActions
          ? _value.requirePinForSensitiveActions
          : requirePinForSensitiveActions // ignore: cast_nullable_to_non_nullable
              as bool?,
      storagePath: freezed == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      maxCacheSize: freezed == maxCacheSize
          ? _value.maxCacheSize
          : maxCacheSize // ignore: cast_nullable_to_non_nullable
              as int?,
      autoUpdateEnabled: freezed == autoUpdateEnabled
          ? _value.autoUpdateEnabled
          : autoUpdateEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      supportContactEmail: freezed == supportContactEmail
          ? _value.supportContactEmail
          : supportContactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSyncTime: freezed == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as String?,
      fontSize: freezed == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigurationImpl implements _Configuration {
  const _$ConfigurationImpl(
      {this.id,
      this.cantHome,
      this.appName,
      this.appVersion,
      this.language,
      this.defaultCurrency,
      this.themeColor,
      this.backgroundColor,
      this.textColor,
      this.buttonColor,
      this.isDarkModeEnabled,
      this.notificationsEnabled,
      this.apiEndpoint,
      this.connectionTimeout,
      this.retryAttempts,
      this.useBiometricAuth,
      this.requirePinForSensitiveActions,
      this.storagePath,
      this.maxCacheSize,
      this.autoUpdateEnabled,
      this.supportContactEmail,
      this.lastSyncTime,
      this.fontSize});

  factory _$ConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigurationImplFromJson(json);

  @override
  final int? id;
  @override
  final int? cantHome;
  @override
  final String? appName;
  @override
  final String? appVersion;
  @override
  final String? language;
  @override
  final String? defaultCurrency;
  @override
  final String? themeColor;
  @override
  final String? backgroundColor;
  @override
  final String? textColor;
  @override
  final String? buttonColor;
  @override
  final bool? isDarkModeEnabled;
  @override
  final bool? notificationsEnabled;
  @override
  final String? apiEndpoint;
  @override
  final int? connectionTimeout;
  @override
  final int? retryAttempts;
  @override
  final bool? useBiometricAuth;
  @override
  final bool? requirePinForSensitiveActions;
  @override
  final String? storagePath;
  @override
  final int? maxCacheSize;
  @override
  final bool? autoUpdateEnabled;
  @override
  final String? supportContactEmail;
  @override
  final String? lastSyncTime;
  @override
  final int? fontSize;

  @override
  String toString() {
    return 'Configuration(id: $id, cantHome: $cantHome, appName: $appName, appVersion: $appVersion, language: $language, defaultCurrency: $defaultCurrency, themeColor: $themeColor, backgroundColor: $backgroundColor, textColor: $textColor, buttonColor: $buttonColor, isDarkModeEnabled: $isDarkModeEnabled, notificationsEnabled: $notificationsEnabled, apiEndpoint: $apiEndpoint, connectionTimeout: $connectionTimeout, retryAttempts: $retryAttempts, useBiometricAuth: $useBiometricAuth, requirePinForSensitiveActions: $requirePinForSensitiveActions, storagePath: $storagePath, maxCacheSize: $maxCacheSize, autoUpdateEnabled: $autoUpdateEnabled, supportContactEmail: $supportContactEmail, lastSyncTime: $lastSyncTime, fontSize: $fontSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigurationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cantHome, cantHome) ||
                other.cantHome == cantHome) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.defaultCurrency, defaultCurrency) ||
                other.defaultCurrency == defaultCurrency) &&
            (identical(other.themeColor, themeColor) ||
                other.themeColor == themeColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.buttonColor, buttonColor) ||
                other.buttonColor == buttonColor) &&
            (identical(other.isDarkModeEnabled, isDarkModeEnabled) ||
                other.isDarkModeEnabled == isDarkModeEnabled) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.apiEndpoint, apiEndpoint) ||
                other.apiEndpoint == apiEndpoint) &&
            (identical(other.connectionTimeout, connectionTimeout) ||
                other.connectionTimeout == connectionTimeout) &&
            (identical(other.retryAttempts, retryAttempts) ||
                other.retryAttempts == retryAttempts) &&
            (identical(other.useBiometricAuth, useBiometricAuth) ||
                other.useBiometricAuth == useBiometricAuth) &&
            (identical(other.requirePinForSensitiveActions,
                    requirePinForSensitiveActions) ||
                other.requirePinForSensitiveActions ==
                    requirePinForSensitiveActions) &&
            (identical(other.storagePath, storagePath) ||
                other.storagePath == storagePath) &&
            (identical(other.maxCacheSize, maxCacheSize) ||
                other.maxCacheSize == maxCacheSize) &&
            (identical(other.autoUpdateEnabled, autoUpdateEnabled) ||
                other.autoUpdateEnabled == autoUpdateEnabled) &&
            (identical(other.supportContactEmail, supportContactEmail) ||
                other.supportContactEmail == supportContactEmail) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        cantHome,
        appName,
        appVersion,
        language,
        defaultCurrency,
        themeColor,
        backgroundColor,
        textColor,
        buttonColor,
        isDarkModeEnabled,
        notificationsEnabled,
        apiEndpoint,
        connectionTimeout,
        retryAttempts,
        useBiometricAuth,
        requirePinForSensitiveActions,
        storagePath,
        maxCacheSize,
        autoUpdateEnabled,
        supportContactEmail,
        lastSyncTime,
        fontSize
      ]);

  /// Create a copy of Configuration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigurationImplCopyWith<_$ConfigurationImpl> get copyWith =>
      __$$ConfigurationImplCopyWithImpl<_$ConfigurationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigurationImplToJson(
      this,
    );
  }
}

abstract class _Configuration implements Configuration {
  const factory _Configuration(
      {final int? id,
      final int? cantHome,
      final String? appName,
      final String? appVersion,
      final String? language,
      final String? defaultCurrency,
      final String? themeColor,
      final String? backgroundColor,
      final String? textColor,
      final String? buttonColor,
      final bool? isDarkModeEnabled,
      final bool? notificationsEnabled,
      final String? apiEndpoint,
      final int? connectionTimeout,
      final int? retryAttempts,
      final bool? useBiometricAuth,
      final bool? requirePinForSensitiveActions,
      final String? storagePath,
      final int? maxCacheSize,
      final bool? autoUpdateEnabled,
      final String? supportContactEmail,
      final String? lastSyncTime,
      final int? fontSize}) = _$ConfigurationImpl;

  factory _Configuration.fromJson(Map<String, dynamic> json) =
      _$ConfigurationImpl.fromJson;

  @override
  int? get id;
  @override
  int? get cantHome;
  @override
  String? get appName;
  @override
  String? get appVersion;
  @override
  String? get language;
  @override
  String? get defaultCurrency;
  @override
  String? get themeColor;
  @override
  String? get backgroundColor;
  @override
  String? get textColor;
  @override
  String? get buttonColor;
  @override
  bool? get isDarkModeEnabled;
  @override
  bool? get notificationsEnabled;
  @override
  String? get apiEndpoint;
  @override
  int? get connectionTimeout;
  @override
  int? get retryAttempts;
  @override
  bool? get useBiometricAuth;
  @override
  bool? get requirePinForSensitiveActions;
  @override
  String? get storagePath;
  @override
  int? get maxCacheSize;
  @override
  bool? get autoUpdateEnabled;
  @override
  String? get supportContactEmail;
  @override
  String? get lastSyncTime;
  @override
  int? get fontSize;

  /// Create a copy of Configuration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigurationImplCopyWith<_$ConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
