# SwiftUI List Challenge

This project is a SwiftUI-based application designed to display a list of movies and their details, following clean architecture principles and employing the coordinator pattern for navigation management.

## Project Setup:

This project is built using SwiftUI. The project follows the MVVM (Model-View-ViewModel) architecture pattern, with an additional focus on clean architecture principles for better code organization and separation of concerns.

## Data Model:

The Movie struct defines the attributes of a movie:

```
id: UUID
title: String
year: String
genre: String
description: String
thumbURL: String
```

## Movie List Screen:

The app displays a screen listing movies fetched from a statically defined array of Movie instances. Each movie is displayed with its title and release year. Navigation from the movie list to the detail screen is implemented using the coordinator pattern.

## Movie Details Screen:

The details screen presents detailed information about the selected movie. It displays the movie's title, year, genre, and description. The layout is designed to be user friendly and intuitive.

## Coordinator Pattern:

The coordinator pattern is employed to manage navigation within the app. Navigation between screens is handled by dedicated coordinator objects, separating navigation logic from view and view model layers.

## Observability:

The `@Observable` property wrapper is used for managing the state of movie data within views.
State changes are observed and reflected in the UI accordingly, providing a reactive and responsive user experience.

