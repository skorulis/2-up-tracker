//Created by Alexander Skorulis on 7/4/2023.

import ASKDesignSystem
import Foundation
import SwiftUI

// MARK: - Memory footprint

struct SettingsView {
    
    @StateObject var viewModel: SettingsViewModel
    @State private var sliderPos: Float = 0.5
}

// MARK: - Rendering

extension SettingsView: View {
    
    var body: some View {
        PageTemplate(nav: nav, content: content)
            .alert("Are you sure?", isPresented: $viewModel.showingClearAlert) {
                Button("Yes", role: .destructive, action: viewModel.clearBets)
                Button("No", role: .cancel) {}
            }
    }
    
    private func content() -> some View {
        VStack(alignment: .leading) {
            betLimit
            
            imagePicker
            
            Button(action: { viewModel.showingClearAlert = true }) {
                Text("Clear all bets")
            }
            .buttonStyle(ASKButtonStyle(flavor: .error))
            .padding(.top, 60)
        }
        .padding(.horizontal, 16)
    }
    
    private var betLimit: some View {
        HStack {
            Text("Betting Limit")
                .typography(.subtitle)
            TextField("Limit", text: $viewModel.limit)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button("Done") {
                            UIApplication.shared.endEditing()
                        }
                    }
                    ToolbarItem(placement: .keyboard) {
                        Spacer()
                    }
                }
        }
    }
    
    private var imagePicker: some View {
        VStack {
            HStack {
                Text("Emotion images")
                    .typography(.subtitle)
                Spacer()
                Picker("Image Type", selection: $viewModel.imageType) {
                    ForEach(ImageType.allCases) { type in
                        Text(type.name)
                            .tag(type)
                    }
                }
            }
            PTImageView(
                total: sliderValue,
                limit: 1000,
                provider: viewModel.store.imageType.provider
            )
            
            Slider(value: $sliderPos)
        }
    }
    
    private var sliderValue: Int {
        return Int((sliderPos - 0.5) * 2000)
    }
    
    private func nav() -> some View {
        NavBar(mid: NavBarItem.title("Settings"))
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


// MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ioc = IOC()
        SettingsView(viewModel: ioc.resolve())
    }
}

