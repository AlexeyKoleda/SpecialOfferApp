import UIKit

final class TimerSegment: UIView {
    let label: UILabel = UILabel()

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addChildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addChildView() {
        addSubview(label)
        addChildSubviewByPinningEdges(label)
    }
}
