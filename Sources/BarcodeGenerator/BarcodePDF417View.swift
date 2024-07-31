//
//  BarcodePDF417View.swift
//
//
//  Created by Brian Fontenot on 7/30/24.
//

import SwiftUI

/// A SwiftUI View that generate a PDF417 barcode image for message data.
public struct BarcodePDF417View: View {
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
    
    public var body: some View {
        BarcodePDF417(input: input)
    }
}

#Preview {
    BarcodePDF417View(input: "Hello World")
}
