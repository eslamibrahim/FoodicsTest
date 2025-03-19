# Recipe List App

## Goal
Create a simple iOS application using SwiftUI and the MVVM architectural pattern that fetches and displays a list of items from a remote API. The user should be able to view details of an item by tapping on it.

## Requirements

### Project Setup
- Use **SwiftUI** as the UI framework.
- Follow the **MVVM** architectural pattern.

### Features

#### Feature 1: Fetch and Display a List
- Fetch and show a list of recipes using the [DummyJSON API](https://dummyjson.com/docs).

#### Feature 2: Item Detail View
- When a user taps a recipe, navigate to a detailed view.
- The detail view should display additional information, including:
  - An image
  - A long description

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/eslamibrahim/FoodicsTest.git

 2. Navigate to the project directory:
    Open the project in Xcode

 2. Will find local Swift Package Manager (FoodicsApp)
    Open Sources folder to find the implementation 

Build and run the project on a simulator or a device.

## Usage

Launch the app to view the list of recipes.
Tap on any recipe to view detailed information, including images and descriptions.
Use pull-to-refresh to reload the list of recipes.
Utilize the search and sort features to filter the recipes.

## Testing

Unit tests can be run in Xcode using the Test navigator.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue.

##  Acknowledgements
DummyJSON API for providing sample data.
SwiftUI and Combine for modern iOS development.
