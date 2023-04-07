//Created by Alexander Skorulis on 7/4/2023.

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct PTImageView {
    let total: Int
    let limit: Int
    let provider: any StatusImageProvider
}

// MARK: - Rendering

extension PTImageView: View {
    
    var body: some View {
        render(currentImage)
    }
    
    @ViewBuilder
    private func render(_ obj: Any) -> some View {
        if let ptImage = obj as? PTImage {
            Image(ptImage.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
        } else if let emoji = obj as? String {
            Text(emoji)
                .font(.system(size: 100))
                .frame(height: 200)
        } else {
            fatalError()
        }
    }
    
    private var currentPosition: Double {
        if total == 0 || limit == 0 {
            return 0.5
        }
        let dLimit = Double(limit)
        var position = (Double(total) + dLimit) / (dLimit * 2)
        position = max(min(position, 1), 0)
        return position
    }
    
    var currentImage: Any {
        return provider.image(value: currentPosition)
    }
}

// MARK: - Previews

struct PTImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        HStack {
            VStack {
                PTImageView(total: 0, limit: 0, provider: PTImageProvider())
                PTImageView(total: 200, limit: 450, provider: PTImageProvider())
                PTImageView(total: -200, limit: 450, provider: PTImageProvider())
            }
            
            VStack {
                PTImageView(total: 0, limit: 0, provider: EmojiImageProvider())
                PTImageView(total: 200, limit: 450, provider: EmojiImageProvider())
                PTImageView(total: -200, limit: 450, provider: EmojiImageProvider())
            }
        }
        
        
    }
}

