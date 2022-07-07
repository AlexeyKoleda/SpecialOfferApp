import UIKit

final class GradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let lay = CAGradientLayer()
        lay.frame = self.bounds
        lay.colors = [UIColor(named: "PinkColor")!.cgColor, UIColor(named: "BlueColor")!.cgColor]
        lay.startPoint = CGPoint(x: 0, y: 1)
        lay.endPoint = CGPoint(x: 0, y: 0)
        lay.cornerRadius = 12
        layer.insertSublayer(lay, at: 0)
        return lay
    }()
}
