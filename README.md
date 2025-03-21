# Ozan SuperApp iOS Code Challenge

This repository contains the Ozan SuperApp iOS Code Challenge, which retrieves cryptocurrency data from the provided API and displays it in a well-structured UI. The app consists of two main screens: a home page listing all cryptocurrencies and a detail page showing detailed information about a selected cryptocurrency.

<br>

## 🏛 Chosen Architecture and Design Patterns

#### MVVM (Model-View-ViewModel)
MVVM is a solid choice for small to mid-sized projects. It offers a balanced approach by separating concerns: the Model handles data, the View shows UI, and the ViewModel bridges them. This structure makes the code easier to maintain, test, and read, which is crucial for fast iterations and scaling. It's perfect for writing unit tests while keeping the app's logic clean and readable.

#### Builder Pattern
The Builder Pattern is used to modularize complex screens like Home and Detail. It helps break down features into smaller, manageable parts, improving flexibility and scalability. This pattern lets you build screens step by step, adapting easily to future changes without affecting the entire system.

#### Dependency Injection
Dependency Injection is key for keeping the app testable and decoupled. By injecting dependencies (like networking or data services) instead of creating them directly, you make the code more flexible and easy to test. It allows mocking and swapping implementations with minimal changes, ensuring better long-term maintainability.

<br>

## ✅ Features

* Displays a list of cryptocurrencies with formatted prices.

* Allows sorting by price, market cap, 24h volume, change, and listing date.

* Detail page provides information like name, rank, symbol, change rate, high-low values.

* Error handling for network failures and empty responses.


<br>

## 🚀 Possible Improvements

* Localization could be implemented for multi-language support.

* Pagination could be introduced to handle large datasets efficiently.

* Unit tests could be written for utility functions and for covering edge cases like missing data and API failures.
  
* Extensive manual testing is needed on multiple devices.

* Gray color could be introduced to represent unchanged prices.

* Preferred currency sign and default sorting strategy options could be retrieved from backend service to provide flexibility for future.

* By default, cryptocurrencies are sorted in descending order. It would be useful to have an option to toggle the sorting direction.

* SDWebImageCoder library is used to establish connection with backend to download SVG images. This library uses http protocol which can bring security problems. Security tests can take place for precaution.

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
