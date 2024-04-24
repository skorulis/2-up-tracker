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
    
    case happy1, happy2, happy3, happy4, happy5, happy6, happy7, happy8, happy9, happy10
    case odd2, odd3
    case ok1, ok2
    case pain1
    case plain1, plain2, plain3, plain5, plain6, plain7, plain8, plain9
    case pray1
    case shocked1, shocked2, shocked3, shocked4, shocked5
    case stoned1, stoned2, stoned3
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
        case .happy9: return 54
        case .happy10: return 55
        case .odd2: return -80
        case .odd3: return -50
        case .ok1: return 20
        case .ok2: return 30
        case .pain1: return -30
        case .plain1: return 10
        case .plain2: return 10
        case .plain3: return 10
        case .plain5: return 20
        case .plain6: return 20
        case .plain7: return 20
        case .plain8: return 15
        case .plain9: return 22
        case .pray1: return -5
        case .shocked1: return -50
        case .shocked2: return -50
        case .shocked3: return -50
        case .shocked4: return -55
        case .shocked5: return -40
        case .stoned1: return -80
        case .stoned2: return -80
        case .stoned3: return -50
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
    
}

struct PTImageProvider: StatusImageProvider {
    typealias ObjectType = PTImage
    var negativeSorted: [PTImage] { PTImage.negativeSorted }
    var neutral: PTImage { PTImage.neutral }
    var positiveSorted: [PTImage] { PTImage.positiveSorted }
}
