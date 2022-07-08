import UIKit
import SnapKit

final class TimerView: UIView {

    private let contentContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .black
        container.layer.cornerRadius = 5
        return container
    }()

    // MARK: - LABELS -
    let days: TimerSegment =
        .makeTimerSegment("", font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    let hours: TimerSegment =
        .makeTimerSegment("", font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    let minutes: TimerSegment =
        .makeTimerSegment("", font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    let seconds: TimerSegment =
        .makeTimerSegment("", font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    let firstDivider: UILabel =
        .makeTimerDivider(font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    let secondDivider: UILabel =
        .makeTimerDivider(font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    let thirdDivider: UILabel =
        .makeTimerDivider(font: .systemFont(ofSize: 10.scalable(), weight: .semibold))

    private lazy var stackView: UIStackView = .makeStackView(
        [days, firstDivider, hours, secondDivider, minutes, thirdDivider, seconds],
        spacing: 5,
        axis: .horizontal,
        distribution: .equalSpacing)

    // MARK: - LAYOUT -
    func setupView() {
        setupContentContainerView()
    }

    private func setupContentContainerView() {
        addSubview(contentContainer)
        contentContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentContainer.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let segments = [days, hours, minutes, seconds]

        segments.forEach { label in
            label.snp.makeConstraints { make in
                make.width.equalTo(25.scalable())
            }
        }
    }
}

private extension UIView {

    static func makeTimerSegment(
        _ text: String,
        font: UIFont,
        textColor: UIColor = .white,
        textAlignement: NSTextAlignment = .center
    ) -> TimerSegment {
        let segment = TimerSegment()
        segment.backgroundColor = .darkGray
        segment.layer.cornerRadius = 10
        segment.label.text = text
        segment.label.textColor = textColor
        segment.label.font = font
        segment.label.textAlignment = textAlignement
        segment.label.layer.masksToBounds = true
        segment.label.translatesAutoresizingMaskIntoConstraints = false
        segment.clipsToBounds = true
        return segment
    }

    static func makeTimerDivider(
        font: UIFont,
        textColor: UIColor = .white,
        textAlignement: NSTextAlignment = .center
    ) -> UILabel {
        let label = UILabel()
        label.text = ":"
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignement
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
