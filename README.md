# SwiftyAd

## Overview  

This project is an iOS/iPadOS application that fetches and displays a **grid of ads** from an API. It is built using **Swift**, combining **SwiftUI** for the ads grid and **UIKit** for the ad details screen, while adhering to **SOLID principles**, particularly the **Single Responsibility Principle**.  

## Key Features  
- Fetches and displays ads from [this API](https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json).  
- Resolves category names using a separate API: [categories.json](https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json).  
- **SwiftUI for the ads grid view**: Presents ads in a responsive grid layout with a shimmer loading animation while the ads list is being fetched.  
- **UIKit for the ad details screen**: Tapping an ad navigates to a UIKit-based detail view displaying all available information.
- **Error handling and empty state**: Displays user-friendly error messages in case of network failures or empty responses, with an option to retry the operation.  
- Fully **compatible with iOS 16+**.  

## Additional Considerations  
- **Unit Tests**: Includes test coverage for key components such as the network layer and data handling logic.  

## Installation

1. **Clone the repository:**
    ```
    git clone https://github.com/frosa13/SwiftyAd.git
    ```
2. Open the project in Xcode, select a simulator or device, and run the app (Cmd + R).

## Usage
- The ads grid screen (built with SwiftUI) displays a scrollable grid of ads.
- Each ad includes an image, title, price, category, and an urgency indicator.
- Tap on an ad to open a detailed view (built with UIKit).
- The detail screen shows all available information about the selected ad:
    - Image, urgent indicator, date, title, category, price, siret number, and description.
- If an error occurs or the returned list is empty, an appropriate error message is displayed with a "Try Again" button.

## Testing
- To run the unit tests, execute Cmd + U in Xcode. The tests cover key components such as the network layer and data handling logic.

## Folder Structure

The project is organized into the following structure:
```
├── SwiftyAd/
│   ├── Model/
│   │   ├── Ad.swift
│   │   └── AdCategory.swift
│   ├── Network/
│   │   └── NetworkManager.swift
│   ├── Resources/
│   │   └── Assets.xcassets
│   ├── Utils/
│   │   ├── Extensions/
│   │   │   ├── Data+Extension.swift
│   │   │   ├── Float+Extension.swift
│   │   │   ├── String+Extension.swift
│   │   │   └── UILabel+Extension.swift
│   │   └── Constants.swift
│   ├── View/
│   │   ├── AdDetailsView.swift
│   │   ├── AdItemView.swift
│   │   ├── AdsGridView.swift
│   │   └── AdsView.swift
│   ├── ViewModel/
│   │   ├── AdItemViewModel.swift
│   │   ├── AdsGridViewModel.swift
│   │   └── AdsViewModel.swift
│   └── SwiftyAdApp.swift
└── SwiftAdTests/
    ├── Network/
    │   ├── MockNetwork/
    │   │   ├── MockData.swift
    │   │   └── MockURLProtocol.swift
    │   └── NetworkManagerTests.swift
    └── Utils/
        └── Extensions/
            ├── Float+ExtensionTests.swift
            └── String+ExtensionTests.swift
```

### SwiftyAd
- **Model**: Contains the data models, such as `Ad` and `AdCategory`.
- **Network**: Contains networking-related code, including the `NetworkManager` class that handles API calls.
- **Resources**: Contains assets like images and `.xcassets` for resources.
- **Utils**: Contains utility extensions (for `Data`, `Float`, `String`, and `UILabel`) and general constants used across the app.
- **View**: Contains views like `AdsGridView`, `AdDetailsView`, and `AdItemView`.
- **ViewModel**: Contains the view models responsible for the logic behind the views, such as `AdsGridViewModel` and `AdItemViewModel`.

### SwiftyAdTests
- **Network**: Contains network-related test mocks and test cases for `NetworkManager`.
- **Utils/Extensions**: Contains tests for utility extensions, like `Float` and `String`.

This structure follows a clean separation of concerns, ensuring that code is modular, maintainable, and scalable.

