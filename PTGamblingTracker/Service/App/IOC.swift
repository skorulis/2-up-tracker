//
//  IOC.swift
//  Magic
//
//  Created by Alexander Skorulis on 28/8/21.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import ASKCore

public final class IOC: IOCService {
    
    override init(purpose: IOCPurpose = .testing) {
        super.init(purpose: purpose)
        setupServices()
        setupViewModels()
        setupProcessors()
        setupAccess()
        registerStores()        
    }
    
    
    private func setupProcessors() {
        
    }
    
    private func setupAccess() {
        
    }
    
    private func setupServices() {
        container.autoregister(ErrorService.self, initializer: ErrorService.init)
    }
    
    private func registerStores() {
        container.autoregister(MainStore.self, initializer: MainStore.init)
            .inObjectScope(.container)
    }
    
    private func setupViewModels() {
        container.autoregister(BetsViewModel.self, initializer: BetsViewModel.init)
        container.autoregister(BetHistoryViewModel.self, initializer: BetHistoryViewModel.init)
        container.autoregister(BetsChartViewModel.self, initializer: BetsChartViewModel.init)
    }
    
    func resolve<ServiceType>(_ type: ServiceType.Type) -> ServiceType? {
        return container.resolve(type)
    }
    
}
