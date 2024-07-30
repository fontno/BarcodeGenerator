//
//  Barcode128View.swift
//
//
//  Created by Brian Fontenot on 7/29/24.
//

import SwiftUI

/// A SwiftUI View that generate a Code 128 barcode image for message data.
public struct Barcode128View: View {
    
    /// The message that is encoded in the Barcode
    public var input: String
    
    /// Applies an invert color filter
    public var invertColor: Bool = false
    
    /// The height of the generated barcode in pixels.
    /// Min: 1.0 Max: 500.0
    public var height: Float? = nil
    
    /// The number of empty white pixels that should surround the barcode.
    /// Min: 0.0 Max: 100.0
    public var quietSpace: Float? = nil
    
    public var body: some View {
        Barcode128(input: input, invertColor: invertColor,  height: height, quietSpace: quietSpace)
    }
}

#Preview {
    Barcode128(input: "Hello world")
}
