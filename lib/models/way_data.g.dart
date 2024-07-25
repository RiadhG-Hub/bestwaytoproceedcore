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
      adequateLighting: json['adequate_lighting'] as bool?,
      pathwayClearance: json['pathway_clearance'] as bool?,
      governmentAdvice: json['government_advice'] as String?,
      lowCostImprovements: json['low_cost_improvements'] as String?,
      offensiveContentCheck: json['offensive_content_check'] as bool?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
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
      'adequate_lighting': instance.adequateLighting,
      'pathway_clearance': instance.pathwayClearance,
      'government_advice': instance.governmentAdvice,
      'low_cost_improvements': instance.lowCostImprovements,
      'offensive_content_check': instance.offensiveContentCheck,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };
