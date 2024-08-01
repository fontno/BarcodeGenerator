//
//  AztecBarcode.swift
//
//
//  Created by Brian Fontenot on 7/31/24.
//

import SwiftUI

/// A UIViewRepresentable that generates an Aztec barcode image for message data.
public struct AztecBarcode: UIViewRepresentable {
    
    /// The message to encode in the Aztec Barcode.
    public var input: String
    
    /// Applies an invert color filter
    public var invertColor = false
    
    /// Force a compact style Aztec code.
    /// Set to nil for automatic.
    /// Min: 0.0 Max: 1.0
    public var compactStyle: Float? = nil
    
    /// Aztec layers.
    /// Set to nil for automatic.
    /// Min: 1.0 Max: 32.0
    public var layers: Float? = nil
    
    /// Aztec error correction value.
    /// Min: 5.0 Max: 95.0
    public var correctionLevel: Float? = nil
    
    
    public func makeUIView(context: Context) -> UIImageView {
        return UIImageView()
    }
    
    public func updateUIView(_ uiImageView: UIImageView, context: Context) {
        guard let data = input.data(using: String.Encoding.ascii) else {
            return
        }
        guard let filter = CIFilter(name: "CIAztecCodeGenerator") else {
            return
        }
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue(compactStyle?.clamped(min: 0, max: 1), forKey: "inputCompactStyle")
        filter.setValue(correctionLevel?.clamped(min: 5, max: 95), forKey: "inputCorrectionLevel")
        filter.setValue(layers?.clamped(min: 1, max: 32), forKey: "inputLayers")
       
        guard let output = filter.outputImage else {
            return
        }
        
        if invertColor {
            guard let invertFilter = CIFilter(name: "CIColorInvert") else {
                return
            }
            invertFilter.setValue(output, forKey: "inputImage")
            guard let invertOutput = invertFilter.outputImage else {
                return
            }
            uiImageView.image = UIImage(ciImage: invertOutput)
        } else {
            uiImageView.image = UIImage(ciImage: output)
        }
    }
}

