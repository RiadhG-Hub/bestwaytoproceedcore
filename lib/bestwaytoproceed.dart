library bestwaytoproceed;

import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'models/way_data.dart';

/// A class that analyzes images to determine the safety of a scene
/// for a blind person to proceed.
class ImageComparison {
  /// The API key for the generative AI model.
  final String apiKey;

  /// Constructs an instance of [ImageComparison] with the provided [apiKey].
  ImageComparison(this.apiKey);

  /// Analyzes the provided image and returns the safety data as [WayData].
  ///
  /// The analysis considers factors like clear pathways, obstacles, lighting,
  /// and other elements affecting safety and navigation.
  ///
  /// Returns `null` if an error occurs.
  Future<WayData?> analyzeImage(
    XFile image,
    String? position,
  ) async {
    try {
      final imageBytes = await image.readAsBytes();

      final model = GenerativeModel(
        model: 'gemini-1.5-pro',
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          responseMimeType: "application/json",
          responseSchema:
              Schema(SchemaType.object, requiredProperties: const WayData().toJson().keys.toList(), properties: {
            "safety_percentage": Schema.integer(),
            "proceed_phrase": Schema.string(),
            "road_type": Schema.string(),
            "details": Schema.string(),
            "alternative_route": Schema.string(),
            "objects_from_right_to_left": Schema.array(items: Schema.string()),
            "ai_improvement": Schema.string(),
            "adequate_lighting": Schema.boolean(),
            "pathway_clearance": Schema.boolean(),
            "government_advice": Schema.string(),
            "low_cost_improvements": Schema.string(),
            "offensive_content_check": Schema.boolean(),
            "address": Schema.string(description: position),
            "latitude":
                Schema.number(description: "return the same value of ${(position == '' ? '0.0' : position)} latitude"),
            "longitude":
                Schema.number(description: "return the same value of ${(position == '' ? '0.0' : position)} longitude")
          }),
        ),
      );

      final prompt = TextPart(
          "Analyze the provided images and determine if the scene represents a safe and appropriate time for a blind person to proceed."
          " Consider the presence of clear pathways, absence of obstacles, adequate lighting, and any other elements that might affect safety and ease of navigation."
          " Please provide a detailed explanation of your analysis."
          " Provide the percentage of safety for the next 5 meters."
          " Describe the best way to proceed in a short phrase."
          " Consider whether the road is intended for pedestrians or vehicles."
          " Suggest advice for the government to improve indications."
          " Suggest an idea for government improvements that would likely cost less than 100 USD."
          " Suggest advice to improve the accuracy of the output for the next use to add it here."
          " List the objects in the image from right to left."
          "Prioritize critical hazards for blind individuals."
          " Don't mention the word blind or anything that can be considered offensive or discriminatory to blind people in your analysis.");

      final imageParts = [DataPart('image/jpeg', imageBytes)];

      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts])
      ]);

      final result = response.text;
      final jsonResult = jsonDecode(result!);

      File(image.path).delete();
      return WayData.fromJson(jsonResult);
    } catch (error, stacktrace) {
      developer.log('Error: $error, Stacktrace: $stacktrace');
      return null;
    }
  }
}
