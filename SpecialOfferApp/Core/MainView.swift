import UIKit
import SnapKit

final class MainView: UIView {

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
        static let xButtonTitle = "✕"
        
        static let backgrounImage = "music"
        
        static let halfMultiplier: CGFloat = 0.5
        static let contentWidthMultiplier: CGFloat = 0.75
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
    private var firstTitle: UILabel = .makeLabel(Settings.firstTitle, font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    private var secondTitle: UILabel = .makeLabel(Settings.secondTitle, font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    private var discountTitle: UILabel = .makeLabel(Settings.discountTitle, font: .systemFont(ofSize: 25.scalable(), weight: .black))
    private var customerTitle: UILabel = .makeLabel(Settings.customerTitle, font: .systemFont(ofSize: 6.scalable(), weight: .semibold))
    private var songsTitle: UILabel = .makeLabel(Settings.songsTitle, font: .systemFont(ofSize: 6.scalable(), weight: .semibold), textColor: .lightGray)
    private var xLabel: UILabel = .makeLabel(Settings.xButtonTitle, font: .systemFont(ofSize: 6.scalable(), weight: .semibold), textColor: .gray)
    
    //MARK: - TIMER -
    let timerView = UIView()

    //MARK: - ACTIVATION BUTTON -
    let activateOfferButton: GradientButton = {
        let button = GradientButton(frame: CGRect(x: 0, y: 0, width: 0, height: 60))
        button.addShadow(shadowColor: UIColor(named: "PinkColor")!.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 20, shadowRadius: 20)
        button.setTitle(Settings.activateOfferTitle, for: .normal)
        
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10.scalable(), weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - SYSTEM BUTTONS -
    private var privacyButton: UIButton = .makeSystemBytton(Settings.privacyTitle, font: .systemFont(ofSize: 5.scalable(), weight: .regular))
    private var restoreButton: UIButton = .makeSystemBytton(Settings.restoreTitle, font: .systemFont(ofSize: 5.scalable(), weight: .regular))
    private var termsButton: UIButton = .makeSystemBytton(Settings.termsTitle, font: .systemFont(ofSize: 5.scalable(), weight: .regular))
    private lazy var systemButtonsStack: UIStackView = .makeStackView([privacyButton, restoreButton, termsButton], spacing: 5, axis: .horizontal)
    
    
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
        
        backgroundImage.addSubview(xLabel)
        xLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(25)
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
            make.top.equalTo(secondTitle.snp.bottom).offset(5.scalable())
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }

        contentContainer.addSubview(customerTitle)
        customerTitle.snp.makeConstraints { make in
            make.top.equalTo(discountTitle.snp.bottom).offset(4.scalable())
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }
        
        contentContainer.addSubview(timerView)
        timerView.snp.makeConstraints { make in
            make.top.equalTo(customerTitle.snp.bottom).offset(5.scalable())
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(15.scalable())
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }
        
        contentContainer.addSubview(songsTitle)
        songsTitle.snp.makeConstraints { make in
            make.top.equalTo(timerView.snp.bottom).offset(8.scalable())
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }
        
        contentContainer.addSubview(activateOfferButton)
        activateOfferButton.snp.makeConstraints { make in
            make.top.equalTo(songsTitle.snp.bottom).offset(8.scalable())
            make.centerX.equalToSuperview()
            make.height.equalTo(30.scalable())
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier)
        }
        
        contentContainer.addSubview(systemButtonsStack)
        systemButtonsStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(activateOfferButton.snp.bottom).offset(8.scalable())
            make.width.equalToSuperview().multipliedBy(Settings.contentWidthMultiplier/2)
        }
    }
}
