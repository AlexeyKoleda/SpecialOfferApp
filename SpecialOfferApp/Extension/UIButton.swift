import UIKit

extension UIButton {
    /// Helper to simplify creating system buttons
    static func makeSystemBytton(
        _ title: String,
        font: UIFont,
        color: UIColor = .lightGray
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.setTitleColor(color, for: .normal)
        return button
    }
}
