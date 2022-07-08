import UIKit

final class TimerSegment: UIView {
    let label: UILabel = UILabel()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(label)
        self.addChildSubviewByPinningEdges(label)
    }
}
