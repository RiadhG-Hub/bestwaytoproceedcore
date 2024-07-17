library bestwaytoproceed;

import 'dart:convert';
import 'dart:developer' as developer;

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

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
  Future<WayData?> analyzeImage(XFile image) async {
    try {
      final imageBytes = await image.readAsBytes();

      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
      );

      final prompt = TextPart(
        "Analyze the image and determine if the scene is safe for a blind person to proceed. "
        "Consider clear pathways, obstacles, lighting, and other safety factors. "
        "Provide a detailed analysis, including the safety percentage for the next 5 meters, "
        "the best way to proceed (e.g., 'just a little bit to the right'), "
        "whether the road is intended for pedestrians or vehicles, "
        "advice for government improvement under \$100 USD, "
        "specific input text to improve future predictions, "
        "and all data in a formatted JSON response excluding the 'JSON' word. "
        "Use the following format as a model: "
        "${jsonEncode(const WayData().toJson())}"
        "Replace '...' with the actual data.",
      );

      final imageParts = [DataPart('image/jpeg', imageBytes)];

      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts])
      ]);

      final result = response.text;
      final jsonResult = jsonDecode(result!);
      developer.log('JSON result: $jsonResult');

      return WayData.fromJson(jsonResult);
    } catch (error, stacktrace) {
      developer.log('Error: $error, Stacktrace: $stacktrace');
      return null;
    }
  }
}
