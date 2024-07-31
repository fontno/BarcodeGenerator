//
//  BarcodePDF417.swift
//  
//
//  Created by Brian Fontenot on 7/30/24.
//

import SwiftUI

/// Generate a PDF417 barcode image for message data.
public struct BarcodePDF417: UIViewRepresentable {
    
    /// The message that is encoded in the PDF417 Barcode
    public var input: String
    
    /// if set to true, the barcode color is inverted
    /// default value is false
    public var invertColor = false
    
    /// The compaction mode of the generated barcode.
    /// Min: 0.0 Max: 3.0
    public var compactionMode: Float? = nil
    
    /// Force a compact style Aztec code..
    /// Set to nil for automatic.
    /// Min: 0.0 Max: 1.0
    public var compactStyle: Float? = nil
    
    /// The correction level ratio of the generated barcode.
    /// Min: 0.0 Max: 8.0
    public var correctionLevel: Float? = nil
    
    /// The number of data columns in the generated barcode.
    /// Min: 1.0 Max: 30.0
    public var dataColumns: Float? = nil
    
    /// The maximum width of the generated barcode in pixels.
    /// Min: 56.0 Max: 583.0
    public var maxWidth: Float? = nil
    
    /// The maximum height of the generated barcode in pixels.
    /// Min: 13.0 Max: 283.0
    public var maxHeight: Float? = nil
    
    /// The minimum width of the generated barcode in pixels.
    /// Min: 56.0 Max: 583.0
    public var minWidth: Float? = nil
    
    /// The minimum height of the generated barcode in pixels.
    /// Min: 13.0 Max: 283.0
    public var minHeight: Float? = nil
    
    /// The preferred aspect ratio of the generated barcode
    /// Min: 0.0
    public var preferredAspectRatio: Float? = nil
    
    /// The number of rows in the generated barcode
    /// Min: 3.0 Max: 90.0
    public var rows: Float? = nil

    public func makeUIView(context: Context) -> UIImageView {
        return UIImageView()
    }
    
    public func updateUIView(_ uiImageView: UIImageView, context: Context) {
        guard let data = input.data(using: String.Encoding.ascii) else {
            return
        }
        guard let filter = CIFilter(name: "CIPDF417BarcodeGenerator") else {
            return
        }
        
        if let dataColumns = dataColumns {
            let clamped = max(min(dataColumns, 30), 1)
            filter.setValue(clamped, forKey: "inputDataColumns")
        }
        
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue(compactionMode?.clamped(min: 0, max: 3), forKey: "inputCompactionMode")
        filter.setValue(compactStyle?.clamped(min: 0, max: 1), forKey: "inputCompactStyle")
        filter.setValue(correctionLevel?.clamped(min: 0, max: 8), forKey: "inputCorrectionLevel")
        filter.setValue(dataColumns?.clamped(min: 1, max: 30), forKey: "inputDataColumns")
        filter.setValue(maxWidth?.clamped(min: 56, max: 583), forKey: "inputMaxWidth")
        filter.setValue(maxHeight?.clamped(min: 13, max: 283), forKey: "inputMaxHeight")
        filter.setValue(minWidth?.clamped(min: 56, max: 583), forKey: "inputMinWidth")
        filter.setValue(minHeight?.clamped(min: 13, max: 283), forKey: "inputMinHeight")
        filter.setValue(preferredAspectRatio?.floor(min: 0), forKey: "inputPreferredAspectRatio")
        filter.setValue(rows?.clamped(min: 3, max: 90), forKey: "inputRows")

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
