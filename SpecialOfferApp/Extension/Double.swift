import UIKit

extension Double {
    /// Return dynamic size to fonts depending on screen size
    func scalable() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let calculatedFontSize = screenWidth / 375 * self
        return calculatedFontSize
    }
}
