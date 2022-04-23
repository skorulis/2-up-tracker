//
//  PTImage.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation

enum PTImage: String, CaseIterable {
    
    case neutral // Single image at the neutral position
    
    case angry1
    case angry2
    
    case happy1, happy2, happy3
    case odd2
    case plain1, plain2, plain3, plain4
    case shocked1, shocked2, shocked3
    case stoned1, stoned2
    case winning1, winning2
    
}

extension PTImage {
    
    var imageName: String {
        return rawValue
    }
    
    var value: Double {
        switch self {
        case .neutral: return 0
        case .angry1: return -100
        case .angry2: return -100
        case .happy1: return 50
        case .happy2: return 50
        case .happy3: return 50
        case .odd2: return -10
        case .plain1: return 10
        case .plain2: return 10
        case .plain3: return 10
        case .plain4: return 10
        case .shocked1: return -50
        case .shocked2: return -50
        case .shocked3: return -50
        case .stoned1: return -80
        case .stoned2: return -80
        case .winning1: return 100
        case .winning2: return 100
        }
    }
    
    static var sorted: [PTImage] {
        return allCases.sorted(by: PTImage.sort(p1:p2:))
    }
    
    static var positiveSorted: [PTImage] {
        return allCases
            .filter { $0.value > 0}
            .sorted(by: PTImage.sort(p1:p2:))
    }
    
    static var negativeSorted: [PTImage] {
        return allCases
            .filter { $0.value < 0}
            .sorted(by: PTImage.sort(p1:p2:))
    }
    
    static func sort(p1: PTImage, p2: PTImage) -> Bool {
        return p1.value < p2.value
    }
    
    static func image(value: Double) -> PTImage {
        if value == 0.5 {
            return .neutral
        } else if value < 0.5 {
            let images = negativeSorted
            let top = Double(images.count - 1)
            let index = round(top * value * 2)
            return images[Int(index)]
        } else {
            let images = positiveSorted
            let top = Double(images.count - 1)
            let adjusted = (value - 0.5) * 2
            let index = round(top * adjusted)
            return images[Int(index)]
        }
    }
    
    
    
    
}
