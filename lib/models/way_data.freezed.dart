// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'way_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WayData _$WayDataFromJson(Map<String, dynamic> json) {
  return _WayData.fromJson(json);
}

/// @nodoc
mixin _$WayData {
  @JsonKey(name: 'safety_percentage')
  int? get safetyPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'proceed_phrase')
  String? get proceedPhrase => throw _privateConstructorUsedError;
  @JsonKey(name: 'road_type')
  String? get roadType => throw _privateConstructorUsedError;
  @JsonKey(name: 'details')
  String? get details => throw _privateConstructorUsedError; // New field
  @JsonKey(name: 'alternative_route')
  String? get alternativeRoute =>
      throw _privateConstructorUsedError; // New field
  @JsonKey(name: 'objects_from_right_to_left')
  List<String>? get objects =>
      throw _privateConstructorUsedError; // Renamed field
  @JsonKey(name: 'ai_improvement')
  String? get aiImprovement => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WayDataCopyWith<WayData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WayDataCopyWith<$Res> {
  factory $WayDataCopyWith(WayData value, $Res Function(WayData) then) =
      _$WayDataCopyWithImpl<$Res, WayData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'safety_percentage') int? safetyPercentage,
      @JsonKey(name: 'proceed_phrase') String? proceedPhrase,
      @JsonKey(name: 'road_type') String? roadType,
      @JsonKey(name: 'details') String? details,
      @JsonKey(name: 'alternative_route') String? alternativeRoute,
      @JsonKey(name: 'objects_from_right_to_left') List<String>? objects,
      @JsonKey(name: 'ai_improvement') String? aiImprovement});
}

/// @nodoc
class _$WayDataCopyWithImpl<$Res, $Val extends WayData>
    implements $WayDataCopyWith<$Res> {
  _$WayDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? safetyPercentage = freezed,
    Object? proceedPhrase = freezed,
    Object? roadType = freezed,
    Object? details = freezed,
    Object? alternativeRoute = freezed,
    Object? objects = freezed,
    Object? aiImprovement = freezed,
  }) {
    return _then(_value.copyWith(
      safetyPercentage: freezed == safetyPercentage
          ? _value.safetyPercentage
          : safetyPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      proceedPhrase: freezed == proceedPhrase
          ? _value.proceedPhrase
          : proceedPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
      roadType: freezed == roadType
          ? _value.roadType
          : roadType // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      alternativeRoute: freezed == alternativeRoute
          ? _value.alternativeRoute
          : alternativeRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      objects: freezed == objects
          ? _value.objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      aiImprovement: freezed == aiImprovement
          ? _value.aiImprovement
          : aiImprovement // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WayDataImplCopyWith<$Res> implements $WayDataCopyWith<$Res> {
  factory _$$WayDataImplCopyWith(
          _$WayDataImpl value, $Res Function(_$WayDataImpl) then) =
      __$$WayDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'safety_percentage') int? safetyPercentage,
      @JsonKey(name: 'proceed_phrase') String? proceedPhrase,
      @JsonKey(name: 'road_type') String? roadType,
      @JsonKey(name: 'details') String? details,
      @JsonKey(name: 'alternative_route') String? alternativeRoute,
      @JsonKey(name: 'objects_from_right_to_left') List<String>? objects,
      @JsonKey(name: 'ai_improvement') String? aiImprovement});
}

