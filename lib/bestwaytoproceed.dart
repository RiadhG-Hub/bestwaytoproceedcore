library bestwaytoproceed;

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

import 'models/way_data.dart';

/// A class that compares images to analyze and determine the safety
/// of a given scene for a blind person to proceed.
class ImageComparison {
  /// The API key for the generative AI model.
  final String apiKey;

  /// Constructs an instance of [ImageComparison] with the provided [apiKey].
  ImageComparison(this.apiKey);

  /// Compares the provided image and returns the analysis as [WayData].
  ///
  /// The analysis includes factors such as the presence of clear pathways,
  /// absence of obstacles, adequate lighting, and other elements affecting safety
  /// and ease of navigation.
  ///
  /// Returns `null` if an error occurs during the process.
  ///
  /// [image] is the image file to be analyzed.
  Future<WayData?> compareImages({required XFile image}) async {
    try {
      final imageResult = await File(image.path).readAsBytes();

      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);

      final prompt = TextPart(
          "Analyze the provided images and determine if the scene represents a safe and appropriate time for a blind person to proceed. "
          "Consider the presence of clear pathways, absence of obstacles, adequate lighting, and any other elements that might affect safety and ease of navigation. "
          "Please provide a detailed explanation of your analysis. "
          "Provide the percentage of safety for the next 5 meters. "
          "Describe the best way to proceed in a short phrase. "
          "Consider whether the road is intended for pedestrians or vehicles. "
          "Suggest an advice for the government to improve indications. "
          "Suggest an idea for government improvements that would likely cost less than 100 USD. "
          "Suggest an advice to improve the accuracy of the output for the next use to add it here. "
          "Return all data only in a developed JSON format and remove the JSON word, keeping this form as a model ${jsonEncode(const WayData(safetyPercentage: 40, proceedPhrase: 'example', roadType: 'example', governmentAdvice: 'example', lowCostImprovement: 'example', accuracyImprovement: 'example').toJson())}.");

      final imageParts = [
        DataPart('image/jpeg', imageResult),
      ];

      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts])
      ]);
      final result = response.text;
      final jsonResult = jsonDecode(result!);
      log('The JSON result: $jsonResult');
      final modelResult = WayData.fromJson(jsonResult);
      return modelResult;
    } catch (e, s) {
      log('Error: $e, stack: $s');
      return null;
    }
  }
}
