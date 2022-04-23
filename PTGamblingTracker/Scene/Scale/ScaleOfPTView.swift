//  Created by Alexander Skorulis on 23/4/2022.

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct ScaleOfPTView {

    @State private var position: CGFloat = 0.5
}

// MARK: - Rendering

extension ScaleOfPTView: View {
    
    var body: some View {
        VStack {
            Image(currentImageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Slider(value: $position)
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Logic

private extension ScaleOfPTView {
    
    var imageOptions: [PTImage] {
        return PTImage.sorted
    }
    
    var currentImage: PTImage {
        return PTImage.image(value: position)
    }
    
    var currentImageName: String {
        return currentImage.imageName
    }
}

// MARK: - Previews

struct ScaleOfPTView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScaleOfPTView()
    }
}

