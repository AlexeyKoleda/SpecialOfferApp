import UIKit
import SnapKit

final class MainView: UIView {

    private struct Constants {
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

        static let halfMultiplier: CGFloat = 0.5
        static let contentWidthMultiplier: CGFloat = 0.75
    }

    var didTapActivateButton: ((RemainingTime) -> Void)?

    private let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.image = Assets.music.image
        return backgroundImage
    }()

    private let contentContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .black
        container.layer.cornerRadius = 5
        return container
    }()

    // MARK: - LABELS -
    private let firstTitle: UILabel =
        .makeLabel(Constants.firstTitle, font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    private let secondTitle: UILabel =
        .makeLabel(Constants.secondTitle, font: .systemFont(ofSize: 10.scalable(), weight: .semibold))
    private let discountTitle: UILabel =
        .makeLabel(Constants.discountTitle, font: .systemFont(ofSize: 25.scalable(), weight: .black))
    private let customerTitle: UILabel =
        .makeLabel(Constants.customerTitle, font: .systemFont(ofSize: 6.scalable(), weight: .semibold))
    private let songsTitle: UILabel =
        .makeLabel(Constants.songsTitle, font: .systemFont(ofSize: 6.scalable(), weight: .semibold), color: .lightGray)
    private let xLabel: UILabel =
        .makeLabel(Constants.xButtonTitle, font: .systemFont(ofSize: 6.scalable(), weight: .semibold), color: .gray)

    // MARK: - TIMER -
    let timerView = UIView()

    // MARK: - ACTIVATION BUTTON -
    let activateOfferButton: GradientButton = {
        let button = GradientButton(frame: CGRect(x: 0, y: 0, width: 0, height: 60))
        button.addShadow(
            shadowColor: Colors.pinkColor.color.cgColor,
            shadowOffset: CGSize(width: 0, height: 0),
            shadowOpacity: 20,
            shadowRadius: 20
        )
        button.setTitle(Constants.activateOfferTitle, for: .normal)

        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10.scalable(), weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - SYSTEM BUTTONS -
    private let privacyButton: UIButton =
        .makeSystemBytton(Constants.privacyTitle, font: .systemFont(ofSize: 5.scalable(), weight: .regular))
    private let restoreButton: UIButton =
        .makeSystemBytton(Constants.restoreTitle, font: .systemFont(ofSize: 5.scalable(), weight: .regular))
    private let termsButton: UIButton =
        .makeSystemBytton(Constants.termsTitle, font: .systemFont(ofSize: 5.scalable(), weight: .regular))
    private lazy var systemButtonsStack: UIStackView =
        .makeStackView([privacyButton, restoreButton, termsButton], spacing: 5, axis: .horizontal)

    // MARK: - LAYOUT -
    func setupView() {
        setupHierarchy()
        setupBackgroundConstraints()
        setupContentConstraints()
    }

    private func setupHierarchy() {
        addSubviews([backgroundImage, contentContainer])
        contentContainer.addSubviews(
            [
                firstTitle,
                secondTitle,
                discountTitle,
                customerTitle,
                timerView,
                songsTitle,
                activateOfferButton,
                systemButtonsStack
            ]
        )
        backgroundImage.addSubview(xLabel)
    }

    private func setupBackgroundConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Constants.halfMultiplier)
        }

        xLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(25)
        }
    }

    private func setupContentConstraints() {
        contentContainer.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Constants.halfMultiplier)
        }

        firstTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Constants.contentWidthMultiplier)
        }

        secondTitle.snp.makeConstraints { make in
            make.top.equalTo(firstTitle.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Constants.contentWidthMultiplier)
        }

        discountTitle.snp.makeConstraints { make in
            make.top.equalTo(secondTitle.snp.bottom).offset(5.scalable())
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Constants.contentWidthMultiplier)
        }

        customerTitle.snp.makeConstraints { make in
            make.top.equalTo(discountTitle.snp.bottom).offset(4.scalable())
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Constants.contentWidthMultiplier)
        }

        timerView.snp.makeConstraints { make in
            make.top.equalTo(customerTitle.snp.bottom).offset(5.scalable())
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(15.scalable())
            make.width.equalToSuperview().multipliedBy(Constants.contentWidthMultiplier)
        }

        songsTitle.snp.makeConstraints { make in
            make.top.equalTo(timerView.snp.bottom).offset(8.scalable())
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Constants.contentWidthMultiplier)
        }

        activateOfferButton.snp.makeConstraints { make in
            make.top.equalTo(songsTitle.snp.bottom).offset(8.scalable())
            make.centerX.equalToSuperview()
            make.height.equalTo(30.scalable())
            make.width.equalToSuperview().multipliedBy(Constants.contentWidthMultiplier)
        }

        systemButtonsStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(activateOfferButton.snp.bottom).offset(8.scalable())
            make.width.equalToSuperview().multipliedBy(Constants.contentWidthMultiplier/2)
        }
    }
}
