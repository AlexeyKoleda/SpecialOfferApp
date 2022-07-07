import UIKit
import SnapKit

class MainView: UIView {

    private struct Settings {
        static let firstTitle = "LAST-MINUTE CHANCE!"
        static let secondTitle = "to claim you offer"
        static let discountTitle = "90% OFF"
        static let customerTitle = "for true music fans"
        static let songsTitle = "Hundreds of songs in your pocket"
        static let privacyTitle = "Privacy"
        static let restoreTitle = "Restore"
        static let termsTitle = "Terms"
        static let activateOfferTitle = "ACTIVATE OFFER"
        
        static let backgrounImage = "music"
        
        static let halfMultiplier: CGFloat = 0.5
        static let contentWidthMultiplier: CGFloat = 0.7
    }
    
    var didTapActivateButton: ((RemainingTime) -> Void)?
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.image = UIImage(named: Settings.backgrounImage)
        return backgroundImage
    }()
    
    private let contentContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .black
        container.layer.cornerRadius = 5
        return container
    }()
    
    //MARK: - LABELS -
    private var firstTitle: UILabel = .makeLabel(Settings.firstTitle, font: .systemFont(ofSize: 22, weight: .semibold))
    private var secondTitle: UILabel = .makeLabel(Settings.secondTitle, font: .systemFont(ofSize: 22, weight: .semibold))
    private var discountTitle: UILabel = .makeLabel(Settings.discountTitle, font: .systemFont(ofSize: 50, weight: .black))
    private var customerTitle: UILabel = .makeLabel(Settings.customerTitle, font: .systemFont(ofSize: 15, weight: .semibold))
    private var songsTitle: UILabel = .makeLabel(Settings.songsTitle, font: .systemFont(ofSize: 14, weight: .semibold), textColor: .lightGray)
    
    //MARK: - TIMER -
    let timerView = UIView()

    //MARK: - BUTTON -
    let activateOfferButton: GradientButton = {
        let button = GradientButton(frame: CGRect(x: 0, y: 0, width: 0, height: 60))
        button.addShadow(shadowColor: UIColor(named: "PinkColor")!.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 20, shadowRadius: 20)
        button.setTitle(Settings.activateOfferTitle, for: .normal)
        
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - SYSTEM BUTTONS -
    private var privacyButton: UIButton = .makeSystemBytton(Settings.privacyTitle, font: .systemFont(ofSize: 10, weight: .regular))
    private var restoreButton: UIButton = .makeSystemBytton(Settings.restoreTitle, font: .systemFont(ofSize: 10, weight: .regular))
    private var termsButton: UIButton = .makeSystemBytton(Settings.termsTitle, font: .systemFont(ofSize: 10, weight: .regular))
    private lazy var stackView: UIStackView = .makeStackView([privacyButton, restoreButton, termsButton], spacing: 5, axis: .horizontal)
    
    
    //MARK: - LAYOUT -
    func setupView() {
        setupImageView()
        setupContentContainerView()
    }
    
    private func setupImageView() {
        self.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.halfMultiplier)
        }
    }
    
    private func setupContentContainerView() {
        addSubview(contentContainer)
        contentContainer.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.halfMultiplier)
        }

        contentContainer.addSubview(firstTitle)
        firstTitle.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(contentContainer)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }

        contentContainer.addSubview(secondTitle)
        secondTitle.snp.makeConstraints { make in
            make.top.equalTo(firstTitle.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }

        contentContainer.addSubview(discountTitle)
        discountTitle.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(secondTitle.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }

        contentContainer.addSubview(customerTitle)
        customerTitle.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(discountTitle.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }
        
        contentContainer.addSubview(timerView)
        timerView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(customerTitle.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(41)
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }
        
        contentContainer.addSubview(songsTitle)
        songsTitle.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(timerView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }
        
        contentContainer.addSubview(activateOfferButton)
        activateOfferButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(songsTitle.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(63)
            make.width.equalTo(300)
        }
        
        contentContainer.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier/2)
        }
    }
}

extension UIView {
    func addChildSubviewByPinningEdges(_ view: UIView) {
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension UILabel {
    static func makeLabel(_ text: String, font: UIFont, textColor: UIColor = .white, textAlignement: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignement
        return label
    }
}

extension UIStackView {
    static func makeStackView(_ views: [UIView], spacing: CGFloat, axis: NSLayoutConstraint.Axis = .vertical, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fillEqually) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
}

extension UIButton {
    static func makeSystemBytton(_ title: String, font: UIFont, color: UIColor = .lightGray) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.setTitleColor(color, for: .normal)
        return button
    }
}
