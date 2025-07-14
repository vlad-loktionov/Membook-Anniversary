import Foundation
import SwiftUI

enum AnimalType: CaseIterable {
    case fox
    case elephant
    case pelican
    
    var backgroundColor: UIColor {
        switch self {
        case .fox: return .mintCream
        case .elephant: return .lemonChiffon
        case .pelican: return .skyBlue
        }
    }
    
    var backgroundImage: Image {
        switch self {
        case .fox: Image(.fox)
        case .elephant: Image(.elephant)
        case .pelican: Image(.pelican)
        }
    }
    
    var childPhoto: Image {
        switch self {
        case .fox: Image(.greenChild)
        case .elephant: Image(.yellowChild)
        case .pelican: Image(.blueChild)
        }
    }
    
    var cameraPhoto: Image {
        switch self {
        case .fox: Image(.greenCamera)
        case .elephant: Image(.yellowCamera)
        case .pelican: Image(.greenCamera)
        }
    }
}

extension AnimalType {
    static func random() -> AnimalType {
        return AnimalType.allCases.randomElement() ?? .elephant
    }
}
