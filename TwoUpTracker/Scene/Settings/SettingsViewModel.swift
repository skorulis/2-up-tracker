//Created by Alexander Skorulis on 7/4/2023.

import Foundation

final class SettingsViewModel: ObservableObject {
    
    private let store: MainStore
    
    @Published var limit: String = "" {
        didSet {
            if let value = Int(limit) {
                self.store.limit = value
            }
        }
    }
    
    init(store: MainStore) {
        self.store = store
        store.$limit
            .map { "\($0)"}
            .assign(to: &$limit)
    }
    
}
