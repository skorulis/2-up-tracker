//Created by Alexander Skorulis on 7/4/2023.

import Foundation

enum ImageType: String, Codable, CaseIterable, Identifiable {
    case emoji
    case ptImage
    
    var id: String { rawValue }
    
    var provider: any StatusImageProvider {
        switch self {
        case .ptImage:
            return PTImageProvider()
        case .emoji:
            return EmojiImageProvider()
        }
    }
    
    var name: String {
        switch self {
        case .ptImage:
            return "Faces of PT"
        case .emoji:
            return "Emoji"
        }
    }
    
}

protocol StatusImageProvider {
    associatedtype ObjectType
    var negativeSorted: [ObjectType] { get }
    var neutral: ObjectType { get }
    var positiveSorted: [ObjectType] { get }
}

extension StatusImageProvider {
    
    func image(value: Double) -> ObjectType {
        if value == 0.5 {
            return neutral
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
