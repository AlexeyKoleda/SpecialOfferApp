import UIKit
import SnapKit

extension UIView {
    /// Add array of view to subviews
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}

extension UIView {
    /// Add shadow to view
    func addShadow(
        shadowColor: CGColor,
        shadowOffset: CGSize,
        shadowOpacity: Float,
        shadowRadius: CGFloat
    ) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
}

extension UIView {
    /// Pinned childview to the center of superview
    func addChildSubviewByPinningEdges(_ view: UIView) {
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}

//MARK: - Animations -
extension UIView {
    func pushOutTransition(_ duration: CFTimeInterval) {
        transition(duration, function: .easeOut, type: .push, subtype: .fromBottom)
    }
    
    func pushInTransition(_ duration: CFTimeInterval) {
        transition(duration, function: .easeIn, type: .push, subtype: .fromTop)
    }
    
    private func transition(_ duration: CFTimeInterval, function: CAMediaTimingFunctionName = .linear, type: CATransitionType = .push, subtype: CATransitionSubtype = .fromBottom) {
        let animation: CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: function)
        animation.type = type
        animation.subtype = subtype
        animation.duration = duration
        layer.add(animation, forKey: type.rawValue)
    }
}
