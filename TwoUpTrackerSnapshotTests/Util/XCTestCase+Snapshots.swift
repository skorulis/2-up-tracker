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
        
        //var measuredSize: CGSize?
        
        let measuredView = view
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            //measuredSize = proxy.size
                        }
                }
            )
        
        let hosting = UIHostingController(rootView: measuredView)
        //hosting.view.frame = hosting.view.window!.screen.bounds
        
        SnapshotTesting.assertSnapshot(
            matching: hosting,
            as: .image,
            file: file,
            testName: testName,
            line: line
        )
        
    }
    
    func measure(viewController: UIViewController) {
        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = .clear
        
    }
    
}
