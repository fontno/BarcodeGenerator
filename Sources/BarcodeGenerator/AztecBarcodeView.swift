//
//  AztecBarcodeView.swift
//
//
//  Created by Brian Fontenot on 7/31/24.
//

import SwiftUI

public struct AztecBarcodeView: View {
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
    
    public var body: some View {
        AztecBarcode(input: input, invertColor: invertColor, compactStyle: compactStyle, layers: layers, correctionLevel: correctionLevel)
    }
}

#Preview {
    AztecBarcodeView(input: "Hello World")
}
