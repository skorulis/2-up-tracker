//
//  Color+Additions.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation
import SwiftUI

extension Color {
    
    static func bet(amount: Int) -> Color {
        if amount < 0 {
            return Color("negative")
        } else {
            return Color("positive")
        }
    }
}
