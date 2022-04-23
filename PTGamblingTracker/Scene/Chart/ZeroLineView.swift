//
//  ZeroLineView.swift
//  PTGamblingTracker
//
//  Created by Alexander Skorulis on 23/4/2022.
//

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct ZeroLineView {
    
    @Environment(\.xScale) var xScale
    @Environment(\.yScale) var yScale
}

// MARK: - Rendering

extension ZeroLineView: View {
    
    var body: some View {
        let y = yScale.toView(v: 0)
        Path { path in
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: 1000, y: y))
        }
        .stroke(Color.gray.opacity(0.3))
    }
}

// MARK: - Previews

struct ZeroLineView_Previews: PreviewProvider {
    
    static var previews: some View {
        ZeroLineView()
    }
}

