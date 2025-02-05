// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filesUsser_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilesModel _$FilesModelFromJson(Map<String, dynamic> json) {
  return _FilesModel.fromJson(json);
}

/// @nodoc
mixin _$FilesModel {
  List<FileElement>? get files => throw _privateConstructorUsedError;

  /// Serializes this FilesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilesModelCopyWith<FilesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilesModelCopyWith<$Res> {
  factory $FilesModelCopyWith(
          FilesModel value, $Res Function(FilesModel) then) =
      _$FilesModelCopyWithImpl<$Res, FilesModel>;
  @useResult
  $Res call({List<FileElement>? files});
}

/// @nodoc
class _$FilesModelCopyWithImpl<$Res, $Val extends FilesModel>
    implements $FilesModelCopyWith<$Res> {
  _$FilesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = freezed,
  }) {
    return _then(_value.copyWith(
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileElement>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilesModelImplCopyWith<$Res>
    implements $FilesModelCopyWith<$Res> {
  factory _$$FilesModelImplCopyWith(
          _$FilesModelImpl value, $Res Function(_$FilesModelImpl) then) =
      __$$FilesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FileElement>? files});
}

/// @nodoc
class __$$FilesModelImplCopyWithImpl<$Res>
    extends _$FilesModelCopyWithImpl<$Res, _$FilesModelImpl>
    implements _$$FilesModelImplCopyWith<$Res> {
  __$$FilesModelImplCopyWithImpl(
      _$FilesModelImpl _value, $Res Function(_$FilesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = freezed,
  }) {
    return _then(_$FilesModelImpl(
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileElement>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilesModelImpl implements _FilesModel {
  const _$FilesModelImpl({final List<FileElement>? files}) : _files = files;

  factory _$FilesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilesModelImplFromJson(json);

  final List<FileElement>? _files;
  @override
  List<FileElement>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FilesModel(files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilesModelImpl &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_files));

  /// Create a copy of FilesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilesModelImplCopyWith<_$FilesModelImpl> get copyWith =>
      __$$FilesModelImplCopyWithImpl<_$FilesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilesModelImplToJson(
      this,
    );
  }
}

abstract class _FilesModel implements FilesModel {
  const factory _FilesModel({final List<FileElement>? files}) =
      _$FilesModelImpl;

  factory _FilesModel.fromJson(Map<String, dynamic> json) =
      _$FilesModelImpl.fromJson;

  @override
  List<FileElement>? get files;

  /// Create a copy of FilesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilesModelImplCopyWith<_$FilesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileElement _$FileElementFromJson(Map<String, dynamic> json) {
  return _FileElement.fromJson(json);
}

/// @nodoc
mixin _$FileElement {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get archive => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get filePersonId => throw _privateConstructorUsedError;
  int? get personId => throw _privateConstructorUsedError;
  int? get homeId => throw _privateConstructorUsedError;
  int? get fileHomeId => throw _privateConstructorUsedError;
  int? get personal => throw _privateConstructorUsedError;

  /// Serializes this FileElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileElementCopyWith<FileElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileElementCopyWith<$Res> {
  factory $FileElementCopyWith(
          FileElement value, $Res Function(FileElement) then) =
      _$FileElementCopyWithImpl<$Res, FileElement>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? archive,
      String? type,
      int? size,
      DateTime? date,
      String? description,
      int? filePersonId,
      int? personId,
      int? homeId,
      int? fileHomeId,
      int? personal});
}

/// @nodoc
class _$FileElementCopyWithImpl<$Res, $Val extends FileElement>
    implements $FileElementCopyWith<$Res> {
  _$FileElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? archive = freezed,
    Object? type = freezed,
    Object? size = freezed,
    Object? date = freezed,
    Object? description = freezed,
    Object? filePersonId = freezed,
    Object? personId = freezed,
    Object? homeId = freezed,
    Object? fileHomeId = freezed,
    Object? personal = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      archive: freezed == archive
          ? _value.archive
          : archive // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      filePersonId: freezed == filePersonId
          ? _value.filePersonId
          : filePersonId // ignore: cast_nullable_to_non_nullable
              as int?,
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int?,
      homeId: freezed == homeId
          ? _value.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileHomeId: freezed == fileHomeId
          ? _value.fileHomeId
          : fileHomeId // ignore: cast_nullable_to_non_nullable
              as int?,
      personal: freezed == personal
          ? _value.personal
          : personal // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileElementImplCopyWith<$Res>
    implements $FileElementCopyWith<$Res> {
  factory _$$FileElementImplCopyWith(
          _$FileElementImpl value, $Res Function(_$FileElementImpl) then) =
      __$$FileElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? archive,
      String? type,
      int? size,
      DateTime? date,
      String? description,
      int? filePersonId,
      int? personId,
      int? homeId,
      int? fileHomeId,
      int? personal});
}

