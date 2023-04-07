//Created by Alexander Skorulis on 7/4/2023.

import Foundation

struct EmojiImageProvider: StatusImageProvider {
    
    var negativeSorted: [String] {
        return [
            "🤮",
            "😵",
            "🫣",
            "😬",
            "😧",
            "☹️",
            "🫢",
            "😟",
            "😕",
            "😒",
        ]
    }
    
    var neutral: String { "😐" }
    
    var positiveSorted: [String] {
        return [
            "😀",
            "😄",
            "🤣",
            "🤩",
            "🤑",
        ]
    }
    
}
