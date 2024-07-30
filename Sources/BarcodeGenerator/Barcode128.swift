//
//  Barcode128.swift
//
//
//  Created by Brian Fontenot on 7/29/24.
//

import SwiftUI

/// A UIViewRepresentable that generates a Code 128 barcode image for message data.
public struct Barcode128: UIViewRepresentable {
    
    /// The message that is encoded in the Barcode
    public var input: String
    
    /// Applies an invert color filter
    public var invertColor = false
    
    /// The height of the generated barcode in pixels.
    /// Min: 1.0 Max: 500.0
    public var height: Float? = nil
    
    /// The number of empty white pixels that should surround the barcode.
    /// Min: 0.0 Max: 100.0
    public var quietSpace: Float? = nil
    
    public func makeUIView(context: Context) -> UIImageView {
        return UIImageView()
    }
    
    public func updateUIView(_ uiImageView: UIImageView, context: Context) {
        guard let data = input.data(using: String.Encoding.ascii) else {
            return
        }
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else {
            return
        }
        
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue(height?.clamped(min: 1, max: 500), forKey: "inputBarcodeHeight")
        filter.setValue(quietSpace?.clamped(min: 0, max: 100), forKey: "inputQuietSpace")
        
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
