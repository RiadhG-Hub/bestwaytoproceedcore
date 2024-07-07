library bestwaytoproceed;

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

import 'models/way_data.dart';

class ImageComparison {
  final String apiKey;

  ImageComparison(this.apiKey);

  Future<WayData?> compareImages({required XFile images}) async {
    // log('selecting the first image');
    // final XFile? firstImageFile = await _picker.pickImage(source: ImageSource.gallery);
    // log("selecting the second image ");
    // final XFile? secondImageFile = await _picker.pickImage(source: ImageSource.gallery);

    try {
      log('done selecting images ');
      //  if (firstImageFile == null || secondImageFile == null) {
      //    print('Image selection canceled');
      //    return;
      //  }

      final image = await File(images.path).readAsBytes();
      //final secondImage = await File(images.last.path).readAsBytes();

      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);

      final prompt = TextPart(
          "Analyze the provided images and determine if the scene represents a safe and appropriate time for a blind person to proceed. "
          "Consider factors such as the presence of clear pathways, absence of obstacles, adequate lighting, and any other elements that might affect safety and ease of navigation. "
          "Please provide a detailed explanation of your analysis."
          "provide the percentage of safety for the next 5 meters"
          "describe the best way to proceed in short phrase"
          "Consider whether the road is intended for pedestrians or vehicles."
          "suggest me an advice for government to improve indications "
          "suggest an idea for government improvements that would likely cost less than 100 USD?"
          "suggest me an advice to improve the accuracy of the output for the next use to add it here"
          "return all data only in developed json and remove json word and keep this form as a model : {safety_percentage: 44,proceed_phrase: ex,road_type: ex,government_advice: ex,low_cost_improvement: ex,accuracy_improvement: ex}");
      //and keep this as a model {safety_percentage: 1 best_way_to_proceed: Use a cane or guide dog to navigate the uneven terrain., road_type : Natural pathway, phrase_improvement: Caution: Uneven terrain and potential for falls.}
      final imageParts = [
        DataPart('image/jpeg', image),
      ];

      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts])
      ]);
      final result = response.text;
      final jsonResult = jsonDecode(result!);
      log('the json result: $jsonResult');
      final modelResult = WayData.fromJson(jsonResult);
      return modelResult;
    } catch (e, s) {
      log("error: $e, stack: $s");
      return null;
    }
  }
}
