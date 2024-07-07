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
      governmentAdvice: json['government_advice'] as String?,
      lowCostImprovement: json['low_cost_improvement'] as String?,
      accuracyImprovement: json['accuracy_improvement'] as String?,
    );

Map<String, dynamic> _$$WayDataImplToJson(_$WayDataImpl instance) =>
    <String, dynamic>{
      'safety_percentage': instance.safetyPercentage,
      'proceed_phrase': instance.proceedPhrase,
      'road_type': instance.roadType,
      'government_advice': instance.governmentAdvice,
      'low_cost_improvement': instance.lowCostImprovement,
      'accuracy_improvement': instance.accuracyImprovement,
    };
