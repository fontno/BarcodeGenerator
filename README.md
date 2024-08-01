# Barcode Generator

Swift package to easily generate barcodes in your SwiftUI projects

## Barcode Generators
- [x] Code 128 Barcode   
  - [ ] example image
- [x] PDF417 Barcode 
  - [ ] example image
- [x] Aztec Barcode 
  - [ ] example image
  

## Usage

### Code 128 Barcode

```swift
import BarcodeGenerator

struct ContentView: View {
    var body: some View {
        Barcode128View(input: "12345678")
    }
}
```

### PDF417 Barcode

```swift
import BarcodeGenerator

struct ContentView: View {
    var body: some View {
        BarcodePDF417View(input: "12345678")
    }
}
```

### Aztec Barcode

```swift
import BarcodeGenerator

struct ContentView: View {
    var body: some View {
        AztecBarcodeView(input: "12345678")
    }
}
```

### Required parameters - init 
- `input` - The `String` message that is encoded in the Barcode


## Requirements

* iOS 16.0+ 

## Installation 

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
dependencies: [
    .package(url: "https://github.com/fontno/BarcodeGenerator.git")
]
```

## Hire Me

I am available to work on Swift projects. 

Contact me on github to talk.
