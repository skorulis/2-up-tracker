//Created by Alexander Skorulis on 7/4/2023.

import ASKDesignSystem
import Foundation
import SwiftUI

// MARK: - Memory footprint

struct SettingsView {
    
    @StateObject var viewModel: SettingsViewModel
}

// MARK: - Rendering

extension SettingsView: View {
    
    var body: some View {
        PageTemplate(nav: nav, content: content)
    }
    
    private func content() -> some View {
        VStack(alignment: .leading) {
            Text("Betting Limit")
                .typography(.subtitle)
            TextField("Limit", text: $viewModel.limit)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            
            Text("Image type")
                .typography(.subtitle)
            
            Picker("Image Type", selection: $viewModel.imageType) {
                ForEach(ImageType.allCases) { type in
                    Text(type.name)
                        .tag(type)
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    private func nav() -> some View {
        NavBar(mid: NavBarItem.title("Settings"))
    }
}

// MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC()
        SettingsView(viewModel: ioc.resolve())
    }
}

