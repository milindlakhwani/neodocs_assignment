# Flutter Assignment - Neodocs README

This Flutter assignment for Neodocs involves creating an app with a single screen containing a text widget and a dynamic bar. The purpose of the bar widget is to clearly indicate the user's position and proximity to other sections on the bar. 

## Features:

- **Static Bar Widget:**
  - Indicates various sections on the bar and users proximity to other sections.
  - Does not change dynamically.
  - Takes minimum and maximum values.
  - Utilizes a list of items to specify width and meaning of each range.

- **Dynamic Slider Widget:**
  - Placed above the bar to show user's position.
  - Retrieves values from a StateProvider.
  - StateProvider's state is mutated by values from textField.

- **State Management:**
  - Utilizes Riverpod for state management.

## Implementation Details:

- **Bar Widget:**
  - A static bar widget is created that just represents test metadata.
  - It takes minimum and maximum values, along with a list of ranges to determine width and meaning.

- **Slider Widget:**
  - Positioned above the bar to visually indicate user's position.
  - Retrieves values from a StateProvider to update its position.
  - StateProvider's state is updated through user input from textField.

- **State Management with Riverpod:**
  - Riverpod is employed for efficient state management.
  - StateProvider maintains the state of the slider widget, updating it as per user input.

## Usage:

To integrate this assignment into your Flutter project, follow these steps:

1. Clone this repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. flutter run.

## Dependencies:

This project relies on the following dependencies:

- Flutter
- Riverpod

Ensure these dependencies are properly configured in your Flutter project.