/// @nodoc
class __$$FileElementImplCopyWithImpl<$Res>
    extends _$FileElementCopyWithImpl<$Res, _$FileElementImpl>
    implements _$$FileElementImplCopyWith<$Res> {
  __$$FileElementImplCopyWithImpl(
      _$FileElementImpl _value, $Res Function(_$FileElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? archive = freezed,
    Object? type = freezed,
    Object? size = freezed,
    Object? date = freezed,
    Object? description = freezed,
    Object? filePersonId = freezed,
    Object? personId = freezed,
    Object? homeId = freezed,
    Object? fileHomeId = freezed,
    Object? personal = freezed,
  }) {
    return _then(_$FileElementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      archive: freezed == archive
          ? _value.archive
          : archive // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      filePersonId: freezed == filePersonId
          ? _value.filePersonId
          : filePersonId // ignore: cast_nullable_to_non_nullable
              as int?,
      personId: freezed == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int?,
      homeId: freezed == homeId
          ? _value.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileHomeId: freezed == fileHomeId
          ? _value.fileHomeId
          : fileHomeId // ignore: cast_nullable_to_non_nullable
              as int?,
      personal: freezed == personal
          ? _value.personal
          : personal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileElementImpl implements _FileElement {
  const _$FileElementImpl(
      {this.id,
      this.name,
      this.archive,
      this.type,
      this.size,
      this.date,
      this.description,
      this.filePersonId,
      this.personId,
      this.homeId,
      this.fileHomeId,
      this.personal});

  factory _$FileElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileElementImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? archive;
  @override
  final String? type;
  @override
  final int? size;
  @override
  final DateTime? date;
  @override
  final String? description;
  @override
  final int? filePersonId;
  @override
  final int? personId;
  @override
  final int? homeId;
  @override
  final int? fileHomeId;
  @override
  final int? personal;

  @override
  String toString() {
    return 'FileElement(id: $id, name: $name, archive: $archive, type: $type, size: $size, date: $date, description: $description, filePersonId: $filePersonId, personId: $personId, homeId: $homeId, fileHomeId: $fileHomeId, personal: $personal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.archive, archive) || other.archive == archive) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.filePersonId, filePersonId) ||
                other.filePersonId == filePersonId) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.fileHomeId, fileHomeId) ||
                other.fileHomeId == fileHomeId) &&
            (identical(other.personal, personal) ||
                other.personal == personal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, archive, type, size,
      date, description, filePersonId, personId, homeId, fileHomeId, personal);

  /// Create a copy of FileElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileElementImplCopyWith<_$FileElementImpl> get copyWith =>
      __$$FileElementImplCopyWithImpl<_$FileElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileElementImplToJson(
      this,
    );
  }
}

abstract class _FileElement implements FileElement {
  const factory _FileElement(
      {final int? id,
      final String? name,
      final String? archive,
      final String? type,
      final int? size,
      final DateTime? date,
      final String? description,
      final int? filePersonId,
      final int? personId,
      final int? homeId,
      final int? fileHomeId,
      final int? personal}) = _$FileElementImpl;

  factory _FileElement.fromJson(Map<String, dynamic> json) =
      _$FileElementImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get archive;
  @override
  String? get type;
  @override
  int? get size;
  @override
  DateTime? get date;
  @override
  String? get description;
  @override
  int? get filePersonId;
  @override
  int? get personId;
  @override
  int? get homeId;
  @override
  int? get fileHomeId;
  @override
  int? get personal;

  /// Create a copy of FileElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileElementImplCopyWith<_$FileElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
