//
//  Float+Extensions.swift
//
//
//  Created by Brian Fontenot on 7/29/24.
//

import Foundation

extension Float {
    
    /// Clamps value between min and max values.
    /// If Self is lower than min value, the min value is returned.
    /// If Self is higher than max value, the max value is returned.
    /// - Parameters:
    ///   - minValue: the minimum value allowed.
    ///   - maxValue: the maximum value allowed.
    /// - Returns: Float
    ///
    func clamped(min minValue: Float, max maxValue: Float) -> Float {
        let clamped = min(max(minValue, self), maxValue)
        
        return clamped
    }
    
    /// Prevents Self from going below the minimum value.
    /// If Self is lower than min value, the min value is returned.
    /// - Parameters:
    ///   - minValue: the minimum value allowed.
    /// - Returns: Float
    ///
    func floor(min minValue: Float) -> Float {
        return max(self, minValue)
    }
}
