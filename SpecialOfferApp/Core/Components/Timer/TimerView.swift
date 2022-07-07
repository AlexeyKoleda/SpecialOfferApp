import UIKit
import SnapKit

class TimerView: UIView {
    
    private struct Settings {
        static let timerDivider = ":"

        static let multiplier: CGFloat = 0.2
    }
    
    private let contentContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .black
        container.layer.cornerRadius = 5
        return container
    }()
    
    //MARK: - LABELS -
    let days: UILabel = .makeTimerSegment("", font: .systemFont(ofSize: 22, weight: .semibold))
    let hours: UILabel = .makeTimerSegment("", font: .systemFont(ofSize: 22, weight: .semibold))
    let minutes: UILabel = .makeTimerSegment("", font: .systemFont(ofSize: 22, weight: .semibold))
    let seconds: UILabel = .makeTimerSegment("", font: .systemFont(ofSize: 22, weight: .semibold))
    
    let firstDivider: UILabel = .makeTimerDivider(font: .systemFont(ofSize: 22, weight: .semibold))
    let secondDivider: UILabel = .makeTimerDivider(font: .systemFont(ofSize: 22, weight: .semibold))
    let thirdDivider: UILabel = .makeTimerDivider(font: .systemFont(ofSize: 22, weight: .semibold))
                                                  
                                                  
    private lazy var stackView: UIStackView = .makeStackView(
        [days, firstDivider, hours, secondDivider, minutes, thirdDivider, seconds],
        spacing: 5,
        axis: .horizontal,
        distribution: .fill)
    
    //MARK: - LAYOUT -
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
        
        days.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(Settings.multiplier)
        }
        hours.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(Settings.multiplier)
        }
        minutes.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(Settings.multiplier)
        }
        seconds.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(Settings.multiplier)
        }
    }
}

private extension UILabel {
    static func makeTimerSegment(_ text: String, font: UIFont, textColor: UIColor = .white, textAlignement: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignement
        label.backgroundColor = .darkGray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 14
        return label
    }
    
    static func makeTimerDivider(font: UIFont, textColor: UIColor = .white, textAlignement: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.text = ":"
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignement
        return label
    }
}
