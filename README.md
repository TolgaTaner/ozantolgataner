# Ozan SuperApp iOS Code Challenge

This repository contains the Ozan SuperApp iOS Code Challenge, which retrieves cryptocurrency data from the provided API and displays it in a well-structured UI. The app consists of two main screens: a home page listing all cryptocurrencies and a detail page showing detailed information about a selected cryptocurrency.

<br>

## 🏛 Chosen Architecture and Design Patterns

* MVVM (Model-View-ViewModel): Ensures separation of concerns, making the codebase more maintainable, testable, and readable.

* Builder Pattern: Used for modularizing features such as home and detail modules, improving scalability.

* Dependency Injection: Helps manage dependencies efficiently and improves testability.

<br>

## ✅ Features

* Displays a list of cryptocurrencies with formatted prices.

* Allows sorting by price, market cap, 24h volume, change, and listing date.

* Detail page provides information like name, rank, symbol, change rate, high-low values.

* Error handling for network failures and empty responses.


<br>

## ⚠️ Error Handling and Edge Cases

* Handles network failures with user-friendly error messages.

* Gracefully processes empty API responses.

* Displays loading indicators for slow network conditions.

* Ensures data consistency with fallback mechanisms.

<br>

## 🚀 Possible Improvements

* Localization could be implemented for multi-language support.

* Pagination could be introduced to handle large datasets efficiently.

* UI could be enhanced with animations and better transitions.

* Unit tests could be written for utility functions and for covering edge cases like missing data and API failures.
  
* Extensive manual testing is needed on multiple devices.

* Preferred currency sign and default sorting strategy options could be retrieved from backend service to provide flexibility for future.

* By default, cryptocurrencies are sorted in descending order. It would be useful to have an option to toggle the sorting direction.

* STWebImageCoder library is used to establish connection with backend to download SVG images. This library uses http protocol which can bring security problems. Security tests can take place for precaution.

<br>

## 📌 Prerequisites

Hardware: MacBook (or any macOS-supported device)

Software: Xcode 15+

<br>

## 🔧 Installation Steps

Clone the repository:
```
git clone <repository_url>
```

Open the project in Xcode:
```
cd OzanSuperApp
open OzanSuperApp.xcodeproj
```

Run the project on an iOS simulator or device.
