// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'way_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WayDataImpl _$$WayDataImplFromJson(Map<String, dynamic> json) =>
    _$WayDataImpl(
      safetyPercentage: (json['safety_percentage'] as num?)?.toInt(),
      proceedPhrase: json['proceed_phrase'] as String?,
      roadType: json['road_type'] as String?,
      details: json['details'] as String?,
      alternativeRoute: json['alternative_route'] as String?,
      objects: (json['objects_from_right_to_left'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      aiImprovement: json['ai_improvement'] as String?,
    );

Map<String, dynamic> _$$WayDataImplToJson(_$WayDataImpl instance) =>
    <String, dynamic>{
      'safety_percentage': instance.safetyPercentage,
      'proceed_phrase': instance.proceedPhrase,
      'road_type': instance.roadType,
      'details': instance.details,
      'alternative_route': instance.alternativeRoute,
      'objects_from_right_to_left': instance.objects,
      'ai_improvement': instance.aiImprovement,
    };
