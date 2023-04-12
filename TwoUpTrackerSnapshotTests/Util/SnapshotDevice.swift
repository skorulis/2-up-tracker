//Created by Alexander Skorulis on 9/4/2023.

import Foundation
import UIKit

struct SnapshotDevice {
    
    let type: String
    let runtime: String
    
    static var current: SnapshotDevice {
        let info = ProcessInfo().environment["SIMULATOR_VERSION_INFO"]!
        let regex1 = /DeviceType: (.*)$/
        let regex2 = /Runtime: (.*) \(/
        let type = try! regex1.firstMatch(in: info)!.output.1
        let version = try! regex2.firstMatch(in: info)!.output.1
        return SnapshotDevice(type: String(type), runtime: String(version))
    }
    
    var fileKey: String {
        let typeSan = type.replacingOccurrences(of: " ", with: "_")
        let versionSan = runtime.replacingOccurrences(of: " ", with: "_")
        return "\(typeSan)_\(versionSan)"
    }
    
    var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
    
}
