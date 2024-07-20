// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'way_data.freezed.dart';
part 'way_data.g.dart';

@freezed
class WayData with _$WayData {
  const factory WayData({
    @JsonKey(name: 'safety_percentage') int? safetyPercentage,
    @JsonKey(name: 'proceed_phrase') String? proceedPhrase,
    @JsonKey(name: 'road_type') String? roadType,
    @JsonKey(name: 'details') String? details, // New field
    @JsonKey(name: 'alternative_route') String? alternativeRoute, // New field
    @JsonKey(name: 'objects_from_right_to_left') List<String>? objects, // Renamed field
    @JsonKey(name: 'ai_improvement') String? aiImprovement, // Renamed field
  }) = _WayData;

  factory WayData.fromJson(Map<String, Object?> json) => _$WayDataFromJson(json);
}
