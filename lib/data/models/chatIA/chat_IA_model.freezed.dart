// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_IA_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatIa _$ChatIaFromJson(Map<String, dynamic> json) {
  return _ChatIa.fromJson(json);
}

/// @nodoc
mixin _$ChatIa {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  /// Serializes this ChatIa to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatIa
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatIaCopyWith<ChatIa> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatIaCopyWith<$Res> {
  factory $ChatIaCopyWith(ChatIa value, $Res Function(ChatIa) then) =
      _$ChatIaCopyWithImpl<$Res, ChatIa>;
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class _$ChatIaCopyWithImpl<$Res, $Val extends ChatIa>
    implements $ChatIaCopyWith<$Res> {
  _$ChatIaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatIa
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatIaImplCopyWith<$Res> implements $ChatIaCopyWith<$Res> {
  factory _$$ChatIaImplCopyWith(
          _$ChatIaImpl value, $Res Function(_$ChatIaImpl) then) =
      __$$ChatIaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class __$$ChatIaImplCopyWithImpl<$Res>
    extends _$ChatIaCopyWithImpl<$Res, _$ChatIaImpl>
    implements _$$ChatIaImplCopyWith<$Res> {
  __$$ChatIaImplCopyWithImpl(
      _$ChatIaImpl _value, $Res Function(_$ChatIaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatIa
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$ChatIaImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatIaImpl implements _ChatIa {
  const _$ChatIaImpl({required this.question, required this.answer});

  factory _$ChatIaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatIaImplFromJson(json);

  @override
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'ChatIa(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatIaImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  /// Create a copy of ChatIa
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatIaImplCopyWith<_$ChatIaImpl> get copyWith =>
      __$$ChatIaImplCopyWithImpl<_$ChatIaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatIaImplToJson(
      this,
    );
  }
}

abstract class _ChatIa implements ChatIa {
  const factory _ChatIa(
      {required final String question,
      required final String answer}) = _$ChatIaImpl;

  factory _ChatIa.fromJson(Map<String, dynamic> json) = _$ChatIaImpl.fromJson;

  @override
  String get question;
  @override
  String get answer;

  /// Create a copy of ChatIa
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatIaImplCopyWith<_$ChatIaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
