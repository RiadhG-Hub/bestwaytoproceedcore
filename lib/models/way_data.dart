import 'package:freezed_annotation/freezed_annotation.dart';

part 'way_data.freezed.dart';
part 'way_data.g.dart';

@freezed
class WayData with _$WayData {
  const factory WayData({
    @JsonKey(name: 'safety_percentage') int? safetyPercentage,
    @JsonKey(name: 'proceed_phrase') String? proceedPhrase,
    @JsonKey(name: 'road_type') String? roadType,
    @JsonKey(name: 'government_advice') String? governmentAdvice,
    @JsonKey(name: 'low_cost_improvement') String? lowCostImprovement,
    @JsonKey(name: 'accuracy_improvement') String? accuracyImprovement,
    @JsonKey(name: 'specific_gemini_input_text_to_improve_output_in_this_case') String? aiImprovement,
  }) = _WayData;

  factory WayData.fromJson(Map<String, Object?> json) => _$WayDataFromJson(json);
}
