//
//  PTImage.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation

enum PTImage: String, CaseIterable {
    
    case neutral // Single image at the neutral position
    
    case angry1, angry2
    
    case happy1, happy2, happy3, happy4, happy5, happy6, happy7, happy8
    case odd2, odd3
    case ok1, ok2
    case plain1, plain2, plain3, plain5, plain6, plain7
    case shocked1, shocked2, shocked3, shocked4
    case stoned1, stoned2
    case unsure1, unsure2, unsure3, unsure4, unsure5, unsure6, unsure7, unsure8, unsure9
    case what1, what2, what3
    case winning1, winning2, winning3, winning4, winning5
    
    
    
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
        case .happy4: return 55
        case .happy5: return 60
        case .happy6: return 40
        case .happy7: return 52
        case .happy8: return 53
        case .odd2: return -80
        case .odd3: return -50
        case .ok1: return 20
        case .ok2: return 30
        case .plain1: return 10
        case .plain2: return 10
        case .plain3: return 10
        case .plain5: return 20
        case .plain6: return 20
        case .plain7: return 20
        case .shocked1: return -50
        case .shocked2: return -50
        case .shocked3: return -50
        case .shocked4: return -55
        case .stoned1: return -80
        case .stoned2: return -80
        case .unsure1: return -20
        case .unsure2: return -21
        case .unsure3: return -22
        case .unsure4: return -19
        case .unsure5: return -20
        case .unsure6: return -18
        case .unsure7: return -15
        case .unsure8: return -20
        case .unsure9: return -23
        case .what1: return 4
        case .what2: return -12
        case .what3: return -45
        case .winning1: return 100
        case .winning2: return 100
        case .winning3: return 70
        case .winning4: return 80
        case .winning5: return 75
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
