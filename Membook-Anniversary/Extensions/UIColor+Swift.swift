import UIKit
import SwiftUI

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha
        )
    }
    
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        guard hexString.count == 6 else { return nil }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    var hexString: String {
        guard let components = cgColor.components, components.count >= 3 else {
            return "#000000"
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        
        return String(format: "#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
    
    static let mintCream: UIColor = {
        return UIColor(hex: "#C5E8DF") ?? UIColor(red: 0.77, green: 0.91, blue: 0.87, alpha: 1.0)
    }()
    
    static let lemonChiffon: UIColor = {
        return UIColor(hex: "#FEEFCB") ?? UIColor(red: 1.00, green: 0.94, blue: 0.80, alpha: 1.0)
    }()
    
    static let skyBlue: UIColor = {
        return UIColor(hex: "#DAF1F6") ?? UIColor(red: 0.85, green: 0.95, blue: 0.96, alpha: 1.0)
    }()
    
    static let customOrange: UIColor = {
        return UIColor(hex: "#EF7B7B") ?? UIColor.orange
    }()
}

extension Color {
    static func fromUIColor(_ uiColor: UIColor) -> Color {
        return Color(uiColor: uiColor)
    }
    
    init(fromUIColor uiColor: UIColor) {
        self.init(uiColor: uiColor)
    }
    static let customOrange = Color(uiColor: .customOrange)
}
