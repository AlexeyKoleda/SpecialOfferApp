import UIKit

extension UILabel {
    /// Helper to simplify creating labels
    static func makeLabel(_ text: String, font: UIFont, textColor: UIColor = .white, textAlignement: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignement
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