/// @nodoc
class __$$WayDataImplCopyWithImpl<$Res>
    extends _$WayDataCopyWithImpl<$Res, _$WayDataImpl>
    implements _$$WayDataImplCopyWith<$Res> {
  __$$WayDataImplCopyWithImpl(
      _$WayDataImpl _value, $Res Function(_$WayDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? safetyPercentage = freezed,
    Object? proceedPhrase = freezed,
    Object? roadType = freezed,
    Object? details = freezed,
    Object? alternativeRoute = freezed,
    Object? objects = freezed,
    Object? aiImprovement = freezed,
  }) {
    return _then(_$WayDataImpl(
      safetyPercentage: freezed == safetyPercentage
          ? _value.safetyPercentage
          : safetyPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      proceedPhrase: freezed == proceedPhrase
          ? _value.proceedPhrase
          : proceedPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
      roadType: freezed == roadType
          ? _value.roadType
          : roadType // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      alternativeRoute: freezed == alternativeRoute
          ? _value.alternativeRoute
          : alternativeRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      objects: freezed == objects
          ? _value._objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      aiImprovement: freezed == aiImprovement
          ? _value.aiImprovement
          : aiImprovement // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WayDataImpl implements _WayData {
  const _$WayDataImpl(
      {@JsonKey(name: 'safety_percentage') this.safetyPercentage,
      @JsonKey(name: 'proceed_phrase') this.proceedPhrase,
      @JsonKey(name: 'road_type') this.roadType,
      @JsonKey(name: 'details') this.details,
      @JsonKey(name: 'alternative_route') this.alternativeRoute,
      @JsonKey(name: 'objects_from_right_to_left') final List<String>? objects,
      @JsonKey(name: 'ai_improvement') this.aiImprovement})
      : _objects = objects;

  factory _$WayDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WayDataImplFromJson(json);

  @override
  @JsonKey(name: 'safety_percentage')
  final int? safetyPercentage;
  @override
  @JsonKey(name: 'proceed_phrase')
  final String? proceedPhrase;
  @override
  @JsonKey(name: 'road_type')
  final String? roadType;
  @override
  @JsonKey(name: 'details')
  final String? details;
// New field
  @override
  @JsonKey(name: 'alternative_route')
  final String? alternativeRoute;
// New field
  final List<String>? _objects;
// New field
  @override
  @JsonKey(name: 'objects_from_right_to_left')
  List<String>? get objects {
    final value = _objects;
    if (value == null) return null;
    if (_objects is EqualUnmodifiableListView) return _objects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Renamed field
  @override
  @JsonKey(name: 'ai_improvement')
  final String? aiImprovement;

  @override
  String toString() {
    return 'WayData(safetyPercentage: $safetyPercentage, proceedPhrase: $proceedPhrase, roadType: $roadType, details: $details, alternativeRoute: $alternativeRoute, objects: $objects, aiImprovement: $aiImprovement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WayDataImpl &&
            (identical(other.safetyPercentage, safetyPercentage) ||
                other.safetyPercentage == safetyPercentage) &&
            (identical(other.proceedPhrase, proceedPhrase) ||
                other.proceedPhrase == proceedPhrase) &&
            (identical(other.roadType, roadType) ||
                other.roadType == roadType) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.alternativeRoute, alternativeRoute) ||
                other.alternativeRoute == alternativeRoute) &&
            const DeepCollectionEquality().equals(other._objects, _objects) &&
            (identical(other.aiImprovement, aiImprovement) ||
                other.aiImprovement == aiImprovement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      safetyPercentage,
      proceedPhrase,
      roadType,
      details,
      alternativeRoute,
      const DeepCollectionEquality().hash(_objects),
      aiImprovement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WayDataImplCopyWith<_$WayDataImpl> get copyWith =>
      __$$WayDataImplCopyWithImpl<_$WayDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WayDataImplToJson(
      this,
    );
  }
}

abstract class _WayData implements WayData {
  const factory _WayData(
      {@JsonKey(name: 'safety_percentage') final int? safetyPercentage,
      @JsonKey(name: 'proceed_phrase') final String? proceedPhrase,
      @JsonKey(name: 'road_type') final String? roadType,
      @JsonKey(name: 'details') final String? details,
      @JsonKey(name: 'alternative_route') final String? alternativeRoute,
      @JsonKey(name: 'objects_from_right_to_left') final List<String>? objects,
      @JsonKey(name: 'ai_improvement')
      final String? aiImprovement}) = _$WayDataImpl;

  factory _WayData.fromJson(Map<String, dynamic> json) = _$WayDataImpl.fromJson;

  @override
  @JsonKey(name: 'safety_percentage')
  int? get safetyPercentage;
  @override
  @JsonKey(name: 'proceed_phrase')
  String? get proceedPhrase;
  @override
  @JsonKey(name: 'road_type')
  String? get roadType;
  @override
  @JsonKey(name: 'details')
  String? get details;
  @override // New field
  @JsonKey(name: 'alternative_route')
  String? get alternativeRoute;
  @override // New field
  @JsonKey(name: 'objects_from_right_to_left')
  List<String>? get objects;
  @override // Renamed field
  @JsonKey(name: 'ai_improvement')
  String? get aiImprovement;
  @override
  @JsonKey(ignore: true)
  _$$WayDataImplCopyWith<_$WayDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
