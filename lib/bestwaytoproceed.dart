library bestwaytoproceed;

import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'models/way_data.dart';

/// A class that holds constants used in the image analysis process.
class Constants {
  /// The model identifier for the Gemini 1.5 Flash model.
  static const String modelGeminiFlash = 'gemini-1.5-flash';

  /// The model identifier for the Gemini 1.5 Pro model.
  static const String modelGeminiPro = 'gemini-1.5-pro';

  /// The prompt used for the basic analysis.
  static const String analysisPrompt = """
    Analyze the provided images and determine if the scene represents a safe and appropriate time for a blind person to proceed.
    Consider the presence of clear pathways, absence of obstacles, adequate lighting, and any other elements that might affect safety and ease of navigation.
    Please provide a detailed explanation of your analysis.
    Provide the percentage of safety for the next 5 meters.
    Describe the best way to proceed in a short phrase.
    Consider whether the road is intended for pedestrians or vehicles.
    Suggest advice for the government to improve indications.
    Suggest an idea for government improvements that would likely cost less than 100 USD.
    Suggest advice to improve the accuracy of the output for the next use to add it here.
    List the objects in the image from right to left.
    Don't mention blind word or something can be considered as a Offense or discrimination to blind people in your analyze
    Return all data only in a developed JSON format and remove the JSON word, keeping this form as a model
  """;

  /// The prompt used for the pro analysis.
  static const String proModelPrompt = """
    Analyze the provided images and determine if the scene represents a safe and appropriate time for a blind person to proceed.
    Consider the presence of clear pathways, absence of obstacles, adequate lighting, and any other elements that might affect safety and ease of navigation.
    Please provide a detailed explanation of your analysis.
    Provide the percentage of safety for the next 5 meters.
    Describe the best way to proceed in a short phrase.
    Consider whether the road is intended for pedestrians or vehicles.
    Suggest advice for the government to improve indications.
    Suggest an idea for government improvements that would likely cost less than 100 USD.
    Suggest advice to improve the accuracy of the output for the next use to add it here.
    List the objects in the image from right to left.
    Prioritize critical hazards for blind individuals.
    Don't mention the word blind or anything that can be considered offensive or discriminatory to blind people in your analysis.
  """;

  /// A default JSON string representing an example of the expected output.
  static final String defaultJson = jsonEncode(const WayData(
    safetyPercentage: 40,
    proceedPhrase: 'example',
    adequateLighting: false,
    pathwayClearance: false,
    roadType: 'example',
    objects: ["a wall", "a dore", "a care", "keys", "obstacle"],
    alternativeRoute: "example",
    aiImprovement: "example",
  ).toJson());
}

/// A class that analyzes images to determine the safety of a scene for a blind person to proceed.
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
  Future<WayData?> analyzeImage({required XFile image, String? position, bool? quickAnalyse = false}) async {
    try {
      late final GenerateContentResponse? response;

      // Read the image bytes from the provided XFile
      final imageBytes = await image.readAsBytes();

      // Create a GenerativeModel instance with the basic model configuration
      final model = GenerativeModel(
        model: Constants.modelGeminiFlash,
        apiKey: apiKey,
      );

      // Create the analysis prompt with the default JSON model
      final prompt = TextPart("${Constants.analysisPrompt}${Constants.defaultJson}");

      // Create a GenerativeModel instance with the pro model configuration
      final proModel = GenerativeModel(
        model: Constants.modelGeminiPro,
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

      // Create the pro model prompt
      final proModelPrompt = TextPart(Constants.proModelPrompt);

      // Create a list of image parts
      final imageParts = [DataPart('image/jpeg', imageBytes)];

      // Generate content using either the basic or pro model based on the quickAnalyse flag
      if (quickAnalyse ?? false) {
        response = await model.generateContent([
          Content.multi([prompt, ...imageParts])
        ]);
      } else {
        response = await proModel.generateContent([
          Content.multi([proModelPrompt, ...imageParts])
        ]);
      }

      // Parse the response text and convert it to JSON
      final result = response.text;
      final jsonResult = jsonDecode(result!);

      // Delete the temporary image file
      File(image.path).delete();

      // Return the parsed WayData object
      return WayData.fromJson(jsonResult);
    } catch (error, stacktrace) {
      // Log any errors that occur during the analysis process
      developer.log('Error: $error, Stacktrace: $stacktrace');
      return null;
    }
  }
}
