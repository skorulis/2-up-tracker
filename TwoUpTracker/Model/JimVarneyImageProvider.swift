//Created by Alexander Skorulis on 8/4/2023.

import Foundation
import SwiftUI

struct JimVarneyImageProvider: StatusImageProvider {
    typealias ObjectType = Image
    
    var negativeSorted: [Image] {
        [
            Image("jw-fright"),
            Image("jw-stunned"),
            Image("jw-mad"),
            Image("jw-sad"),
            Image("jw-guilty"),
            Image("jw-surprised"),
        ]
    }
    
    var neutral: Image { Image("jw-tired") }
    
    var positiveSorted: [Image] {
        [
            Image("jw-shy"),
            Image("jw-suspicious"),
            Image("jw-disgusted"),
            Image("jw-confident"),
            Image("jw-happy"),
        ]
    }
}
