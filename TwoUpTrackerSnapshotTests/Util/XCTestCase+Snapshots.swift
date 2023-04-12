//Created by Alexander Skorulis on 7/4/2023.

import Foundation
import SnapshotTesting
import SwiftUI
import XCTest

public extension XCTestCase {
    
    func assertSnapshot<T: View>(
        view: T,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        let device = SnapshotDevice.current
        
        let hosting = UIHostingController(rootView: view)
        hosting.view.frame = CGRect(origin: .zero, size: device.screenSize)
        //measure(viewController: hosting, device: device)
        
        SnapshotTesting.assertSnapshot(
            matching: hosting,
            as: .image,
            file: file,
            testName: testName,
            line: line
        )
        
    }
    
    private func measure(viewController: UIViewController, device: SnapshotDevice) {
        let bounds = CGRect(origin: .zero, size: device.screenSize)
        let rootViewController = UIViewController()
        rootViewController.view.bounds = bounds
        rootViewController.view.backgroundColor = .clear
        rootViewController.preferredContentSize = bounds.size
        rootViewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.frame = bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        rootViewController.view.addSubview(viewController.view)
        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: rootViewController.view.topAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor),
            viewController.view.leftAnchor.constraint(equalTo: rootViewController.view.leftAnchor),
            viewController.view.rightAnchor.constraint(equalTo: rootViewController.view.rightAnchor)
        ])
        
        rootViewController.addChild(viewController)
        
        let window = UIWindow(frame: bounds)
        window.isHidden = true
        window.rootViewController = rootViewController
        rootViewController.view.setNeedsLayout()
        rootViewController.view.layoutIfNeeded()
    }
    
}
