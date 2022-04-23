//
//  IOC.swift
//  Magic
//
//  Created by Alexander Skorulis on 28/8/21.
//

import Foundation
import Swinject
import SwinjectAutoregistration

public final class IOC {
    
    static let shared: IOC = IOC()
    
    public let container: Container
    
    public init() {
        container = Container()
        setupFactories()
        setupServices()
        setupViewModels()
        setupProcessors()
        setupAccess()
        registerStores()
        
        DispatchQueue.main.async {
            self.startup()
        }
        
    }
    
    private func startup() {
        
    }
    
    private func setupFactories() {
        container.register(GenericFactory.self) { (_) -> GenericFactory in
            return GenericFactory(container: self.container)
        }
        .inObjectScope(.container)
    }
    
    private func setupProcessors() {
        
    }
    
    private func setupAccess() {
        
    }
    
    private func setupServices() {
        container.autoregister(ErrorService.self, initializer: ErrorService.init)
    }
    
    private func registerStores() {
        
    }
    
    private func setupViewModels() {
        container.autoregister(BetsViewModel.self, initializer: BetsViewModel.init)
    }
    
    func resolve<ServiceType>(_ type: ServiceType.Type) -> ServiceType? {
        return container.resolve(type)
    }
    
}
