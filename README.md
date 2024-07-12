# Best Way To Proceed

A Flutter package to return a predefined JSON model and accept image and text as input. This package simplifies working with JSON data, allowing you to efficiently handle images and text inputs within your Flutter application.

## Features

- Accepts image and text inputs.
- Returns a predefined JSON model.
- Easy integration with existing Flutter projects.
- Lightweight and fast performance.

## Getting started

### Prerequisites

- Flutter SDK: Ensure you have Flutter installed. You can download it [here](https://flutter.dev/docs/get-started/install).
- Dart SDK: Make sure Dart is installed and up to date.

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  git:
  url: https://github.com/riadhrahma/bestwaytoproceedcore.git
  ref: dev
```

Then, run the following command:

```bash
flutter pub get
```

## Usage

Here's a simple example to get you started:

```dart
 const apiKey = "your api key";
ImageComparison comparator = ImageComparison(apiKey);
final result = await comparator.compareImages(image: imageResult);
log('AI analysis result: $result');
```



## Additional information

For more information, please visit our [documentation](https://github.com/riadhrahma/bestwaytoproceedcore/doc).

### Contributing

We welcome contributions!

### Filing Issues

If you encounter any issues, please file them [here](https://github.com/riadhrahma/bestwaytoproceedcore/issues). Our team will respond as quickly as possible.

For further inquiries or support, reach out to [gharbiriadh16@gmail.com](mailto:gharbiriadh16@gmail.com).

Happy coding!