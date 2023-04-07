//Created by Alexander Skorulis on 7/4/2023.

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct SettingsView {
    
    @StateObject var viewModel: SettingsViewModel
}

// MARK: - Rendering

extension SettingsView: View {
    
    var body: some View {
        VStack {
            TextField("Limit", text: $viewModel.limit)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

// MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC()
        SettingsView(viewModel: ioc.resolve())
    }
}

