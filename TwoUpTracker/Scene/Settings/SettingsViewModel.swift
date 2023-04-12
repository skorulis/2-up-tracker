//Created by Alexander Skorulis on 7/4/2023.

import Foundation

final class SettingsViewModel: ObservableObject {
    
    let store: MainStore
    
    @Published var showingClearAlert: Bool = false
    
    @Published var limit: String = "" {
        didSet {
            if let value = Int(limit) {
                self.store.limit = value
            }
        }
    }
    
    @Published var imageType: ImageType = .emoji {
        didSet {
            store.imageType = imageType
        }
    }
    
    init(store: MainStore) {
        self.store = store
        store.$limit
            .map { "\($0)"}
            .assign(to: &$limit)
        
        store.$imageType
            .assign(to: &$imageType)
        
    }
    
}

// MARK: - Logic

extension SettingsViewModel {
    func clearBets() {
        self.store.bets = []
    }
}
